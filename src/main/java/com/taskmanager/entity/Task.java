package com.taskmanager.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.Data;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
    //private final long DEFAULT_LONG = -1;
    public final Priority DEFAULT_PRIORITY = Priority.NORMAL;
    public final Status DEFAULT_STATUS = Status.OPEN;

    public Task() {

    }
    public Task( String name, Status status, Priority priority, String description,
                Date startData, Date duoDate, Date endDate, long projectId, long reporterId, long assigneeId) {
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

    public Task(long ID, String name, Status status, Priority priority, String description,
                Date startData, Date duoDate, Date endDate, long projectId, long reporterId, long assigneeId) {
        this.ID = ID;
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

    public long getID() {
        return ID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Priority getPriority() {
        return priority;
    }

    public void setPriority(Priority priority) {
        this.priority = priority;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getStartData() {
        return startData;
    }

    public void setStartData(Date startData) {
        this.startData = startData;
    }

    public Date getDuoDate() {
        return duoDate;
    }

    public void setDuoDate(Date duoDate) {
        this.duoDate = duoDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public long getProjectId() {
        return projectId;
    }

    public void setProjectId(long projectId) {
        this.projectId = projectId;
    }

    public long getReporterId() {
        return reporterId;
    }

    public void setReporterId(long reporterId) {
        this.reporterId = reporterId;
    }

    public long getAssigneeId() {
        return assigneeId;
    }

    public void setAssigneeId(long assigneeId) {
        this.assigneeId = assigneeId;
    }

    public Priority getDEFAULT_PRIORITY() {
        return DEFAULT_PRIORITY;
    }

    public Status getDEFAULT_STATUS() {
        return DEFAULT_STATUS;
    }

    @Override
    public String toString() {
        return "Task{" +
                "ID=" + ID +
                ", name='" + name + '\'' +
                ", status=" + status +
                ", priority=" + priority +
                ", description='" + description + '\'' +
                ", startData=" + startData +
                ", duoDate=" + duoDate +
                ", endDate=" + endDate +
                ", projectId=" + projectId +
                ", reporterId=" + reporterId +
                ", assigneeId=" + assigneeId +
                ", DEFAULT_PRIORITY=" + DEFAULT_PRIORITY +
                ", DEFAULT_STATUS=" + DEFAULT_STATUS +
                '}';
    }
}
