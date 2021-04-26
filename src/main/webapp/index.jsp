<%@ page import="com.taskmanager.entity.UserEntity" %>
<%@ page import="com.taskmanager.entity.UserEntity" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
          crossorigin="anonymous">
    <title></title>

</head>

<%
    UserEntity userEntity = (UserEntity) session.getAttribute("currUser");
    if (userEntity == null) {
        response.sendRedirect("login.jsp");
    }
%>
<body style="background: url(css/images/background.jpg);" lang="ru">
<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-md-2"   href="index.jsp"
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



    <ul  class="navbar-brand col-md-2 " ; align="center"
         style="color:
     forestgreen;">
<%--        <%out.println("USER: " + userEntity.getUserName());%>--%>
<%--        <% out.println("ID: " + userEntity.getID()); %>--%>
    </ul>



    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="singOut.jsp">Sign out</a>
        </li>
    </ul>

</header>
<div id="container" style="width:100%;">
    <div id="left" style="float:left; width:9%;">
        <div class="col-md-12">
            <div class="collapse" id="UserOperations">
                <div class="card card-body" style="background-color: #000000;
                 border-radius: 20px; align-items: center; display: flex">
                    <p>
                        <button class="btn btn-dark btn-block " type="button"
                                data-bs-toggle="collapse" data-bs-target="#User"
                                aria-expanded="false"
                                aria-controls="collapseExample">
                            My data
                        </button>
                    <p>
                        <button class="btn btn-dark" type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#AllUser"
                                aria-expanded="false"
                                aria-controls="collapseExample">
                            Show all userEntities
                        </button>
                    <p>
                        <button class="btn btn-dark" type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#CreateUser"
                                aria-expanded="false"
                                aria-controls="collapseExample">
                            Create userEntity
                        </button>
                    <p>
                        <button class="btn btn-dark" type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#UpdateUser"
                                aria-expanded="false"
                                aria-controls="collapseExample">
                            Update userEntity
                        </button>
                    <p>
                        <button class="btn btn-dark" type="button"
                                data-bs-toggle="collapse"
                                data-bs-target="#RemoveUser"
                                aria-expanded="false"
                                aria-controls="collapseExample">
                            Remove userEntity
                        </button>
                </div>
            </div>
            <div class="collapse" id="Project">
                <div class="card card-body" style="background-color: #000000;
                 border-radius: 20px; align-items: center;">
                    ОПИСАНИЕ ПРОЕКТА
                </div>
            </div>
            <div class="collapse" id="Task">
                <div class="card card-body" style="background-color: #000000;
                 border-radius: 20px; align-items: center;">
                    ОПИСАНИЕ ЗАДАЧ
                </div>
            </div>
        </div>
    </div>
    <div id="right" style="float:left; width:91%;">
        <div class="container-fluid">
            <div class="col-12"
                 style="background-color: #000000;border-radius: 30px">
                </p>
                <div class="collapse" id="User">
                    <div class="card card-body"
                         style="background-color: lightslategray">
                        <jsp:include page="currUser.jsp"/>
                    </div>
                </div>
                <div class="collapse" id="AllUser">
                    <div class="card card-body"
                         style="background-color: lightslategray">
                        <jsp:include page="findAllUsers.jsp"/>
                    </div>
                </div>
                <div class="collapse" id="CreateUser">
                    <div class="card card-body"
                         style="background-color: lightslategray">
                        <jsp:include page="createUser.jsp"/>
                    </div>
                </div>
                <div class="collapse" id="UpdateUser">
                    <div class="card card-body"
                         style="background-color: lightslategray">
                        <jsp:include page="updateUser.jsp"/>
                    </div>
                </div>
                <div class="collapse" id="RemoveUser">
                    <div class="card card-body"
                         style="background-color: lightslategray">
                        <jsp:include page="removeUser.jsp"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
        crossorigin="anonymous"></script>
</body>
</html>