package de.evoila.benchmarking;

import de.evoila.benchmarking.benchmark.runner.Messaging;
import de.evoila.benchmarking.benchmark.runner.ResponseMessage;
import org.apache.catalina.Context;
import org.apache.catalina.connector.Connector;
import org.apache.tomcat.util.descriptor.web.SecurityCollection;
import org.apache.tomcat.util.descriptor.web.SecurityConstraint;

import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.core.TopicExchange;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.listener.SimpleMessageListenerContainer;
import org.springframework.amqp.rabbit.listener.adapter.MessageListenerAdapter;
import org.springframework.amqp.support.converter.*;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.EmbeddedServletContainerFactory;
import org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedServletContainerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@SpringBootApplication
@ComponentScan({"de.evoila.benchmarking"})
@EnableScheduling
public class BenchmarkApplication {

    private static final String queueName = "benchmark-runner-response";

    public static void main(String[] args) {
        SpringApplication.run(BenchmarkApplication.class, args);
    }

    @Bean
    public WebMvcConfigurerAdapter adapter() {
        return new WebMvcConfigurerAdapter() {
            @Override
            public void addInterceptors(InterceptorRegistry registry) {
                super.addInterceptors(registry);
                
            }
        };
    }
    
    /*
     * Redirects all traffic to https port 8443
     * Make sure ports correspond to settings in application.properties
     * Necessary for basic-auth to encrypt login data
     */
    
    @Bean
    public EmbeddedServletContainerFactory servletContainer() {
      TomcatEmbeddedServletContainerFactory tomcat = new TomcatEmbeddedServletContainerFactory() {
          @Override
          protected void postProcessContext(Context context) {
            SecurityConstraint securityConstraint = new SecurityConstraint();
            securityConstraint.setUserConstraint("CONFIDENTIAL");
            SecurityCollection collection = new SecurityCollection();
            collection.addPattern("/*");
            securityConstraint.addCollection(collection);
            context.addConstraint(securityConstraint);
          }
        };
      
      tomcat.addAdditionalTomcatConnectors(initiateHttpConnector());
      return tomcat;
    }
    /* Enable AMQP Reciver */
    @Bean
    SimpleMessageListenerContainer container(ConnectionFactory connectionFactory, Messaging messaging) {
        // Create Queue;
        Queue queue = new Queue(queueName, true);
        BindingBuilder.bind(queue).to(new TopicExchange("amq.topic")).with("runner.response");

        // Create Container

        SimpleMessageListenerContainer container = new SimpleMessageListenerContainer();
        container.setConnectionFactory(connectionFactory);
        container.setQueueNames(queue.getName());


        // TODO Fix this
        //Create MessageListener
        Jackson2JsonMessageConverter messageConverter = new Jackson2JsonMessageConverter();
        DefaultClassMapper classMapper = new DefaultClassMapper();
        classMapper.setDefaultType(ResponseMessage.class);
        messageConverter.setClassMapper(classMapper);

        MessageListenerAdapter listenerAdapter = new MessageListenerAdapter(messaging);
        listenerAdapter.setMessageConverter(messageConverter);
        container.setMessageListener(listenerAdapter);
        return container;
    }

    private Connector initiateHttpConnector() {
      Connector connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
      connector.setScheme("http");
      connector.setPort(8080);
      connector.setSecure(false);
      connector.setRedirectPort(8443);
      
      return connector;
    }
    
    
    
    
    
    
}


