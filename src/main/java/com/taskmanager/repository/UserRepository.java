package com.taskmanager.repository;

import com.taskmanager.entity.User;

import javax.annotation.Resource;
import javax.enterprise.context.ApplicationScoped;
import javax.sql.DataSource;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@ApplicationScoped
public class UserRepository implements Serializable {

    @Resource(lookup = "java:/AppDS")
    DataSource dataSource;

    private static final String insertUserQuery = "INSERT INTO users VALUES (?,?,?,?,?)" ;

    public void createUser(User user) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(insertUserQuery);

        statement.setLong(1,user.getID());
        statement.setString(2, user.getFirstName());
        statement.setString(3,user.getLastName());
        statement.setString(4,user.getUserName());
        statement.setString(5,user.getPassword());
        statement.executeUpdate();
    }
//    public User findByUser(long id) {
//
//    }
//
//    public void removeUser(long id) {
//
//    }

}
