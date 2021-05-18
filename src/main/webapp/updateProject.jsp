
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
%>
<!DOCTYPE HTML>
<html>
<head>
    <jsp:include page='header.jsp'/>
</head>
    <%
    String ID = request.getParameter("id");
    Long id = Long.parseLong(ID);
    Project currTask = projectOperations.findProject(id);

%>
<body style="background-image: url(css/images/background.jpg);">
<h1 class="title" align=center>UPDATE PROJECT</h1>
<form action="updateUser.jsp" method="POST">
    <p class="title" align=center>Change name to:
        <input type="text" name="NameProject" value="<%=currTask.getNameProject()%>">
    <p class="title" align=center>Change last name to:
        <input type="text" name="secondName" value="<%=currTask.getNameProject()%>">
    <p class="title" align=center>Change userEntity name to:
        <input type="text" name="userName" value="<%=currUser.getUserName()%>">
    <p class="title" align=center>Change password to:
        <input type="text" name="password" value="<%=currUser.getPassword()%>">
    <p class="title" align=center>Change status to:
        <input type="text" name="status" value="<%=currUser.getStatus()%>">
    <p class="title" align=center><input type="submit" value="Update">
</form>

    <%!

    ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(ProjectOperations.class);
%>
