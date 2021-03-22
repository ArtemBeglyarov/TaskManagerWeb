package com.taskmanager;


import com.taskmanager.entity.User;
import com.taskmanager.repository.UserRepository;

import javax.ejb.Stateless;
import javax.inject.Inject;
import java.sql.SQLException;

@Stateless
public class UsersOperations {

    @Inject
    UserRepository userRepository;

    public Long createUser(User user) {
        try{
            userRepository.createUser(user);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public void removeUserById(String id) {
        try {
            userRepository.removeUser(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public User findUser(String id) {
        try {
       userRepository.findUserById(id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    return null;
    }

}
