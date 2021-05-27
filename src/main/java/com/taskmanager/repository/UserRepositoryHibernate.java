package com.taskmanager.repository;

import com.taskmanager.entity.User;
import org.hibernate.Session;
import org.hibernate.Transaction;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

@Stateless
@LocalBean
public class UserRepositoryHibernate implements Repository<User> {

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

    @Override
    public List<User> findAll() {
        return findUsers();
    }

    public User login(String username) {

        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<User> cq = cb.createQuery(User.class);
        Root<User> userRoot = cq.from(User.class);
        CriteriaQuery<User> userByNameQuery = cq.select(userRoot).where(cb.equal(userRoot.get("userName"), username));
        TypedQuery<User> allQuery = entityManager.createQuery(userByNameQuery);
        return allQuery.getSingleResult();
    }

    public List<User> findUsers() {
        List<Long> ids = getAllUsersIds();
        List<User> users = new ArrayList<>();
        for(Long id : ids){
            users.add(find(id));
        }
        return users;
        //return entityManager.createQuery("from User", User.class).getResultList();
    }
}
