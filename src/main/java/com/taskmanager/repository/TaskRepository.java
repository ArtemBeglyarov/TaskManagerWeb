package com.taskmanager.repository;

import com.taskmanager.entity.Task;

import javax.annotation.Resource;
import javax.enterprise.context.ApplicationScoped;
import javax.sql.DataSource;
import java.io.Serializable;
import java.sql.*;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Calendar;

@ApplicationScoped
public class TaskRepository implements Serializable {

    @Resource(lookup = "java:/AppDS")
    DataSource dataSource;
    private static final String insertTaskQuery = "INSERT INTO TASK VALUES (DEFAULT,?,?,?,?,?,?,?,?,?)";
    private static final String findTask = "SELECT * FROM TASK WHERE id IN (?)";
    private static final String findAllTask = "SELECT * FROM TASk";
    private static final String removeTask = "DELETE FROM TASK WHERE id IN (?)";
    private static final String updateTask = "UPDATE TASK SET TASK_NAME=(?),STATUS =(?),PRIORITET = (?), DESCR = (?), START_DATE =(?)," +
            " END_DATE =(?), PROJID =(?), REPORTER_ID = (?), ASSIGNEE_ID = (?) WHERE id IN (?)";

    public void createTask(Task task) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(insertTaskQuery);
        statement.setString(1, task.getName());
        statement.setString(2, String.valueOf(task.getStatus()));
        statement.setString(3, String.valueOf(task.getPriority()));
        statement.setString(4, task.getDescription());
        statement.setDate(5, new Date(Calendar.getInstance().getTimeInMillis()));
        statement.setDate(6, (Date) task.getEndDate());
        statement.setLong(7, task.getProjectId());
        statement.setLong(8, task.getReporterId());
        statement.setLong(9, task.getAssigneeId());
        statement.executeUpdate();
    }

    public Task findTask(String id) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(findTask);
        Integer ID = Integer.parseInt(id);
        statement.setInt(1, ID);

        Task task = new Task();
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            task.setID(resultSet.getInt("TASKID"));
            task.setName(resultSet.getString("TASKNAME"));
            task.setStatus(Task.Status.valueOf(resultSet.getString("STATUS")));
            task.setPriority(Task.Priority.valueOf(resultSet.getString("PRIORITY")));
            task.setDescription(resultSet.getString("DECSR"));
            task.setStartData(resultSet.getDate("START_DATE"));
            task.setEndDate(resultSet.getDate("END_DATE"));
            task.setProjectId(resultSet.getLong("PROJ_ID"));
            task.setReporterId(resultSet.getLong("REPORTER_ID"));
            task.setAssigneeId(resultSet.getLong("ASSIGNEEID_ID"));
        }
        return task;
    }
    public ArrayList<Task> findAllTask() throws SQLException{
        ArrayList<Task> tasks = new ArrayList<>();
        Connection connection = dataSource.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(findAllTask);
        while (resultSet.next()){
            Task task = new Task();
            task.setID(resultSet.getInt("TASKID"));
            task.setName(resultSet.getString("TASKNAME"));
            task.setStatus(Task.Status.valueOf(resultSet.getString("STATUS")));
            task.setPriority(Task.Priority.valueOf(resultSet.getString("PRIORITY")));
            task.setDescription(resultSet.getString("DECS"));
            task.setStartData(resultSet.getDate("START_DATE"));
            task.setEndDate(resultSet.getDate("END_DATE"));
            task.setProjectId(resultSet.getLong("PROJ_ID"));
            task.setReporterId(resultSet.getLong("REPORTER_ID"));
            task.setAssigneeId(resultSet.getLong("ASSIGNEE_ID"));
        }
        return tasks;
    }
    public void removeTask(String id) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(removeTask);
        Integer ID = Integer.parseInt(id);
        statement.setInt(1,ID);
        statement.executeUpdate();
    }
    public void updateTask(Task task) throws SQLException{
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(updateTask);
        statement.setString(1, task.getName());
        statement.setString(2, String.valueOf(task.getStatus()));
        statement.setString(3, String.valueOf(task.getPriority()));
        statement.setString(4, task.getDescription());
        statement.setDate(5, new Date(Calendar.getInstance().getTimeInMillis()));
        statement.setDate(6, (Date) task.getEndDate());
        statement.setLong(7, task.getProjectId());
        statement.setLong(8, task.getReporterId());
        statement.setLong(9, task.getAssigneeId());
        statement.setLong(10,task.getID());
        statement.executeUpdate();
    }
}
