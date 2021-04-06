<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<!DOCTYPE HTML>
<html>

<head>

    <meta charset="utf-8">
    <link rel="stylesheet" href="css/style.css" type="text/css"/>
    <title>Find User</title>
    <style>
        body {
            background: url(images/pap.jpg);
        }
    </style>
</head>
<body>
<h1 class="title" align=center>FIND USER</h1>
<form action="findUser.jsp" method="GET">
    <p class="title" align=center>Enter the id of the user you want to find:
    <p align=center><input type="text" name="id">
    <p class="title" align=center><input type="submit" value="Find">
</form>

<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<%String ID = request.getParameter("id");
    User user = usersOperations.findUser(ID);
%>


</body>
</html>