<%@ page import="com.taskmanager.entity.UserEntity" %><%--
  Created by IntelliJ IDEA.
  User: BeglyarovAM
  Date: 20.04.2021
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>@import url(css/style.css);</style>

    <%

        UserEntity currUser = (UserEntity) session.getAttribute("currUser");
        if (currUser == null) {
            response.sendRedirect("login.jsp");
        }
    %>

</head>
<body>
<form action="singOut.jsp" method="GET">
<%session.removeAttribute("currUser");
  response.sendRedirect("login.jsp");%>
</body>
</html>
