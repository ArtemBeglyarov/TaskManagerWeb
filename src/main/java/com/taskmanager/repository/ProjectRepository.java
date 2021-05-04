package com.taskmanager.repository;

import com.taskmanager.entity.Project;
import com.taskmanager.entity.Task;

import javax.annotation.Resource;
import javax.enterprise.context.ApplicationScoped;
import javax.sql.DataSource;
import java.sql.*;
import java.util.Calendar;

@ApplicationScoped
public class ProjectRepository  {
    @Resource(lookup = "java:/AppDS")
    DataSource dataSource;
   /*
    private static final String insertProjectQuery = "INSERT INTO PROJECT VALUES (DEFAULT,?,?,?,?,?)";
    private static final String findProject = "SELECT * FROM PROJECT WHERE id IN (?)";
    private static final String findAllProject = "SELECT * FROM PROJECT";
    private static final String removeProject = "DELETE FROM PROJECT WHERE id IN (?)";
    private static final String updateProject = "UPDATE PROJECT SET PROJ_NAME=(?),STATUS =(?),PRIORITET = (?), DESCR = (?), START_DATE =(?),WHERE id IN (?)";

    public void createProject(Project project) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(insertProjectQuery);
        statement.setString(1, project.getNameProject());
        statement.setLong(2, project.getUsersId()); //
        statement.setLong(3, project.getTasksId());
        statement.setString(4, project.getDescription());
        statement.setLong(5, project.getCreatorID());
        statement.executeUpdate();
    }

    @Override
    public void create(Project project) throws SQLException {

    }

    @Override
    public void find(long id) throws SQLException {

    }

    @Override
    public void update(Project project) throws SQLException {

    }

    @Override
    public void delete(long t) throws SQLException {

    }
}
    /*@Override
    public Project create(Project project) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(insertProjectQuery);
        statement.setString(1,project.getNameProject());
        statement.setLong(2,project.getUsersId()); //
        statement.setLong(3,project.getTasksId());
        statement.setString(4,project.getDescription());
        statement.setLong(5,project.getCreatorID());
        statement.executeUpdate();
        return null;
    }

    @Override
    public Project find(long id) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(findProject);
        statement.setLong(1, id);
        Project project = new Project();
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            project.setID(resultSet.getInt("PROJ_ID"));
            project.setNameProject(resultSet.getString("NAME_PROJ"));
            project.setUsersId(resultSet.getLong("USER_ID"));
            project.setDescription(resultSet.getString("DESC"));
            project.setCreatorID(resultSet.getLong("CREAT_ID"));
            project.setTasksId(resultSet.getLong("TASK_ID"));

        }
        return project;
    }

    @Override
    public Project update(Project project) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(updateProject);
        statement.setString(1,project.getNameProject());
        statement.setLong(2,project.getUsersId()); //
        statement.setLong(3,project.getTasksId());
        statement.setString(4,project.getDescription());
        statement.setLong(5,project.getCreatorID());
        return null;
    }

    @Override
    public void delete(long id) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(removeProject);
        statement.setLong(1,id);
        statement.executeUpdate();
    }


//    @Resource(lookup = "java:/AppDS")
//    DataSource dataSource;
//    public void addProject(Long id, Project project) {
//        projectMap.put(id, project);
//    }
//
//    public Project getProject(long id) {
//        return projectMap.get(id);
//    }
//
//    public void removeProject(long id) {
//        projectMap.remove(id);
//    }
//
//    public  void getAllProject() {
//        for (Project k : projectMap.values()) {
//            System.out.println(k.toString());
//            System.out.println();
//        }
//    }
}
)
    */
}