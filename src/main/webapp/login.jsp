<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
</head>
<style>@import url(css/style.css);</style>
<body style="margin-top: 300px;)">
<h1 class="title" align=center>LOGIN USER</h1>
<form action="login.jsp" method="POST">

    <p class="title" align=center>USER NAME:
        <input type="text" name="userName">
    <p class="title" align=center>PASSWORD:
        <input type="password" name="password">
    <p class="title" align=center><input type="submit" value="Login">
</form>

<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<%
    if (request.getMethod().equals(HttpMethod.POST)) {

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        User userEntity = usersOperations.loginUser(userName, password);

        if (userEntity == null) {

%>
<form action="login.jsp" method="POST">

    <p class="title" align=center>USER NAME:
        <input type="text" name="userName">
    <p class="title" align=center>PASSWORD:
        <input type="password" name="password">
    <p class="title" align=center><input type="submit" value="Login">
        <a>Incorrect login or password</a>
</form>
<%
        } else {
            session.setAttribute("currUser", userEntity);
            response.sendRedirect("index.jsp");
        }
    }
%>
</form>
</body>
</html>
