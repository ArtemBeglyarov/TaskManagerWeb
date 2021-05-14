package com.taskmanager.operations;

import com.taskmanager.entity.Project;
import com.taskmanager.entity.Task;
import com.taskmanager.entity.User;
import com.taskmanager.repository.ProjectHibernateRepository;
import com.taskmanager.repository.ProjectRepository;
import com.taskmanager.repository.TaskHibernateRepository;

import javax.ejb.Stateless;
import javax.inject.Inject;
import java.sql.SQLException;
import java.util.List;

@Stateless
public class ProjectOperations {
    @Inject
    ProjectRepository projectRepository;
    @Inject
    ProjectHibernateRepository projectHibernateRepository;
    public Project createProject(Project project){
          return projectHibernateRepository.create(project);
    }
    public Project findProject(long id){
          return projectHibernateRepository.find(id);
    }
    public void deleteProjByID(long id){
         projectHibernateRepository.delete(id);
    }
    public Project updateProject(Project project) {
         return projectHibernateRepository.update(project);
    }
    public List<Project> findAllProjects() {
        return projectHibernateRepository.findAll();
    }
}
