<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 30.04.2021
  Time: 0:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.entity.Task" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head>
    <jsp:include page='header.jsp'/>
</head>
<body>
<h1 class="title" align=center>CREATE PROJECT</h1>
<form action="createProject.jsp" method="POST">
    <p class="title" align=center>Name Project:
        <input type="text" name="ProjectName">
    <p class="title" align=center>select users:


</form>

    <%!
    ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(UsersOperations.class);//

%>

<% if (request.getMethod().equals(HttpMethod.POST)) {

    Project project = new Project();
    project.setNameProject(request.getParameter("ProjectName"));


    task.setName(request.getParameter("TaskName"));
    task.setStatus(Task.Status.valueOf(request.getParameter("Status")));
    task.setPriority(Task.Priority.valueOf(request.getParameter("Prioritet")));
    task.setDescription(request.getParameter("Description"));
    try {
        task.setEndDate(format.parse(request.getParameter("EndDate")));
    } catch (ParseException e) {
        throw new RuntimeException(e);
    }
    task.setProject(request.);
    task.getReporterId();
    Arrays.deepToString()
    task.getAssigneeId(request);
    taskOperations.createTask(task);
    response.sendRedirect("findAllUsers.jsp");
}
    %
</body>
</html>
