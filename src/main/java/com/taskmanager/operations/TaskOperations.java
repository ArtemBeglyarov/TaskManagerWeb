package com.taskmanager.operations;

import com.taskmanager.entity.Task;
import com.taskmanager.entity.User;
import com.taskmanager.repository.TaskHibernateRepository;
import com.taskmanager.repository.TaskRepository;

import javax.ejb.Stateless;
import javax.inject.Inject;
import java.sql.SQLException;
import java.util.ArrayList;

@Stateless
public class TaskOperations {

    @Inject
    TaskRepository taskRepository;
    @Inject
    TaskHibernateRepository taskHibernateRepository;

    public void createTask(Task task) {
        try{
            taskHibernateRepository.create(task);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void removeTaskById(long id) {
        try {
            taskHibernateRepository.delete(id);
        }  catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void findTask(long id) {
        try {
            taskHibernateRepository.find(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    /*
    public ArrayList<Task> findAllTask() {

        try {
            return taskRepository.findAllTask();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    */
    public void updateTask(Task task) {
        try {
            taskHibernateRepository.update(task);
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }
}
