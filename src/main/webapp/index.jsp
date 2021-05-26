<%@ page import="com.taskmanager.entity.User" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
    response.sendRedirect("user.jsp");
%>