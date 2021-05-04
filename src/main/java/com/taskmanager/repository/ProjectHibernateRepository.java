package com.taskmanager.repository;

import com.taskmanager.entity.Project;
import com.taskmanager.entity.Task;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.sql.SQLException;

public class ProjectHibernateRepository implements Repository<Project> {
    @PersistenceContext(unitName = "tm")
    EntityManager entityManager;

    @Override
    public void create(Project project) throws SQLException {
        entityManager.persist(project);
    }

    @Override
    public void find(long id) throws SQLException {
        entityManager.persist(id);
    }

    @Override
    public void update(Project project) throws SQLException {
        entityManager.persist(project);
    }

    @Override
    public void delete(long t) throws SQLException {
        entityManager.persist(t);
    }
}

