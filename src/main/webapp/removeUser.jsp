<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.io.File" %>
<%@ page import="com.taskmanager.repository.Repository" %>
<%@ page import="java.net.SocketTimeoutException" %>


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
<h1 class="title" align=center>REMOVE USER</h1>
<form action="removeUser.jsp" method="GET">
    <p class="title" align=center>Enter the id of the userEntity you want to
        delete:
    <p align=center><input type="text" name="id">
    <p class="title" align=center><input type="submit" value="Remove"
                                         onclick="return confirmation()">
</form>

<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);

%>
<%
    String ID = request.getParameter("id");
    if (ID != null) {
        Long id = Long.parseLong(ID);

//

    }
    String checkID =request.getParameter("ID");
//

    ObjectMapper mapper = new ObjectMapper();
  Long[] listID = mapper.readValue(checkID,Long[].class);
    for (Long k:listID){
        usersOperations.removeUserById(k);
    }
    response.sendRedirect("findUsers.jsp");

%>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<script src="css/TM.js"></script>
</body>
</html>