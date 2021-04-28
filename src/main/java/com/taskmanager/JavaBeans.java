package com.taskmanager;

import com.taskmanager.entity.User;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless
public class JavaBeans {

    @PersistenceContext(unitName = "tm")
    EntityManager entityManager;

    public void saveUser(User user) {
        entityManager.persist(user);
    }
//    public void List() {
//        entityManager.getTransaction().begin();
//        List<UserEntity> result = entityManager.createQuery( "from UserEntity ", UserEntity.class ).getResultList();
//        entityManager.getTransaction().commit();
//    }
}
