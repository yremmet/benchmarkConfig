package de.evoila.benchmarking.benchmark.runner;

/**
 * @author Yannic Remmet
 * @version 0.0.1
 *          created:  14/11/2016.
 */
public class AmqpMessage {
    private final long runId;
    private final String name;
    private final String configuration;
    private final String flags;

    public AmqpMessage(Long id, String name, String configuartion, String flags) {
        this.runId = id;
        this.flags=flags;
        this.configuration = configuartion;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getConfiguration() {
        return configuration;
    }

    public String getFlags() {
        return flags;
    }

    public long getRunId() {
        return runId;
    }
}
