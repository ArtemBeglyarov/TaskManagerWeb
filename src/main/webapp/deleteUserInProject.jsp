<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
    ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(ProjectOperations.class);
    Project project = null;
    String param = request.getParameter("id");
    if (param != null && param != "") {
        Long id = Long.parseLong(param);
        project = projectOperations.findProject(id);
    } else {
        response.sendRedirect("projects.jsp");
    }

    if (request.getMethod().equals(HttpMethod.POST)) {

        String checkID =request.getParameter("IDs");
        ObjectMapper mapper = new ObjectMapper();
        User[] users = mapper.readValue(checkID,User[].class);
        for (User k:users){
            project.deleteUser(k);
        }
        projectOperations.updateProject(project);
        response.sendRedirect("project.jsp?id=" + param);
    }
%>
