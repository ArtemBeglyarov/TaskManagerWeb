<%@ page import="com.taskmanager.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
%>
<head>
    <jsp:include page='header.jsp'/>
</head>

<body>

<h1 class="title" align=center>MY DATA</h1>
<table id="myTable">
    <tr>
        <th>ID</th>
        <th>First name</th>
        <th>Last name</th>
        <th>User name</th>
        <th>Password</th>
        <th>Status</th>
    </tr>
    <tr>
        <td><%=currUser.getID()%></td>
        <td><%=currUser.getFirstName()%></td>
        <td><%=currUser.getLastName() %></td>
        <td><%=currUser.getUserName() %></td>
        <td><%=currUser.getPassword()%></td>
        <td><%=currUser.getStatus()%></td>
    </tr>
</table>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>
