package com.taskmanager.operations;

import com.taskmanager.entity.Task;
import com.taskmanager.entity.UserEntity;
import com.taskmanager.repository.TaskRepository;

import javax.ejb.Stateless;
import javax.inject.Inject;
import java.sql.SQLException;
import java.util.ArrayList;

@Stateless
public class TaskOperations {

    @Inject
    TaskRepository taskRepository;

    public void createTask(Task task) {
        try{
            taskRepository.createTask(task);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void removeTaskById(String id) {
        try {
            taskRepository.removeTask(id);
        }  catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public Task findTask(String id) {
        try {
            return taskRepository.findTask(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<Task> findAllTask() {
        try {
            return taskRepository.findAllTask();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void updateTask(Task task) {
        try {
            taskRepository.updateTask(task);
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }

}
