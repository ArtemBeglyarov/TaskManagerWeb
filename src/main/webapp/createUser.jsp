<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.UsersOperations" %>
<%@ page import="javax.inject.Inject" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="css/style.css" type="text/css"/>
    <title>Create User</title>
    <style>
        body {
            background: url(images/pap.jpg);
        }
    </style>
</head>
<body>

<h1 class="title" align=center>CREATE USER</h1>
<form action="user" method="POST">
    <p class="title" align=center>First name:
        <input type="text" name="firstName">
    <p class="title" align=center>Last name:
        <input type="text" name="secondName">
    <p class="title" align=center>User name:
        <input type="text" name="userName">
    <p class="title" align=center>Password:
        <input type="text" name="password">
    <p class="title" align=center><input type="submit" value="Create">
</form>


<%!
    String firstName;
    String secondName;
    String userName;
    String password;
%>
<% String  firstName = request.getParameter("firstName");
    String secondName = request.getParameter("secondName");
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");%>

<%! User user = new User(firstName, secondName, userName, password);
    @Inject
    UsersOperations usersOperations;
    usersOperations.createUser(user);%>


</body>
</html>