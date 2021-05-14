package com.taskmanager.repository;

import com.taskmanager.entity.Project;
import com.taskmanager.entity.Task;

import javax.enterprise.context.ApplicationScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.sql.SQLException;
import java.util.List;

@ApplicationScoped
public class ProjectHibernateRepository implements Repository<Project> {
    @PersistenceContext(unitName = "tm")
    EntityManager entityManager;

    @Override
    public Project create(Project project)  {
        entityManager.persist(project);
        return project;
    }

    @Override
    public Project find(long id) {
        Project project = entityManager.find(Project.class, id);
        return project;
    }

    @Override
    public Project update(Project project) {
        entityManager.merge(project);
        return project;
    }

    @Override
    public void delete(long id)  {
        Task task = entityManager.find(Task.class, id);
        entityManager.remove(task);
    }

    @Override
    public List<Project> findAll() {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Project> cq = cb.createQuery(Project.class);
        Root<Project> projectRoot = cq.from(Project.class);
        CriteriaQuery<Project> all = cq.select(projectRoot).where();
        TypedQuery<Project> allQuery = entityManager.createQuery(all);
        return allQuery.getResultList();
    }

}

