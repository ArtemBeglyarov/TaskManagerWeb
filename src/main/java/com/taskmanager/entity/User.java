package com.taskmanager.entity;


import liquibase.pro.packaged.S;

import java.io.Serializable;


public class User implements Serializable {



    private  long ID;

    private String firstName;

    private String lastName;

    private String userName;

    private String password;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    private String status;


    public User() {

    }

    public User(String firstName, String lastName, String userName, String password,String status) {

        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.password = password;
        this.status = status;

    } public User(Long id, String firstName, String lastName, String userName, String password, String status) {
        this.ID = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.password = password;
        this.status = status;
    }

    public long getID() {
        return ID;
    }
    public void setID(long ID) {
        this.ID = ID;
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
