<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="java.util.ArrayList" %>
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
<form action="findAllUsers.jsp" method="GET">
    <p class="title" align=center>Enter the id of the user you want to find:

    <p class="title" align=center><input type="submit" value="Find">
</form>

<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<%
    ArrayList<User> users = usersOperations.findAllUser();
    for (User k : users) {
        System.out.println( k.getUserName());
//        String id;
//        response.sendRedirect(id = String.valueOf(k.getID()));
    }
%>


</body>
</html>