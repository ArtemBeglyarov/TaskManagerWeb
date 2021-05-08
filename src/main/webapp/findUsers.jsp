<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
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
    <form action="removeUser.jsp" method="GET">
        <input style="margin-left:80%; margin-top: 30px" type="text" name="id"><input type="submit" value="Remove"
                                                        onclick="return confirmation()">
    </form>
    <form action="findUserByClick.jsp" method="GET" >
        <input style="margin-left:80%;" type="text" name="id"><input type="submit" value="Find">
    </form>
    <a class="btn btn-success"
       style="background-color:  #0B614B; margin-left:90%;  margin-top: 30px"  href="createUser.jsp"
       role="button">Create user
    </a>
</head>

<body>
<h1 class="title" align=center>ALL USER</h1>

<form action="findUsers.jsp" method="GET">
</form>

<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<table id="myTable" style=" margin: auto!important; border-radius: 24px;">
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
        List<User> userEntities = usersOperations.findUsers();
        for (User k : userEntities) {
    %>
    <tr >
        <td style="align-content: center">
            <form action="removeUser.jsp" method="GET">
                <input  type="checkbox" class="custom-checkbox" id="id" name="id" value="<%=k.getID()%>"></form>
        </td>
        <td><%=k.getID()%></td>
        <td>
                <a href="findUserByClick.jsp?id=<%=k.getID()%>" style="text-decoration: none;
	color: white;"><%=k.getUserName()%></a>
        </td>
        <td><%=k.getFirstName()%></td>
        <td><%=k.getLastName()%></td>
        <td><%=k.getPassword()%></td>
        <td><%=k.getStatus()%></td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>