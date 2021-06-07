package com.taskmanager.operations;

import com.taskmanager.entity.Comment;
import com.taskmanager.entity.Task;
import com.taskmanager.repository.TaskHibernateRepository;
import com.taskmanager.repository.TaskRepository;

import javax.ejb.Stateless;
import javax.inject.Inject;
import java.sql.SQLException;
import java.util.List;

@Stateless
public class TaskOperations {

    @Inject
    TaskRepository taskRepository;
    @Inject
    TaskHibernateRepository taskHibernateRepository;

    public Task createTask(Task task) {
        return taskHibernateRepository.create(task);
    }

    public void removeTaskById(long id) {
        taskHibernateRepository.delete(id);
    }

    public Task findTask(long id) {
        return taskHibernateRepository.find(id);
    }

    public Task updateTask(Task task) {
        return taskHibernateRepository.update(task);
    }

    public List<Task> findAllTasks() throws SQLException {
        return taskHibernateRepository.findAll();
    }

//    public void addCommentInTask(Long id, Comment comment) {
//        Task task = findTask(id);
//        task.getComments().add(comment);
//
//    }
}
