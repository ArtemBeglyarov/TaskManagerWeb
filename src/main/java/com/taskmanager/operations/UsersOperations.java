package com.taskmanager.operations;


import com.taskmanager.entity.User;
import com.taskmanager.repository.UserRepository;
import liquibase.pro.packaged.S;

import javax.ejb.Stateless;
import javax.inject.Inject;
import java.sql.SQLException;
import java.util.ArrayList;

@Stateless
public class UsersOperations {

    @Inject
    UserRepository userRepository;

    public void createUser(User user) {
        try{
             userRepository.createUser(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void removeUserById(String id) {
        try {
            userRepository.removeUser(id);
        }  catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public User findUser(String id) {
        try {
       return userRepository.findUserById(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
  public ArrayList<User> findAllUser() {
        try {
       return userRepository.findAllUsers();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public User loginUser(String userName, String password) {
        try {
            return userRepository.loginUser(userName, password);
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

}
