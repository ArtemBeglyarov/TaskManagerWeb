<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Title</title>
    <style>@import url(css/style.css);</style>
</head>
<body>
<%
    User user = (User) session.getAttribute("currUser");
%>
<h1 class="title" align=center>UPDATE USER</h1>
<form action="updateUser.jsp" method="POST">
    <p class="title" align=center>Change first name to:
        <input type="text" name="firstName" value="<%out.print(user.getFirstName());%>">
    <p class="title" align=center>Change last name to:
        <input type="text" name="secondName"
               value="<%out.print(user.getLastName());%>">
    <p class="title" align=center>Change user name to:
        <input type="text" name="userName" value="<%out.print(user.getUserName());%>">
    <p class="title" align=center>Change password to:
        <input type="text" name="password" value="<%out.print(user.getPassword());%>">
    <p class="title" align=center>Change status to:
        <input type="text" name="status" value="<%out.print(user.getStatus());%>">
    <p class="title" align=center><input type="submit" value="Update">
</form>


<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<% if (request.getMethod().equals(HttpMethod.POST)) {
    user.setFirstName(request.getParameter("firstName"));
    user.setLastName(request.getParameter("secondName"));
    user.setUserName(request.getParameter("userName"));
    user.setPassword(request.getParameter("password"));
    user.setStatus(request.getParameter("status"));
    usersOperations.updateUser(user);
}

%>
</body>
</html>
