package com.taskmanager.entity;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import static javax.persistence.CascadeType.ALL;


@Entity
@Table(name = "tasks")
public class Task implements Serializable {

    public enum Priority {
        HIGHEST,
        HIGH,
        NORMAL,
        LOW;

        public static Priority get(String name){
            for(Priority priority : Priority.values()){
                if(name.equalsIgnoreCase(priority.name())) return priority;
            }
            return null;
        }
    }

    public enum Status {
        OPENED, //createdate
        IN_PROGRESS, // startdate
        RESOLVE, // end date
        ADDITIONAL_INFO_REQUIRED,
        INFO_PROVIDED,
        CLOSED,
        CANCELLED,
        RE_OPENED; // end date = null
        public static Status get(String name){
            for(Status status : Status.values()){
                if(name.equalsIgnoreCase(status.name())) return status;
            }
            return null;
        }
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
    @JoinColumn(name = "project_id", nullable = false)
    private Project project;
    @ManyToOne
    @JoinColumn(name = "reporter_id", nullable = false)
    private User reporter;// исполнитель задачи
    @ManyToOne
    @JoinColumn(name = "asignee_id", nullable = true)
    private User assignee; //создател задачи

    //TODO если сгенерируется 0
    //private final long DEFAULT_LONG = -1;

    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(targetEntity = Comment.class, cascade = ALL, fetch = FetchType.EAGER)
    private Set<Comment> comments;

    public Task() {
        priority = Priority.NORMAL;
        status = Status.OPENED;
    }

    public Task(String name, Status status, Priority priority, String description,
                Date startData, Date dueDate, Date endDate, Date createDate, Project project, User reporter, User assignee, Set<Comment> comments) {
        this();
        this.name = name;
        this.status = status;
        this.priority = priority;
        this.description = description;
        this.startData = startData;
        this.dueDate = dueDate;
        this.endDate = endDate;
        this.project = project;
        this.reporter = reporter;
        this.assignee = assignee;
        this.createDate = createDate;
        this.comments = comments;
    }

    public Task(long ID, Set<Comment> comments, String name, Status status, Priority priority, String description,
                Date startData, Date dueDate, Date endDate, Date createDate, Project project, User reporter, User assignee) {
        this(name, status, priority, description, startData, dueDate, endDate, createDate, project, reporter, assignee,comments);
        this.ID = ID;

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

    public User getReporter() {
        return reporter;
    }

    public void setReporter(User reporter) { ////
        this.reporter = reporter;
    }

    public User getAssignee() {
        return assignee;
    }

    public void setAssignee(User assignee) {
        this.assignee = assignee;
    }////изменил на assegneeId


    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }
    public void addComment(Comment comment) {
        comments.add(comment);
        comment.setTask(this);
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
                ", reporterId=" + reporter +
                ", assigneeId=" + assignee +
                '}';


    }
}
