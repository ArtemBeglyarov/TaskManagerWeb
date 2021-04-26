<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>

<%@ page import="com.taskmanager.entity.UserEntity" %>
<!DOCTYPE HTML>
<html>

<head>
    <style>@import url(css/style.css);</style>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
          crossorigin="anonymous">
    <title></title>
    <%

        UserEntity currUser = (UserEntity) session.getAttribute("currUser");
        if (currUser == null) {
            response.sendRedirect("login.jsp");
        }
    %>
    <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
        <a class="navbar-brand col-md-2" href="index.jsp"
           a>Task
            Manager</a>
        <a class="navbar-brand col-md-1 " align="center" a>
            <button class="btn btn-dark" type="button"
                    data-bs-toggle="collapse" data-bs-target="#UserOperations"
                    aria-expanded="false" aria-controls="collapseExample">
                USER
            </button>
            <button class="btn btm-primary  btn-dark btn-block" type="button"
                    data-bs-toggle="collapse" data-bs-target="#Project"
                    aria-expanded="false" aria-controls="collapseExample"
                    style="align: left">
                PROJECT
            </button>

            <button class="btn  btn-dark" type="button"
                    data-bs-toggle="collapse" data-bs-target="#Task"
                    aria-expanded="false" aria-controls="collapseExample">
                TASK
            </button>
        </a>


        <ul class="navbar-brand col-md-2 " ; align="center"
            style="color:
     forestgreen;">
            <%out.println("USER: " + currUser.getUserName());%>
            <% out.println("ID: " + currUser.getID()); %>
        </ul>


        <ul class="navbar-nav px-3">
            <li class="nav-item text-nowrap">
                <a class="nav-link" href="singOut.jsp">Sign out</a>
            </li>
        </ul>

    </header>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
            crossorigin="anonymous"></script>
</head>
<body style="background-image: url(css/images/background.jpg);">
<h1 class="title" align=center>FIND USER</h1>
<form action="findUser.jsp" method="GET">
    <p class="title" align=center>Enter the id of the userEntity you want to find:
    <p align=center><input type="text" name="id">
    <p class="title" align=center><input type="submit" value="Find">
</form>

<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<%
    String ID = request.getParameter("id");
    if (ID != null) {
        UserEntity userEntity = usersOperations.findUser(ID);
        System.out.println(userEntity.getFirstName());



    }

%>


</body>
</html>