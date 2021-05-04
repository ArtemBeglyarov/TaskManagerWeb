package com.taskmanager.operations;

import com.taskmanager.entity.Project;
import com.taskmanager.entity.Task;
import com.taskmanager.repository.ProjectHibernateRepository;
import com.taskmanager.repository.ProjectRepository;
import com.taskmanager.repository.TaskHibernateRepository;

import javax.ejb.Stateless;
import javax.inject.Inject;
import java.sql.SQLException;

@Stateless
public class ProjectOperations {
    @Inject
    ProjectRepository projectRepository;
    @Inject
    ProjectHibernateRepository projectHibernateRepository;
    public void createProject(Project project){
        try{
            projectHibernateRepository.create(project);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void findProject(long id){
        try{
             projectHibernateRepository.find(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void deleteProjByID(long id){
        try{
            projectHibernateRepository.delete(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateProject(Project project) {
        try {
            projectHibernateRepository.update(project);
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }
}
