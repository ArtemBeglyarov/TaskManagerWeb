<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body style="margin-top: 300px;)">
<div class="login-box">
<h1 class="title" align=center>LOGIN USER</h1>
<form action="login.jsp" method="POST">

   <div class="textbox">
       <i class="fa fa-user" aria-hidden="true"></i>
      <input type="text" placeholder="Username" name="userName">
   </div>
    <div class="textbox">
        <i class="fa fa-lock" aria-hidden="true"></i>
        <input type="password" placeholder="Password" name="password">
    </div>
    <input class="btn"  type="submit" value="Login">

</form>
</div>
<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<%
    if (request.getMethod().equals(HttpMethod.POST)) {

        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        User userEntity = usersOperations.loginUser(userName,password);

        if (userEntity == null) {

        } else {
            session.setAttribute("currUser", userEntity);
            response.sendRedirect("index.jsp");
        }
    }
%>
</form>
</body>
</html>
