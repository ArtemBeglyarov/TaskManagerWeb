<%@ page import="com.taskmanager.entity.UserEntity" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.entity.UserEntity" %>
<%@ page import="javax.ejb.EJB" %>
<%@ page import="com.taskmanager.JavaBeans" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <style>@import url(css/style.css);</style>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body style="background-image: url(images/background.jpg);)">

<h1 class="title" align=center>CREATE USER</h1>
<form action="createUser.jsp" method="POST">
    <p class="title" align=center>First name:
        <input type="text" name="firstName">
    <p class="title" align=center>Last name:
        <input type="text" name="secondName">
    <p class="title" align=center>User name:
        <input type="text" name="userName">
    <p class="title" align=center>Password:
        <input type="text" name="password">
    <p class="title" align=center>Status:
        <input type="text" name="status">
    <p class="title" align=center><input type="submit" value="Create">
</form>


<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>


<% if (request.getMethod().equals(HttpMethod.POST)) {
    UserEntity userEntity = new UserEntity();
    userEntity.setFirstName(request.getParameter("firstName"));
    userEntity.setLastName(request.getParameter("secondName"));
    userEntity.setUserName(request.getParameter("userName"));
    userEntity.setPassword(request.getParameter("password"));
    userEntity.setStatus(request.getParameter("status"));
    usersOperations.createUser(userEntity);
    response.sendRedirect("findAllUser");

}

%>


</body>
</html>