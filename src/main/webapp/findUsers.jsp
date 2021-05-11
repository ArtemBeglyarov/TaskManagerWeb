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
</head>
<body>

<form action="findUsers.jsp" method="GET">
</form>

<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<table id="myTable" style=" margin: auto!important; border-radius: 24px;">
    <tr>
        <th></th>
        <th><a href="createUser.jsp"><img style=" margin:10px"
                                          src="css/images/add.png"
                                          width="20"
                                          height="20" class="me-3" alt="CRETE">
        </a>

            <a href="javascript:void(0);" onclick="fixLeaseFacilities()"><img style=" margin:10px"
                            src="css/images/deleteUser.png"
                            width="20"
                            height="20
" class="me-3" alt="HOME"> </a>
        </th>
        <th>
            <form action="findUserByClick.jsp" method="GET">
                <input type="text" placeholder="id...">
                <button type="submit"></button>
            </form>
        </th>
    </tr>
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
    <tr>
        <td style="align-content: center">
            <input type="checkbox" class="custom-checkbox" id="id" name="lfcheckboxes" value="<%=k.getID()%>">
        </td>
        <td><%=k.getID()%>
        </td>
        <td>
            <a href="findUserByClick.jsp?id=<%=k.getID()%>" style="text-decoration: none;
	color: white;"><%=k.getUserName()%>
            </a>
        </td>
        <td><%=k.getFirstName()%>
        </td>
        <td><%=k.getLastName()%>
        </td>
        <td><%=k.getPassword()%>
        </td>
        <td><%=k.getStatus()%>
        </td>
    </tr>
    <%
        }
    %>
</table>

<script src="css/TM.js"></script>
<script src="css/deleteUser.js"></script>
</body>
</html>