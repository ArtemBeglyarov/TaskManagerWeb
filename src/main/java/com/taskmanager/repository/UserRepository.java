package com.taskmanager.repository;

import com.taskmanager.entity.User;

import javax.annotation.Resource;
import javax.enterprise.context.ApplicationScoped;
import javax.sql.DataSource;
import java.io.Serializable;
import java.sql.*;


@ApplicationScoped
public class UserRepository implements Serializable {

    @Resource(lookup = "java:/AppDS")
    DataSource dataSource;

    private static final String insertUserQuery = "INSERT INTO users VALUES (DEFAULT,?,?,?,?)";
    private static final String findUser = "SELECT * FROM users WHERE id IN (?)";
    private static final String removeUser = "DELETE FROM users WHERE id IN (?)";

    public void createUser(User user) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(insertUserQuery);
        statement.setString(1, user.getFirstName());
        statement.setString(2,user.getLastName());
        statement.setString(3,user.getUserName());
        statement.setString(4,user.getPassword());
        statement.executeUpdate();
    }
//    public User findUserById(String id) throws SQLException{
//        Connection connection = dataSource.getConnection();
//        Statement statement = connection.createStatement();
//        ResultSet resultSet = statement.executeQuery(findUser);
//        Long longID = Long.parseLong(id);
//        User user = new User();
//        while (resultSet.next()) {
//        user.setID(resultSet.getInt("id"));
//        user.setFirstName(resultSet.getString("first_name"));
//        user.setLastName(resultSet.getString("last_name"));
//        user.setUserName(resultSet.getString("user_name"));
//        user.setPassword(resultSet.getString("password"));
//        }
//     return user;
//    }

    public void removeUser(String id) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(removeUser);
        Long longID = Long.parseLong(id);
        statement.setLong(1,longID);
        statement.executeUpdate();

    }
}
