package com.taskmanager.operations;


import com.taskmanager.entity.UserEntity;
import com.taskmanager.repository.UserRepository;

import javax.ejb.Stateless;
import javax.inject.Inject;
import java.sql.SQLException;
import java.util.ArrayList;

@Stateless
public class UsersOperations {

    @Inject
    UserRepository userRepository;

    public void createUser(UserEntity userEntity) {
        try{
             userRepository.createUser(userEntity);
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
    public UserEntity findUser(String id) {
        try {
       return userRepository.findUserById(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
  public ArrayList<UserEntity> findAllUser() {
        try {
       return userRepository.findAllUsers();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateUser(UserEntity userEntity) {
        try {
        userRepository.updateUser(userEntity);
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }
    public UserEntity loginUser(String userName, String password) {
        try {
            return userRepository.loginUser(userName, password);
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

}
