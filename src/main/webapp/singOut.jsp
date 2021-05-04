
<%@ page import="com.taskmanager.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
<form action="singOut.jsp" method="GET">
<%session.removeAttribute("currUser");
  response.sendRedirect("login.jsp");%>
</body>
</html>
