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
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
    if (request.getMethod().equals(HttpMethod.POST)) {
        User userEntity = new User();
        userEntity.setFirstName(request.getParameter("firstName"));
        userEntity.setLastName(request.getParameter("lastName"));
        userEntity.setUserName(request.getParameter("userName"));
        userEntity.setPassword(request.getParameter("password"));
        userEntity.setStatus(request.getParameter("status"));
        User user = usersOperations.createUser(userEntity);
        response.sendRedirect("users.jsp");
    }
%>