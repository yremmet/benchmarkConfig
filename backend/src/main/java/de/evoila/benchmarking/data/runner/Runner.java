package de.evoila.benchmarking.data.runner;

import javax.persistence.*;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.JSch;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;

/**
 * Created by enat on 08/11/2016.
 */

@Entity
@Table(name = "Runner")
public class Runner {
    @Id
    @GeneratedValue
    private Long   id;

    private String hostname;
    private String username;
    private String sshKey;
    private String queue;

    @Transient
    private Channel channel;
    @Transient
    private BufferedWriter writer;

    public Long getId() {
        return id;
    }

    public String getHostname() {
        return hostname;
    }

    public void setHostname(String hostname) {
        this.hostname = hostname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSshKey() {
        return sshKey;
    }

    public void setSshKey(String sshKey) {
        this.sshKey = sshKey;
    }

    public Channel getChannel() {
        return channel;
    }

    public void setChannel(Channel channel) throws IOException {
        this.channel = channel;
        if(this.isConnected()){
            writer = new BufferedWriter(new OutputStreamWriter(channel.getOutputStream()));
        }
    }

    public String getQueue() {
        return queue;
    }

    public void setQueue(String queue) {
        this.queue = queue;
    }

    public boolean isConnected() {
        if(channel == null)
            return false;
        return channel.isConnected();
    }

    public boolean sendFile(String fileName, String fileContent) throws IOException {
        // TODO Open SCP channel instead
        if(!isConnected())
            return false;
        String[] lines = fileContent.split("\n");

        this.sendCommand(String.format("rm %s", fileName));

        for (String line :lines) {
            writer.write(String.format("echo '%s' >> %s\n", line, fileName));
        }
         writer.flush();
        return true;
    }

    public boolean sendCommand(String command) throws IOException {
        if(!isConnected())
            return false;
        writer.write(command);
        writer.write("\n");
        writer.flush();
        return true;
    }

    public void configureNewRunner(){
        /*
         *  1. Check/Update Python Version
         *  2. Check out PerkitBenchmarker
         *  3. Setup Openstack / AWS / GCD Clis
         *
         *  Needs State?
         */
    }

    public void closeConnection() throws IOException {
        if(isConnected()){
            writer.close();
            writer = null;
            channel.disconnect();
            channel = null;
        }
    }
}
