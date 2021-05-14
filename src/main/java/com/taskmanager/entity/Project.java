package com.taskmanager.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;
import com.taskmanager.Model;
import lombok.Data;


import javax.persistence.*;
import java.io.Serializable;
import java.util.List;


@Entity
@Table(name = "projects")
public class Project implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long ID;

    private String nameProject;
    @ManyToMany
    private List<User> users;
    // private long usersId; ////
    @OneToMany
    private List<Task> tasks;
    //private long tasksId;

    private String description;

    @ManyToOne
    private User creatorID;

    public Project() {

    }

    public Project(String nameProject, List<User> users, List<Task> tasks, String description, User creatorID) {
        this.nameProject = nameProject;
        this.users = users;
        this.tasks = tasks;
        this.description = description;
        this.creatorID = creatorID;
    }

    public Project(long ID, String nameProject, List<User> users, List<Task> tasks, String description, User creatorID) {
        this.ID = ID;
        this.nameProject = nameProject;
        this.users = users;
        this.tasks = tasks;
        this.description = description;
        this.creatorID = creatorID;
    }

    @Override
    public String toString() {
        return
                "projectID=" + ID +
                        ", nameProject='" + nameProject +
                        ", users=" + users +
                        ", tasks=" + tasks +
                        ", description='" + description +
                        ", creator=" + creatorID;

    }

    public long getID() {
        return ID;
    }

    public void setID(long ID) {
        this.ID = ID;
    }

    public String getNameProject() {
        return nameProject;
    }

    public void setNameProject(String nameProject) {
        this.nameProject = nameProject;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public List<Task> getTasks() {
        return tasks;
    }

    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getCreatorID() {
        return creatorID;
    }

    public void setCreatorID(User creatorID) {
        this.creatorID = creatorID;
    }
}

