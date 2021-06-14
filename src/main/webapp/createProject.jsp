<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.BeansStore" %>

<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.ResultSet" %>
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
        String ID = request.getParameter("users");
        Long id = Long.parseLong(ID);
        User user = usersOperations.findUser(id);
        project.addUsers(user);
        project.setCreator(currUser);
        projectOperations.createProject(project);
        response.sendRedirect("projects.jsp");







        //if (ID != null && ID != "") {
        //Long id = Long.parseLong(ID);
        //User user = usersOperations.findUser(id);
        //project.addUsers(user);
        //project.setCreator(currUser);
        //projectOperations.createProject(project);
        //} else {
        //response.sendRedirect("projects.jsp");
        //}
    }
%>