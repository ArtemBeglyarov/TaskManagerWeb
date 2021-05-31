package com.taskmanager.repository;

import com.taskmanager.entity.User;

import javax.annotation.Resource;
import javax.enterprise.context.ApplicationScoped;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;


@ApplicationScoped
public class UserRepository  {

    @Resource(lookup = "java:/AppDS")
   private DataSource dataSource;

    private static final String insertUserQuery = "INSERT INTO users VALUES (DEFAULT,?,?,?,?,?)";
    private static final String findUser = "SELECT * FROM users WHERE id IN (?)";
    private static final String loginUser = "SELECT * FROM users WHERE user_name =(?) and password =(?)";
    private static final String findAllUser = "SELECT * FROM users";
    private static final String removeUser = "DELETE FROM users WHERE id IN (?)";
    private static final String updateUser = "UPDATE users SET first_name=(?),last_name =(?),user_name = (?), password=(?), status =(?) WHERE id IN (?)";


    /*@Override
    public User create(User user) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(insertUserQuery);
        statement.setString(1, user.getFirstName());
        statement.setString(2, user.getLastName());
        statement.setString(3, user.getUserName());
        statement.setString(4, user.getPassword());
        statement.setString(5, user.getStatus());
        statement.executeUpdate();
        ResultSet resultSet = statement.getGeneratedKeys();
        if (resultSet.next()) {
            user.setID(resultSet.getLong(1));
        }
        return user;
    }

    @Override
    public User find(long id) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(findUser);
        statement.setLong(1,id);

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

    @Override
    public User update(User user) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(updateUser);
        statement.setString(1, user.getFirstName());
        statement.setString(2, user.getLastName());
        statement.setString(3, user.getUserName());
        statement.setString(4, user.getPassword());
        statement.setString(5, user.getStatus());
        statement.setLong(6, user.getID());
        statement.executeUpdate();
        return null;
    }

    @Override
    public void delete(long id) throws SQLException{
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(removeUser);
        statement.setLong(1, id);
        statement.executeUpdate();
    }

    public ArrayList<User> findAllUsers() throws SQLException {
        ArrayList<User> userEntities = new ArrayList<User>();
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
            userEntities.add(user);
        }

        return userEntities;
    }


    public User loginUser(String userName, String password) throws SQLException {

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
 */
}
