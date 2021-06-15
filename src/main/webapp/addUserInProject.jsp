<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
    UsersOperations usersOperations =  (UsersOperations) BeansStore.getBean(UsersOperations.class);
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
        String ID = request.getParameter("users");
        Long id = Long.parseLong(ID);
        User user = usersOperations.findUser(id);
        project.addUsers(user);
        projectOperations.updateProject(project);
        response.sendRedirect("project.jsp?id=" + param);
    }
%>
