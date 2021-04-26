<%@ page import="com.taskmanager.entity.UserEntity" %><%--
  Created by IntelliJ IDEA.
  User: BeglyarovAM
  Date: 20.04.2021
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<body>
<form action="singOut.jsp" method="GET">
<%session.removeAttribute("currUser");
  response.sendRedirect("login.jsp");%>
</body>
</html>
