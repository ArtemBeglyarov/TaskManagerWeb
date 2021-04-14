<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body style="margin-top: 300px">
<h1 class="title" align=center>Login User</h1>
<form action="login.jsp" method="POST">

    <p class="title" align=center>User name:
        <input type="text" name="userName">
    <p class="title" align=center>Password:
        <input type="text" name="password">
    <p class="title" align=center><input type="submit" value="Login">
</form>


<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<%
    if (request.getMethod().equals(HttpMethod.POST)) {

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        User user = usersOperations.loginUser(userName, password);

        if (user.getUserName().equals(userName) &&
                user.getPassword().equals(password)) {
            response.sendRedirect("login.jsp");
        }

        session.setAttribute("currUser", user);
    }
%>

</form>
</body>
</html>
