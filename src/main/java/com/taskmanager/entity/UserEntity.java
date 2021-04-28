package com.taskmanager.entity;



import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
public class UserEntity implements Serializable {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private  long ID;

    private String firstName;

    private String lastName;

    private String userName;

    private String password;

    private String status;


    public UserEntity() {

    }

    public UserEntity(String firstName, String lastName, String userName, String password, String status) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.password = password;
        this.status = status;

    }public UserEntity(Long id, String firstName, String lastName, String userName, String password, String status) {
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
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;}
    @Override
    public String toString() {
        return "User: " + userName +
                ";  " + "Id: " + ID +
                ";  " + "First Name: " + firstName +
                ";  " + "Last Name: " + lastName +
                ";  " + "Password: " + password +
                ";  " + "Status: " + status;
    }
}
