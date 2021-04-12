package com.taskmanager.repository;

import com.taskmanager.entity.User;
import liquibase.pro.packaged.U;

import javax.annotation.Resource;
import javax.enterprise.context.ApplicationScoped;
import javax.sql.DataSource;
import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


@ApplicationScoped
public class UserRepository implements Serializable {

    @Resource(lookup = "java:/AppDS")
    DataSource dataSource;

    private static final String insertUserQuery = "INSERT INTO users VALUES (DEFAULT,?,?,?,?,?)";
    private static final String findUser = "SELECT * FROM users WHERE id IN (?)";
    private static final String loginUser = "SELECT * FROM users WHERE user_name =(?) and password =(?)";
    private static final String findAllUser = "SELECT * FROM users";
    private static final String removeUser = "DELETE FROM users WHERE id IN (?)";

    public void createUser(User user) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(insertUserQuery);
        statement.setString(1, user.getFirstName());
        statement.setString(2, user.getLastName());
        statement.setString(3, user.getUserName());
        statement.setString(4, user.getPassword());
        statement.setString(5, user.getStatus());
        statement.executeUpdate();

    }
    public User findUserById(String id) throws SQLException{
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(findUser);
        Integer ID = Integer.parseInt(id);
        statement.setInt(1,ID);

        User user = new User();
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
        user.setID(resultSet.getInt("id"));
        user.setFirstName(resultSet.getString("first_name"));
        user.setLastName(resultSet.getString("last_name"));
        user.setUserName(resultSet.getString("user_name"));
        user.setPassword(resultSet.getString("password"));
        user.setStatus(resultSet.getString("status"));
        }
     return user;
    }

    public void removeUser(String id) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(removeUser);
        Long longID = Long.parseLong(id);
        statement.setLong(1, longID);
        statement.executeUpdate();

    }

    public ArrayList<User> findAllUsers() throws SQLException {
        ArrayList<User> users = new ArrayList<User>();
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(findAllUser);

            while (resultSet.next()) {
                User user = new User();
                user.setID(resultSet.getInt("id"));
                user.setFirstName(resultSet.getString("first_name"));
                user.setLastName(resultSet.getString("last_name"));
                user.setUserName(resultSet.getString("user_name"));
                user.setPassword(resultSet.getString("password"));
                user.setStatus(resultSet.getString("status"));
             users.add(user);
            }

        return users;
    }
    public void updateUser(String id) {


    }
    public User loginUser(String userName,String password) throws SQLException {

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(loginUser);

        statement.setString(1, userName);
        statement.setString(2, password);

        User user = new User();
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            user.setID(resultSet.getInt("id"));
            user.setFirstName(resultSet.getString("first_name"));
            user.setLastName(resultSet.getString("last_name"));
            user.setUserName(resultSet.getString("user_name"));
            user.setPassword(resultSet.getString("password"));
            user.setStatus(resultSet.getString("status"));
        }
        return user;
    }

}
