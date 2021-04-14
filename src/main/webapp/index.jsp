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
<body style="background: url(images/pap.jpg);">
<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
    <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" align="center" a>Task
        Manager</a>
    </button>
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="login.jsp">Sign out</a>
        </li>
    </ul>
</header>

<p> <button class="btn btm-primary  btn-dark btn-block" type="button"
            data-bs-toggle="collapse" data-bs-target="#Project"
            aria-expanded="false" aria-controls="collapseExample">
        PROJECT
    </button>
<p>
    <button class="btn  btn-dark" type="button"
            data-bs-toggle="collapse" data-bs-target="#Task"
            aria-expanded="false" aria-controls="collapseExample">
        TASK
    </button>
<p>
    <button class="btn btn-dark" type="button"
            data-bs-toggle="collapse" data-bs-target="#User"
            aria-expanded="false" aria-controls="collapseExample">
        USER
    </button>
<p>
    <button class="btn  btn-dark btn-block btn-sm" type="button"
            data-bs-toggle="collapse" data-bs-target="#AllUser"
            aria-expanded="false" aria-controls="collapseExample">
        All USER
    </button>
<p>
    <button class="btn btn-dark" type="button"
            data-bs-toggle="collapse"
            data-bs-target="#CreateUser"
            aria-expanded="false" aria-controls="collapseExample">
        Create User
    </button>
<div class="container-fluid">
    <div class="col-md-12" style="background-color: #000000">
        ПАНЕЛЬ q12ffffffffffff
        </p>
        <div class="collapse" id="Project">
            <div class="card card-body">
                ОПИСАНИЕ ПРОЕКТА
            </div>
        </div>
        <div class="collapse" id="Task">
            <div class="card card-body">
                ОПИСАНИЕ ЗАДАЧ
            </div>
        </div>
        <div class="collapse" id="User">
            <div class="card card-body">
                <jsp:include page="currUser.jsp"/>
            </div>
        </div>
        <div class="collapse" id="AllUser">
            <div class="card card-body">
                <jsp:include page="findAllUsers.jsp"/>
            </div>
        </div>
        <div class="collapse" id="CreateUser"
             style="background-image:url(images/pap.jpg); ">
            <div class="card card-body">
                <jsp:include page="createUser.jsp"/>
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