<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE HTML>
<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

</head>
<body>
<h1 class="title" align=center>ALL USER</h1>
<form action="findAllUsers.jsp" method="GET">
</form>

<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<table>
    <tr>
        <th>Name</th>
        <th>Last name</th>
        <th>User name</th>
        <th>ID</th>
        <th>Password</th>
        <th>Status</th>
    </tr>
<%
    ArrayList<User> users = usersOperations.findAllUser();
    for (User k : users) {

%>

<tr><td><%out.print(k.getFirstName());%></td><td><%out.print(k.getLastName()); %></td><td
><%out.print(k.getUserName()); %></td><td><%out.print(k.getID()); %></td><td
><%out.print(k.getPassword());%></td><td><%out.print(k.getStatus());%></td></tr>

<%
    }
%>
</table>
</body>
</html>