package com.taskmanager.repository;

import com.taskmanager.entity.Project;

import javax.annotation.Resource;
import javax.enterprise.context.ApplicationScoped;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@ApplicationScoped
public class ProjectRepository {
    @Resource(lookup = "java:/AppDS")
    DataSource dataSource;
    private static final String insertProjectQuery = "INSERT INTO PROJECT VALUES (DEFAULT,?,?,?,?,?,?,?,?,?)";
    private static final String findProject = "SELECT * FROM PROJECT WHERE id IN (?)";
    private static final String findAllProject = "SELECT * FROM PROJECT";
    private static final String removeProject = "DELETE FROM PROJECT WHERE id IN (?)";
    private static final String updateProject = "UPDATE PROJECT SET TASK_NAME=(?),STATUS =(?),PRIORITET = (?), DESCR = (?), START_DATE =(?)," +
            " END_DATE =(?), PROJID =(?), REPORTER_ID = (?), ASSIGNEE_ID = (?) WHERE id IN (?)";

    public void createProject(Project project) throws SQLException {
        Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(insertProjectQuery);
        statement.setString(1,project.getNameProject());
        statement.setLong(2,project.getUsersId()); // как хранить листы
        statement.setLong(3,);
        statement.setString(4,project.getDescription());
        statement.setLong(5,project.getCreatorID());
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
