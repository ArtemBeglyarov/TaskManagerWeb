
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.BeansStore" %>

<%@ page import="com.taskmanager.entity.User" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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

<body>

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
        <input type="password" name="status">
    <p class="title" align=center><input type="submit" value="Create">
</form>


<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
//
//    JavaBeans javaBeans = (JavaBeans) BeansStore.getBean(JavaBeans.class);

%>


<% if (request.getMethod().equals(HttpMethod.POST)) {
    User userEntity = new User();
    userEntity.setFirstName(request.getParameter("firstName"));
    userEntity.setLastName(request.getParameter("secondName"));
    userEntity.setUserName(request.getParameter("userName"));
    userEntity.setPassword(request.getParameter("password"));
    userEntity.setStatus(request.getParameter("status"));
    usersOperations.createUser(userEntity);
//    javaBeans.saveUser(userEntity);
    response.sendRedirect("findAllUsers.jsp");

}
%>


</body>
</html>