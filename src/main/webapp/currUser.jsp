<%@ page import="com.taskmanager.entity.UserEntity" %>
<%@ page import="com.taskmanager.entity.UserEntity" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <style>@import url(css/style.css);</style>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
          crossorigin="anonymous">
    <title>TASK MANAGER</title>
    <%
        UserEntity currUser = (UserEntity) session.getAttribute("currUser");
        if (currUser == null) {
            response.sendRedirect("login.jsp");
        }
    %>
    <header
            class="navbar navbar-expand-lg  bg-dark flex-column flex-md-row ">
        <a href="index.jsp"><img style=" margin:10px" src="css/images/home-circle-512.webp"
                                 width="50"
                                 height="45" class="me-3" alt="HOME"> </a>
        </button>
        <div class="dropdown" style=" margin:10px">
            <button class="btn btn-success   dropdown-toggle" style="background-color:
            #0B614B"
                    type="button"
                    data-toggle="dropdown">USER
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="currUser.jsp">My data</a>
                <a class="dropdown-item" href="createUser.jsp">Create
                    user</a>
                <a class="dropdown-item" href="findAllUsers.jsp">Find all
                    user</a>
                <a class="dropdown-item" href="findUser.jsp">Find user</a>
                <a class="dropdown-item" href="removeUser.jsp">Remove
                    user</a>
                <a class="dropdown-item" href="findUser.jsp">Update user</a>
            </div>
        </div>
        <div class="dropdown" style=" margin:10px">
            <button class="btn btn-success dropdown-toggle"  style="background-color: #0B614B" type="button"
                    data-toggle="dropdown">TASK
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="">description</a>
                <a class="dropdown-item" href="">description</a>
                <a class="dropdown-item" href="">description</a>

            </div>
        </div>

        <div class="dropdown" style=" margin:10px">
            <button class="btn btn-success dropdown-toggle"  style="background-color: #0B614B" type="button"
                    data-toggle="dropdown">PROJECT
            </button>
            <div class="dropdown-menu">
                <a class="dropdown-item" href="">description</a>
                <a class="dropdown-item" href="">description</a>
                <a class="dropdown-item" href="">description</a>
            </div>
        </div>
        <button class="btn btn-success" style="margin-left: auto!important;
        margin:10px; background-color: #0B614B"
                type="button"
                href="singOut.jsp">Sign out
        </button>
    </header>

</head>

<body>

<%
    UserEntity userEntity = (UserEntity) session.getAttribute("currUser");
%>
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
        <td><%out.print(userEntity.getID());%></td>
        <td><%out.print(userEntity.getFirstName());%></td>
        <td><%out.print(userEntity.getLastName()); %></td>
        <td><%out.print(userEntity.getUserName()); %></td>
        <td><%out.print(userEntity.getPassword());%></td>
        <td><%out.print(userEntity.getStatus());%></td>
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
