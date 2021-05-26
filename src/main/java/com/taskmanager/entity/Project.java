package com.taskmanager.entity;


import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

import static javax.persistence.CascadeType.ALL;


@Entity
@Table(name = "projects")
public class Project implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long ID;

    private String nameProject;
    @ManyToMany(fetch = FetchType.EAGER)
    @LazyCollection(LazyCollectionOption.FALSE)
    private Set<User> users;
    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(targetEntity = Task.class, cascade = ALL, mappedBy = "project", fetch = FetchType.EAGER)
    private Set<Task> tasks;
    private String description;
    @ManyToOne
    @JoinColumn(name = "creator_id", nullable = false)
    private User creator;

    public Project() {

    }

    public Project(String nameProject, Set<User> users, Set<Task> tasks, String description, User creator) {
        this.nameProject = nameProject;
        this.users = users;
        this.tasks = tasks;
        this.description = description;
        this.creator = creator;
    }

    public Project(long ID, String nameProject, Set<User> users, Set<Task> tasks, String description, User creator) {
        this(nameProject, users, tasks, description, creator);
        this.ID = ID;

    }

    @Override
    public String toString() {
        return
                "projectID=" + ID +
                        ", nameProject='" + nameProject +
                        ", users=" + users +
                        ", tasks=" + tasks +
                        ", description='" + description +
                        ", creator=" + creator;

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

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    public Set<Task> getTasks() {
        return tasks;
    }

    public void setTasks(Set<Task> tasks) {
        this.tasks = tasks;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }
}

