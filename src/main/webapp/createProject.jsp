<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.BeansStore" %>

<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }


    ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(ProjectOperations.class);
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
    if (request.getMethod().equals(HttpMethod.POST)) {
        Project project = new Project();
        project.setName(request.getParameter("name"));
        project.setDescription(request.getParameter("description"));
        //TODO Сделать здесь же доюавление участников проекта
        Set<User> users = project.getUsers();

        project.setCreator(currUser);
        projectOperations.createProject(project);
        response.sendRedirect("projects.jsp");
    }
%>