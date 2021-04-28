package com.taskmanager.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;
import com.taskmanager.Model;
import lombok.Data;


import java.io.Serializable;
import java.util.List;

@Data
@JsonView
public class Project implements Serializable  {
    @JsonProperty("id")
    private  long ID;

    private String nameProject;

    //private List<User> users;
    private List<Long> usersId;

    //private List<Task> tasks;
    private List<Long> tasksId;

    private String description;

    private Long creatorID;


    public Project() {

    }

    public Project(String nameProject, List<Long> usersID, List<Long> tasksID, String description, Long creatorID) {
        this.nameProject = nameProject;
        this.usersId = usersID;
        this.tasksId = tasksID;
        this.description = description;
        this.creatorID = creatorID;
    }
    public Project( long ID, String nameProject, List<Long> usersID, List<Long> tasksID, String description, Long creatorID) {
        this.ID = ID;
        this.nameProject = nameProject;
        this.usersId = usersID;
        this.tasksId = tasksID;
        this.description = description;
        this.creatorID = creatorID;
    }

    @Override
    public String toString() {
        return
                "projectID=" + ID +
                        ", nameProject='" + nameProject +
                        ", users=" + usersId +
                        ", tasks=" + tasksId +
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

    public List<Long> getUsersId() {
        return usersId;
    }

    public void setUsersId(List<Long> usersId) {
        this.usersId = usersId;
    }

    public List<Long> getTasksId() {
        return tasksId;
    }

    public void setTasksId(List<Long> tasksId) {
        this.tasksId = tasksId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getCreatorID() {
        return creatorID;
    }

    public void setCreatorID(Long creatorID) {
        this.creatorID = creatorID;
    }
}
