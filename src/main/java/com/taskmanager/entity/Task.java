package com.taskmanager.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@Table(name = "TASK")
public class Task implements Serializable {

    public enum Priority {
        HIGHEST,
        HIGH,
        NORMAL,
        LOW,
    }

    public enum Status {
        OPEN,
        SUSPENDED, //endDate
        ASSIGNED, //появляется пользователь
        DISCUSSION, //startDate
        CLOSED, //

    }
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long ID;
    private String name;
    private Status status;
    private Priority priority;
    private String description;
    private Date startData;
    private Date dueDate; //ожидание конца работы
    private Date endDate;
    private Date createDate;
    @ManyToOne
    private Project project;
    @ManyToOne
    private User reporterId;// исполнитель задачи
    @ManyToOne
    private User assigneeId; //создател задачи
    //TODO если сгенерируется 0
    //private final long DEFAULT_LONG = -1;
    public final Priority DEFAULT_PRIORITY = Priority.NORMAL;
    public final Status DEFAULT_STATUS = Status.OPEN;

    public Task() {
    priority = DEFAULT_PRIORITY;
    status = DEFAULT_STATUS;
    }
    public Task(String name, Status status, Priority priority, String description,
                Date startData, Date dueDate, Date endDate, Date createDate, Project project, User reporterId, User assigneeId) {
        this.name = name;
        this.status = status;
        this.priority = priority;
        this.description = description;
        this.startData = startData;
        this.dueDate = dueDate;
        this.endDate = endDate;
        this.project = project;
        this.reporterId = reporterId;
        this.assigneeId = assigneeId;
        this.createDate = createDate;
    }

    public Task( long ID, String name, Status status, Priority priority, String description,
                Date startData, Date dueDate, Date endDate, Date createDate, Project project, User reporterId, User assigneeId) {
        this.ID = ID;
        this.name = name;
        this.status = status;
        this.priority = priority;
        this.description = description;
        this.startData = startData;
        this.dueDate = dueDate;
        this.endDate = endDate;
        this.project = project;
        this.reporterId = reporterId;
        this.assigneeId = assigneeId;
        this.createDate = createDate;
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

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public User getReporterId() {
        return reporterId;
    }

    public void setReporterId(User reporterId) {
        this.reporterId = reporterId;
    }

    public User getAssigneeId() {
        return assigneeId;
    }

    public void setAssigneeId(User assigneeId) {
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
                ", duoDate=" + dueDate +
                ", endDate=" + endDate +
                ", projectId=" + project +
                ", reporterId=" + reporterId +
                ", assigneeId=" + assigneeId +
                ", DEFAULT_PRIORITY=" + DEFAULT_PRIORITY +
                ", DEFAULT_STATUS=" + DEFAULT_STATUS +
                '}';
    }
}
