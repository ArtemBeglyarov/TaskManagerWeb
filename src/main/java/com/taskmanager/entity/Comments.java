package com.taskmanager.entity;

import org.hibernate.annotations.GenericGenerator;
import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.TreeSet;

@Entity
@Table(name = "comments")
public class Comments implements Serializable {

    @Id
    @GenericGenerator(name = "random",strategy = "com.taskmanager.GenerateID")
    @GeneratedValue(generator = "random")
    private long ID;

    private  Date createData;
    private String comment;

    @ManyToOne
    @JoinColumn(name = "user_creater_id", nullable = false)
    private User creatorComment;
    @ManyToOne
    private Task commentTask;

    public Comments() {

    }

    public Comments(Date createData, String comment, User creatorComment) {
        this.createData = createData;
        this.comment = comment;
        this.creatorComment = creatorComment;

    }
    public Comments(long ID, Date createData, String comment, User creatorComment) {
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


    @Override
    public String toString() {
        return "Comments{" +
                "ID=" + ID +
                ", creatData=" + createData +
                ", comment='" + comment + '\'' +
                ", creatorComment=" + creatorComment +
                ", taskComment="  +
                '}';
    }
}
