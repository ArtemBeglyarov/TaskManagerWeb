package com.taskmanager.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "comment")
public class Comment implements Serializable {

    @Id
    @GenericGenerator(name = "random",strategy = "com.taskmanager.GenerateID")
    @GeneratedValue(generator = "random")
    private long ID;

    private  Date createData;
    private String comment;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User creatorComment;

    @ManyToOne
    @JoinColumn(name ="task_id", nullable = false)
    private Task task;

    public Comment() {

    }

    public Comment(Date createData, String comment, User creatorComment) {
        this.createData = createData;
        this.comment = comment;
        this.creatorComment = creatorComment;

    }

    public Comment(long ID, Date createData, String comment, User creatorComment) {
        this(createData,comment,creatorComment);
        this.ID = ID;
    }
    public long getID() {
        return ID;
    }
    public void setID(long ID) {
        this.ID = ID;
    }

    public Date getCreateData() {
        return createData;
    }

    public void setCreateData(Date createData) {
        this.createData = createData;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public User getCreatorComment() {
        return creatorComment;
    }

    public void setCreatorComment(User creatorComment) {
        this.creatorComment = creatorComment;
    }


    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "ID=" + ID +
                ", creatData=" + createData +
                ", comment='" + comment + '\'' +
                ", creatorComment=" + creatorComment +
                ", taskComment="  +
                '}';
    }
}
