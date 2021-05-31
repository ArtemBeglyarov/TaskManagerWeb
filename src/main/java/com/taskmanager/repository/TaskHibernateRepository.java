package com.taskmanager.repository;

import com.taskmanager.entity.Task;
import com.taskmanager.entity.User;

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
public class TaskHibernateRepository implements Repository<Task> {
    @PersistenceContext(unitName = "tm")
    EntityManager entityManager;
    @Override
    public Task create(Task task)  {
        entityManager.persist(task);
        return task;
    }

    @Override
    public Task find(long id)  {
        Task task = entityManager.find(Task.class, id);
        return task;
    }

    @Override
    public Task update(Task task)  {
        entityManager.merge(task);
        return task;
    }

    @Override
    public void delete(long id)  {
        Task task = entityManager.find(Task.class, id);
        entityManager.remove(task);
    }

    @Override
    public List<Task> findAll() {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Task> cq = cb.createQuery(Task.class);
        Root<Task> taskRoot = cq.from(Task.class);
        CriteriaQuery<Task> all = cq.select(taskRoot).where();
        TypedQuery<Task> allQuery = entityManager.createQuery(all);
        return allQuery.getResultList();
    }

}
