<%@ page import="com.taskmanager.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>

    <meta charset="utf-8">

</head>
<body>
<%
    User user = (User) session.getAttribute("currUser");
%>
    <p> <%out.println("Name: "+user.getFirstName()); %></p>
    <p> <%out.println("Last name: "+user.getLastName()); %></p>
    <p> <%out.println("User name: "+user.getUserName()); %></p>
    <p> <%out.println("Id: "+ user.getID()); %></p>

</body>
</html>
