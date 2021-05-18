<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 14.05.2021
  Time: 18:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="com.taskmanager.entity.Task" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
    TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(TaskOperations.class);
%>

<html>
<head>
    <jsp:include page='header.jsp'/>
</head>
<%
    String ID = request.getParameter("id");
    Long id = Long.parseLong(ID);
    Task currTask = taskOperations.findTask(id);

%>
ПОКА НЕ ГОТОВ
<body style="background-image: url(css/images/background.jpg);">
<h1 class="title" align=center>UPDATE TASK</h1>
<form action="updateTask.jsp" method="POST">
    <p class="title" align=center>Enter the id of the task you want update :
    <p align=center><input type="text" name="id">
    <p class="title" align=center><input type="submit" value="Find">

    <p class="title" align=center>Change name to:
        <input type="text" name="Name" value="<%=currTask.getName()%>">
    <p class="title" align=center>Change status:
        <input type="text" name="secondName" value="<%=currTask.getStatus()%>">

    <p class="title" align=center>Change userEntity name to:
        <input type="text" name="userName" value="<%=currUser.getUserName()%>">
    <p class="title" align=center>Change password to:
        <input type="text" name="password" value="<%=currUser.getPassword()%>">
    <p class="title" align=center>Change status to:
        <input type="text" name="status" value="<%=currUser.getStatus()%>">
    <p class="title" align=center><input type="submit" value="Update">
</form>

<% if (request.getMethod().equals(HttpMethod.POST)) {
    currUser.setFirstName(request.getParameter("firstName"));
    currUser.setLastName(request.getParameter("secondName"));
    currUser.setUserName(request.getParameter("userName"));
    currUser.setPassword(request.getParameter("password"));
    currUser.setStatus(request.getParameter("status"));
    usersOperations.updateUser(currUser);
    response.sendRedirect("findUsers.jsp");
}
%>
</body>
</html>
