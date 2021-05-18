<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="org.hibernate.hql.internal.ast.ParseErrorHandler" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.util.List" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<%
    Part part = request.getPart("filename");

    ObjectMapper om = new ObjectMapper();
    List<User> loadUser = om.readValue(new File(String.valueOf(part)),)
%>
</body>
</html>
