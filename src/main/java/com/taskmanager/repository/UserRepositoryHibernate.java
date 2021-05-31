package com.taskmanager.repository;

import com.taskmanager.entity.User;

import javax.annotation.Resource;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@Stateless
@LocalBean
public class UserRepositoryHibernate implements Repository<User> {

    @Resource(lookup = "java:/AppDS")
    DataSource dataSource;
    private static final String findAllUserId = "SELECT id FROM users";


    @PersistenceContext(unitName = "tm")
    EntityManager entityManager;

    @Override
    public User create(User user) {
        return user;
    }

    @Override
    public User find(long id) {
        User user = entityManager.find(User.class, id);
        return user;
    }

    @Override
    public User update(User user) {
        entityManager.merge(user);
        return user;
    }

    @Override
    public void delete(long id) {
        User user = entityManager.find(User.class, id);
        entityManager.remove(user);
    }

    public List<Long> getAllUsersIds() throws SQLException {
        List<Long> idAllUsers = new ArrayList<>();
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(findAllUserId);


        while (resultSet.next()) {
            idAllUsers.add(resultSet.getLong("id"));

        }
        return idAllUsers;

    }

    @Override
    public List<User> findAll() throws SQLException {
        List<Long> ids = getAllUsersIds();
        List<User> users = new ArrayList<>();
        for (Long id : ids) {
            users.add(find(id));
        }
        return users;
    }

    public User login(String username) {

        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<User> cq = cb.createQuery(User.class);
        Root<User> userRoot = cq.from(User.class);
        CriteriaQuery<User> userByNameQuery = cq.select(userRoot).where(cb.equal(userRoot.get("userName"), username));
        TypedQuery<User> allQuery = entityManager.createQuery(userByNameQuery);
        return allQuery.getSingleResult();
    }
}
