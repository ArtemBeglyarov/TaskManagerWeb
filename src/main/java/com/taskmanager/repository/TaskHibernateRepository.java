package com.taskmanager.repository;

import com.taskmanager.entity.Task;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.sql.SQLException;
import java.util.List;

public class TaskHibernateRepository implements Repository<Task> {
    @PersistenceContext(unitName = "tm")
    EntityManager entityManager;
    @Override
    public Task create(Task task) throws SQLException {
        entityManager.persist(task);
        return task;
    }

    @Override
    public Task find(long id) throws SQLException {
        entityManager.find( Task.class,id);
        return
    }

    @Override
    public Task update(Task task) throws SQLException {
        entityManager.persist(task);
        return task;
    }

    @Override
    public void delete(long t) throws SQLException {
        entityManager.persist(t);
    }

    @Override
    public List<Task> findAll() {
        return null;
    }
}
