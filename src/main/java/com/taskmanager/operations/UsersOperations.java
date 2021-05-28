package com.taskmanager.operations;


import com.taskmanager.entity.User;
import com.taskmanager.repository.UserRepositoryHibernate;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.inject.Inject;
import java.sql.SQLException;
import java.util.List;

@Stateless
public class UsersOperations {


    @Inject
    UserRepositoryHibernate userRepositoryHibernate;

    public User createUser(User user) {
        return userRepositoryHibernate.create(user);
    }

    public void removeUserById(long id) {
        userRepositoryHibernate.delete(id);
    }

    public User findUser(long id) {
        return userRepositoryHibernate.find(id);

    }

    public void updateUser(User user) {
        userRepositoryHibernate.update(user);
    }

    public User loginUser(String userName, String password) {
        User user = userRepositoryHibernate.login(userName);
        return password.equals(user.getPassword()) ? user : null;
    }

    public List<User> findUsers() throws SQLException {
        return userRepositoryHibernate.findAll();
    }
}
