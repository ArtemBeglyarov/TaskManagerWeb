package com.taskmanager.repository;

import com.taskmanager.entity.Project;
import com.taskmanager.entity.Task;

import javax.annotation.Resource;
import javax.enterprise.context.ApplicationScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
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
@ApplicationScoped
public class TaskHibernateRepository implements Repository<Task> {
    @Resource(lookup = "java:/AppDS")
    DataSource dataSource;
    private static final String findAllTasksId = "SELECT id FROM tasks";
    private static final String findAllUser = "SELECT * FROM users";

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
        entityManager.flush();
    }

    @Override
    public List<Task> findAll() throws SQLException {
        List<Long> ids = getAllTasksIds();
        List<Task> tasks = new ArrayList<>();
        for(Long id : ids){
            tasks.add(find(id));
        }
        return tasks;
    }

    public List<Long> getAllTasksIds() throws SQLException {
        List<Long> idAllTasks= new ArrayList<>();
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(findAllTasksId);
        while (resultSet.next()) {
            idAllTasks.add(resultSet.getLong("id"));
        }
        return idAllTasks;
    }




    /*public List<Task> findAll() {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Task> cq = cb.createQuery(Task.class);
        Root<Task> taskRoot = cq.from(Task.class);
        CriteriaQuery<Task> all = cq.select(taskRoot).where();
        TypedQuery<Task> allQuery = entityManager.createQuery(all);
        return allQuery.getResultList();
    }
     */

}
