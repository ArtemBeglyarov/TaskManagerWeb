<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE HTML>
<html>

<head>
    <jsp:include page='header.jsp'/>
</head>

<body>
<h1 class="title" align=center>ALL USER</h1>
<form action="findAllUsers.jsp" method="GET">
</form>

<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);

%>
<table id="myTable">
    <tr>
        <th onclick="sortTable(0)"></th>
        <th onclick="sortTable(0)">ID</th>
        <th onclick="sortTable(1)">User name</th>
        <th onclick="sortTable(1)">First name</th>
        <th onclick="sortTable(1)">Last name</th>
        <th onclick="sortTable(1)">Password</th>
        <th onclick="sortTable(1)">Status</th>
    </tr>
    <%
        ArrayList<User> userEntities = usersOperations.findAllUser();
        for (User k : userEntities) {
    %>
    <tr>
        <td>
            <form action="removeUser.jsp" method="GET">
                <input type="checkbox" class="custom-checkbox" id="id"
                       name="id" value="<%k.getID();%>"></form>
        </td>
        <td><%out.print(k.getID());%></td>
        <td>
                <a href="findUserByClick.jsp?id=<%=k.getID()%>" style="text-decoration: none;
	color: white;"><%out.print(k.getUserName());%></a>
        </td>
        <td><%out.print(k.getFirstName());%></td>
        <td><%out.print(k.getLastName()); %></td>
        <td><%out.print(k.getPassword());%></td>
        <td><%out.print(k.getStatus());%></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>