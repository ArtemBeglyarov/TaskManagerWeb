package com.taskmanager;

import com.taskmanager.entity.UserEntity;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;


@Stateless
public class JavaBeans {

    @PersistenceContext(unitName = "tm")
    EntityManager entityManager;

    public void saveUser(UserEntity user) {
        entityManager.persist(user);
    }
    public void List() {
        entityManager.getTransaction().begin();
        List<UserEntity> result = entityManager.createQuery( "from UserEntity ", UserEntity.class ).getResultList();
        entityManager.getTransaction().commit();
    }
}
