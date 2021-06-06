package com.taskmanager.repository;

import com.taskmanager.entity.Project;
import com.taskmanager.entity.Task;
import com.taskmanager.entity.User;

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
public class ProjectHibernateRepository implements Repository<Project> {

    @Resource(lookup = "java:/AppDS")
    DataSource dataSource;
    private static final String findAllPrijectsId = "SELECT id FROM projects";
    private static final String findAllUser = "SELECT * FROM users";


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
        Project project = entityManager.find(Project.class, id);
        entityManager.remove(project);
    }


    @Override
    public List<Project> findAll() throws SQLException {
        List<Long> ids = getAllProjectsIds();
        List<Project> projects = new ArrayList<>();
        for(Long id : ids){
            projects.add(find(id));
        }
        return projects;
    }

    public List<Long> getAllProjectsIds() throws SQLException {
        List<Long> idAllProject= new ArrayList<>();
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(findAllPrijectsId);
        while (resultSet.next()) {
            idAllProject.add(resultSet.getLong("id"));
        }
        return idAllProject;
    }



   /* public List<Project> findAll() {
        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Project> cq = cb.createQuery(Project.class);
        Root<Project> projectRoot = cq.from(Project.class);
        CriteriaQuery<Project> all = cq.select(projectRoot).where();
        TypedQuery<Project> allQuery = entityManager.createQuery(all);
        return allQuery.getResultList();
    }

    */

}

