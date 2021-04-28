package com.taskmanager.repository;

import com.taskmanager.entity.UserEntity;

import javax.annotation.Resource;
import javax.enterprise.context.ApplicationScoped;
import javax.sql.DataSource;
import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;


@ApplicationScoped
public class UserRepository implements Serializable {

    @Resource(lookup = "java:/AppDS")
    DataSource dataSource;

    private static final String insertUserQuery = "INSERT INTO users VALUES (DEFAULT,?,?,?,?,?)";
    private static final String findUser = "SELECT * FROM users WHERE id IN (?)";
    private static final String loginUser = "SELECT * FROM users WHERE user_name =(?) and password =(?)";
    private static final String findAllUser = "SELECT * FROM users";
    private static final String removeUser = "DELETE FROM users WHERE id IN (?)";
    private static final String updateUser = "UPDATE users SET first_name=(?),last_name =(?),user_name = (?), password=(?), status =(?) WHERE id IN (?)";



    public void createUser(UserEntity userEntity) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(insertUserQuery);
        statement.setString(1, userEntity.getFirstName());
        statement.setString(2, userEntity.getLastName());
        statement.setString(3, userEntity.getUserName());
        statement.setString(4, userEntity.getPassword());
        statement.setString(5, userEntity.getStatus());
        statement.executeUpdate();

    }
    public UserEntity findUserById(String id) throws SQLException{ //почему стринг а не лонг
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(findUser);
        Integer ID = Integer.parseInt(id);
        statement.setInt(1,ID);

        UserEntity userEntity = new UserEntity();// почему в пустой конструктор
        ResultSet resultSet = statement.executeQuery(); //результ сет прочитать
        while (resultSet.next()) {
        userEntity.setID(resultSet.getInt("id"));
        userEntity.setFirstName(resultSet.getString("first_name"));
        userEntity.setLastName(resultSet.getString("last_name"));
        userEntity.setUserName(resultSet.getString("user_name"));
        userEntity.setPassword(resultSet.getString("password"));
        userEntity.setStatus(resultSet.getString("status"));
        }
     return userEntity;
    }

    public void removeUser(String id) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(removeUser);
        Long longID = Long.parseLong(id);
        statement.setLong(1, longID);
        statement.executeUpdate();
    }

    public ArrayList<UserEntity> findAllUsers() throws SQLException {
        ArrayList<UserEntity> userEntities = new ArrayList<UserEntity>();
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(findAllUser);

            while (resultSet.next()) {
                UserEntity userEntity = new UserEntity();
                userEntity.setID(resultSet.getInt("id"));
                userEntity.setFirstName(resultSet.getString("first_name"));
                userEntity.setLastName(resultSet.getString("last_name"));
                userEntity.setUserName(resultSet.getString("user_name"));
                userEntity.setPassword(resultSet.getString("password"));
                userEntity.setStatus(resultSet.getString("status"));
             userEntities.add(userEntity);
            }

        return userEntities;
    }
    public void updateUser(UserEntity userEntity) throws SQLException {
            Connection connection = dataSource.getConnection();
            PreparedStatement statement = connection.prepareStatement(updateUser);
            statement.setString(1, userEntity.getFirstName());
            statement.setString(2, userEntity.getLastName());
            statement.setString(3, userEntity.getUserName());
            statement.setString(4, userEntity.getPassword());
            statement.setString(5, userEntity.getStatus());
            statement.setLong(6, userEntity.getID());
            statement.executeUpdate();

    }
    public UserEntity loginUser(String userName, String password) throws SQLException {

        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(loginUser);

        statement.setString(1, userName);
        statement.setString(2, password);

        UserEntity userEntity = new UserEntity();
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            userEntity.setID(resultSet.getInt("id"));
            userEntity.setFirstName(resultSet.getString("first_name"));
            userEntity.setLastName(resultSet.getString("last_name"));
            userEntity.setUserName(resultSet.getString("user_name"));
            userEntity.setPassword(resultSet.getString("password"));
            userEntity.setStatus(resultSet.getString("status"));
        }
        return userEntity;
    }

}
