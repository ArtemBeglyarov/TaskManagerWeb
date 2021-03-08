package com.taskmanager.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;
import com.taskmanager.Model;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

@Data
@JsonView
public class Task implements Serializable {
    public enum Priority {
        HIGHEST,
        HIGH,
        NORMAL,
        LOW,
    }

    public enum Status {
        OPEN,
        SUSPENDED,
        ASSIGNED,
        DISCUSSION,
        CLOSED,

    }

    @JsonProperty("id")
    private long ID;
    private String name;
    private Status status;
    private Priority priority;
    private String description;
    private Date startData;
    private Date duoDate;
    private Date endDate;
    private long projectId;
    private long reporterId; // исполнитель задачи
    private long assigneeId; //создател задачи
    //TODO если сгенерируется 0
    private final long DEFAULT_LONG = -1;
    public final Priority DEFAULT_PRIORITY = Priority.NORMAL;
    public final Status DEFAULT_STATUS = Status.OPEN;

    public Task() {

    }

    public Task(String name, Status status, Priority priority, String description,
                Date startData, Date duoDate, Date endDate, long projectId, long reporterId, long assigneeId) {
//        this.ID = Model.createID(Task.class);
        this.name = name;
        this.status = status;
        this.priority = priority;
        this.description = description;
        this.startData = startData;
        this.duoDate = duoDate;
        this.endDate = endDate;
        this.projectId = projectId;
        this.reporterId = reporterId;
        this.assigneeId = assigneeId;
    }


}
