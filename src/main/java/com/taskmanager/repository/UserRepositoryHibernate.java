package com.taskmanager.repository;

import com.taskmanager.entity.User;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.sql.SQLException;
import java.util.List;

@Stateless
public class UserRepositoryHibernate implements Repository<User> {

    @PersistenceContext(unitName = "tm")
    EntityManager entityManager;

    @Override
    public User create(User user) throws SQLException {
        entityManager.persist(user);
        return user;
    }

    @Override
    public User find(long id) throws SQLException {
        User user = entityManager.find(User.class, id);
        return user;
    }

    @Override
    public User update(User user) throws SQLException {
        entityManager.merge(user);
        return user;
    }

    @Override
    public void delete(long id) {
        User user = entityManager.find(User.class, id);
        entityManager.remove(user);
    }

    @Override
    public List<User> findAll() {
        List<User> result = entityManager.createQuery("SELECT * FROM users ", User.class).getResultList();
        return result;
    }
}


