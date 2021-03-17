package com.taskmanager.repository;

import com.taskmanager.entity.User;

import javax.annotation.Resource;
import javax.enterprise.context.ApplicationScoped;
import javax.sql.DataSource;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@ApplicationScoped
public class UserRepository implements Serializable {

    @Resource(lookup = "java:/AppDS")
    DataSource dataSource;

    private static final String insertUserQuery = "INSERT INTO users VALUES (DEFAULT,?,?,?,?)";
    private static final String findUser = "SELECT * FROM users WHERE id IN (?)";
    private static final String removeUser = "DELETE FROM users WHERE id IN (?)";

    public String createUser(User user) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(insertUserQuery);
        statement.setString(1, user.getFirstName());
        statement.setString(2,user.getLastName());
        statement.setString(3,user.getUserName());
        statement.setString(4,user.getPassword());
        statement.executeUpdate();
    }
//    public User findUserById(long id) throws SQLException{
//        Connection connection = dataSource.getConnection();
//        PreparedStatement statement = connection.prepareStatement(findUser);
//        statement.setString(1,get);
//    }
//
    public void removeUser(String id) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(removeUser);
        statement.setString(1,id);
        statement.executeUpdate();

    }
    public
}
