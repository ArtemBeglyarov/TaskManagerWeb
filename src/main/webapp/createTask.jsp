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
<%@ page import="java.util.List" %>
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
        <%
        Date format1 = new Date(Calendar.getInstance().getTimeInMillis());
        System.out.println(format1);
    %>

        <input type="date" name="startDate">
    <p class="title" align=center>DueDate:
        <input type="date" name="endDate">
            <%
        SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-DD");
    %>
    <p class="title" align=center> enter ProjectID :
    <input type="text" name="projectID">
    <p class="title" align=center>enter ReporterID:
        <input type="text" value="<%=currUser.getUserName()%>">
    <p class="title" align=center>AssigneeID:
        <select name="Users">
            <%

                List<User> assigneeArrayList = usersOperations.findUsers();
                for (User k : assigneeArrayList) {

            %>
            <option value="<%=k.getID()%>"><%=k.getUserName()%></option>
            <%
                }
            %>
        </select>


    <p class="title" align=center><input type="submit" value="Create">

</form>
<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
    TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(TaskOperations.class);
    ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(ProjectOperations.class);
%>



<% if (request.getMethod().equals(HttpMethod.POST)) {
    Task task = new Task();

    task.setName(request.getParameter("TaskName"));

    task.setPriority(Task.Priority.valueOf(request.getParameter("Prioritet")));
    task.setDescription(request.getParameter("Description"));
    task.setCreateDate(format1);
    try {
        task.setDueDate(format.parse(request.getParameter("EndDate")));
    } catch (ParseException e) {
        throw new RuntimeException(e);
    }
    String ID = request.getParameter("projectID");
    Long id = Long.parseLong(ID);
    task.setProject(projectOperations.findProject(id));

    String assID = request.getParameter("Users");
    Long idd = Long.parseLong(assID);
    task.setAssignee(usersOperations.findUser(idd));

    task.setReporter(currUser);

    taskOperations.createTask(task);
    response.sendRedirect("tasks.jsp");
}
%>

</body>
</html>
