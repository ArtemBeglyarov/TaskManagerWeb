package com.taskmanager.repository;

import com.taskmanager.entity.User;

import javax.enterprise.context.ApplicationScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@ApplicationScoped
public class UserRepositoryHibernate implements Repository<User> {

    @PersistenceContext(unitName = "tm")
    EntityManager entityManager;

    @Override
    public User create(User user) {
            entityManager.persist(user);
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

    public User login(String username) {
        User user = entityManager.find(User.class, username);
        return user;
    }

    public List<User> findUsers() {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<User> cq = criteriaBuilder.createQuery(User.class);
        Root<User> userRoot = cq.from(User.class);
        CriteriaQuery<User> all = cq.select(userRoot);
        TypedQuery<User> allQuery = entityManager.createQuery(all);
        return allQuery.getResultList();
    }
}
