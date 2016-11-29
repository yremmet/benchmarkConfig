package de.evoila.benchmarking.benchmark.runner;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * @author Yannic Remmet
 * @version 0.0.1
 *          created:  17/11/2016.
 */
public class ResponseMessage {
    Long runnerid;
    Long runId;
    String status;

    public ResponseMessage(){
    }

    public ResponseMessage(long runnerid, long runId, String status){
        setRunId(runId);
        setRunnerid(runnerid);
        setStatus(status);
    }

    public Long getRunnerid() {
        return runnerid;
    }

    @JsonProperty("RunnerId")
    public void setRunnerid(Long runnerid) {
        this.runnerid = runnerid;
    }

    public Long getRunId() {
        return runId;
    }

    @JsonProperty("RunId")
    public void setRunId(Long runId) {
        this.runId = runId;
    }

    public String getStatus() {
        return status;
    }

    @JsonProperty("Status")
    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return String.format("Runner: %d , Run: %d, State: %s", runnerid, runId, status);
    }
}
