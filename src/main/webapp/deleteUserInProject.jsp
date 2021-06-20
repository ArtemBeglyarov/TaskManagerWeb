<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
    ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(ProjectOperations.class);
    Project project = null;
    String projectId = request.getParameter("id");
    if (projectId != null && projectId != "") {
        project = projectOperations.findProject(Long.parseLong(projectId));
    } else {
        response.sendRedirect("projects.jsp");
    }

    String checkID = request.getParameter("IDs");
    Set<Long> ids = Arrays.stream(checkID.replace("\"", "")
            .replace("[", "")
            .replace("]", "")
            .split(",")).map(Long::parseLong).collect(Collectors.toSet());

    for (Long userId : ids) {
        User user = usersOperations.findUser(userId);
        if(true){
            throw  new RuntimeException(user + "USER YOUR");
        }
        project.deleteUser(user);
        user.getProjects().remove(project);
        usersOperations.updateUser(user);
    }
    projectOperations.updateProject(project);
    response.sendRedirect("project.jsp?id=" + projectId);
%>
