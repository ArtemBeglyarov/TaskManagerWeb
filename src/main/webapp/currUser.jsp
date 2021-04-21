<%@ page import="com.taskmanager.entity.UserEntity" %>
<%@ page import="com.taskmanager.entity.UserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

</head>
<body style="align-items: center">
<%
    UserEntity userEntity = (UserEntity) session.getAttribute("currUser");
%>
    <p> <%out.println("Name: "+ userEntity.getFirstName()); %></p>
    <p> <%out.println("Last name: "+ userEntity.getLastName()); %></p>
    <p> <%out.println("User name: "+ userEntity.getUserName()); %></p>
    <p> <%out.println("Id: "+ userEntity.getID()); %></p>

</body>
</html>
