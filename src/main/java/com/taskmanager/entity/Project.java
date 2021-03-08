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
//        this.ID = Model.createID(Project.class);
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


}
