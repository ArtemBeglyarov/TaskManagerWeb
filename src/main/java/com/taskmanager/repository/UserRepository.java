package com.taskmanager.repository;
import com.taskmanager.entity.User;

import javax.annotation.Resource;
import javax.enterprise.context.ApplicationScoped;
import javax.sql.DataSource;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;


@ApplicationScoped
public class UserRepository implements Serializable {

        @Resource(lookup = "java:/AppDS")
        DataSource dataSource;


        public void createUser () throws SQLException {
            Connection connection = dataSource.getConnection();
            Statement statement = connection.createStatement();

            statement.executeUpdate("create table USERS()");
        }
    public User findByUser(long id) {

    }

    public void removeUser(long id) {

    }

}
