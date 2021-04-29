<%@ page import="com.taskmanager.entity.UserEntity" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head>
    <jsp:include page='header.jsp'/>
</head>

<body style="background-image: url(css/images/background.jpg);">
<h1 class="title" align=center>UPDATE USER</h1>
<form action="updateUser.jsp" method="POST">
    <p class="title" align=center>Change first name to:
        <input type="text" name="firstName" value="<%out.print(currUser.getFirstName());%>">
    <p class="title" align=center>Change last name to:
        <input type="text" name="secondName"
               value="<%out.print(currUser.getLastName());%>">
    <p class="title" align=center>Change userEntity name to:
        <input type="text" name="userName" value="<%out.print(currUser.getUserName());%>">
    <p class="title" align=center>Change password to:
        <input type="text" name="password" value="<%out.print(currUser.getPassword());%>">
    <p class="title" align=center>Change status to:
        <input type="text" name="status" value="<%out.print(currUser.getStatus());%>">
    <p class="title" align=center><input type="submit" value="Update">
</form>


<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<% if (request.getMethod().equals(HttpMethod.POST)) {
    currUser.setFirstName(request.getParameter("firstName"));
    currUser.setLastName(request.getParameter("secondName"));
    currUser.setUserName(request.getParameter("userName"));
    currUser.setPassword(request.getParameter("password"));
    currUser.setStatus(request.getParameter("status"));
    usersOperations.updateUser(currUser);
}

%>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
