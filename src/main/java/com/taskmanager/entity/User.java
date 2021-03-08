package com.taskmanager.entity;


import com.fasterxml.jackson.annotation.*;
import com.taskmanager.Model;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

@JsonView
@Entity(name = "tm_user")
public class User implements Serializable {

    @JsonProperty("id")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  long ID;

    private String firstName;

    private String lastName;

    private String userName;

    private String password;


    public User() {

    }

    public User(String firstName, String lastName, String userName, String password) {

//        this.ID =Model.createID(User.class);
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.password = password;
    }

    public long getID() {
        return ID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User - " + userName +
                " " + "ID  - " + ID +
                " " + "First Name  - " + firstName +
                " " + "Last Name  - " + lastName +
                " " + "Password - " + password;
    }
}
