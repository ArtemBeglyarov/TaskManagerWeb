<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 30.04.2021
  Time: 0:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.taskmanager.entity.Task" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.sql.Array" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<h1 class="title" align=center>CREATE TASK</h1>
<form action="createTask.jsp" method="POST">
    <p class="title" align=center>Task name:
        <input type="text" name="TaskName">
    <p class="title" align=center>Status of your task - open:
    <p class="title" align=center>Priority:
        <select name="Prioritet">
            <option value="NORMAL">NORMAL</option>
            <option value="LOW">LOW</option>
            <option value="HIGH">HIGH</option>
            <option value="HIGHEST">HIGHEST</option>
        </select>
    <p class="title" align=center>Description:
        <input type="text" name="Description">
    <p class="title" align=center>StartDate:


        <input type="date" name="startDate">
    <p class="title" align=center>EndDate:
        <input type="date" name="endDate">
            <%
        SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-DD");
    %>
    <p class="title" align=center>ProjectID:
        <input type="text" name="projectID">
    <p class="title" align=center>ReporterID:
        <input type="text" name="reporterId">
    <p class="title" align=center>AssigneeID:
        <input type="text" name="AssigneeId">
    <p class="title" align=center><input type="submit" value="Create">
</form>
<%!
    TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(UsersOperations.class);
    ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(UsersOperations.class);
    Project currProject = new Project();
%>

<% if (request.getMethod().equals(HttpMethod.POST)) {
    Task task = new Task();

    task.setName(request.getParameter("TaskName"));
    task.setStatus(Task.Status.valueOf(request.getParameter("Status")));
    task.setPriority(Task.Priority.valueOf(request.getParameter("Prioritet")));
    task.setDescription(request.getParameter("Description"));
    try {
        task.setEndDate(format.parse(request.getParameter("EndDate")));
    } catch (ParseException e) {
        throw new RuntimeException(e);
    }
    task.setProject());
    task.getReporterId();
        Arrays.deepToString();
    task.getAssigneeId();
    taskOperations.createTask(task);
    response.sendRedirect("findAllProject.jsp");
}
%>
</body>
</html>
