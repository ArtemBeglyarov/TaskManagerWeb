package com.taskmanager;


import com.taskmanager.entity.User;
import com.taskmanager.repository.UserRepository;

import javax.ejb.Stateless;
import javax.inject.Inject;
import java.sql.SQLException;

@Stateless
public class UserService {

    @Inject
    UserRepository userRepository;

    public void saveUser(User user) {
        try {
            userRepository.createUser(user);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
