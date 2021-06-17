package com.taskmanager.entity;


import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;


@Entity
@Table(name = "projects")
public class Project implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long ID;

    private String name;
    @ManyToMany(fetch = FetchType.EAGER,mappedBy = "projects")
    @LazyCollection(LazyCollectionOption.FALSE)
    private Set<User> users;
    @LazyCollection(LazyCollectionOption.FALSE)
    @OneToMany(targetEntity = Task.class, orphanRemoval = true, mappedBy = "project", fetch = FetchType.EAGER)
    private Set<Task> tasks;
    private String description;
    @ManyToOne
    @JoinColumn(name = "creator_id", nullable = false)
    private User creator;

    public Project() {

    }

    public Project(String name, Set<User> users, Set<Task> tasks, String description, User creator) {
        this.name = name;
        this.users = users;
        this.tasks = tasks;
        this.description = description;
        this.creator = creator;
    }

    public Project(long ID, String name, Set<User> users, Set<Task> tasks, String description, User creator) {
        this(name, users, tasks, description, creator);
        this.ID = ID;

    }

    @Override
    public String toString() {
        return
                "projectID=" + ID +
                        ", nameProject='" + name +
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }
    public void addUsers(User user){
       users.add(user);

    }

    public  void deleteUser(User user){
        users.remove(user);
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

