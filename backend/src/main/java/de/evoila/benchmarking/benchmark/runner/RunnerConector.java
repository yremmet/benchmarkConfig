package de.evoila.benchmarking.benchmark.runner;

import com.amazonaws.util.StringInputStream;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import de.evoila.benchmarking.data.runner.Runner;
import org.springframework.stereotype.Component;

import java.io.*;

/**
 * Created by enat on 03/11/2016.
 */
@Component
public class RunnerConector {


    public void connect(Runner runner){
        JSch jSch = new JSch();

        try {
            Session sshSession = getSession(runner, jSch);
            setSecutitySettings(sshSession);
            sshSession.connect();
            openShellChannel(runner, sshSession);
        } catch (JSchException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void openShellChannel(Runner runner, Session sshSession) throws JSchException, IOException {
        Channel channel = sshSession.openChannel("shell");
        channel.connect();
        runner.setChannel(channel);
        //shellToSout(channel);
    }

    private void shellToSout(final Channel channel) {
        new Thread(() -> {
            BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(System.out));
            try {
                BufferedReader reader = new BufferedReader(new InputStreamReader(channel.getInputStream()));
                String line = reader.readLine();
                while (line != null ){
                    writer.write(line+"\n");
                    writer.flush();
                    line = reader.readLine();
                }

            } catch (IOException e) {
                e.printStackTrace();
            }
        }).start();
    }

    private void setSecutitySettings(Session sshSession) {
        java.util.Properties config = new java.util.Properties();
        config.put("StrictHostKeyChecking", "no");
        sshSession.setConfig(config);
    }

    private Session getSession(Runner runner, JSch jSch) throws JSchException {
        jSch.addIdentity("tmp", runner.getSshKey().getBytes(),new byte[0], new byte[0]);
        return jSch.getSession(runner.getUsername(),runner.getHostname());
    }
}
