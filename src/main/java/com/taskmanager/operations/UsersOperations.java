package com.taskmanager.operations;


import com.taskmanager.entity.User;
import com.taskmanager.repository.UserRepository;

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
             userRepository.create(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void removeUserById(long id) {
        try {
            userRepository.delete(id);
        }  catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public User findUser(long id) {
        try {
       return userRepository.find(id);
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
    public void updateUser(User user) {
        try {
        userRepository.update(user);
        } catch (SQLException e) {
            throw new RuntimeException();
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
