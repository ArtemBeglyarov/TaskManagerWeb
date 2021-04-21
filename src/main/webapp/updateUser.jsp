<%@ page import="com.taskmanager.entity.UserEntity" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.UserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Title</title>
    <style>@import url(css/style.css);</style>
</head>
<body>
<%
    UserEntity userEntity = (UserEntity) session.getAttribute("currUser");
%>
<h1 class="title" align=center>UPDATE USER</h1>
<form action="updateUser.jsp" method="POST">
    <p class="title" align=center>Change first name to:
        <input type="text" name="firstName" value="<%out.print(userEntity.getFirstName());%>">
    <p class="title" align=center>Change last name to:
        <input type="text" name="secondName"
               value="<%out.print(userEntity.getLastName());%>">
    <p class="title" align=center>Change userEntity name to:
        <input type="text" name="userName" value="<%out.print(userEntity.getUserName());%>">
    <p class="title" align=center>Change password to:
        <input type="text" name="password" value="<%out.print(userEntity.getPassword());%>">
    <p class="title" align=center>Change status to:
        <input type="text" name="status" value="<%out.print(userEntity.getStatus());%>">
    <p class="title" align=center><input type="submit" value="Update">
</form>


<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<% if (request.getMethod().equals(HttpMethod.POST)) {
    userEntity.setFirstName(request.getParameter("firstName"));
    userEntity.setLastName(request.getParameter("secondName"));
    userEntity.setUserName(request.getParameter("userName"));
    userEntity.setPassword(request.getParameter("password"));
    userEntity.setStatus(request.getParameter("status"));
    usersOperations.updateUser(userEntity);
}

%>
</body>
</html>
