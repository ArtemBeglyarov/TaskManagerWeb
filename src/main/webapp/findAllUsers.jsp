<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.UserEntity" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.taskmanager.entity.UserEntity" %>
<!DOCTYPE HTML>
<html>

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
<h1 class="title" align=center>ALL USER</h1>
<form action="findAllUsers.jsp" method="GET">
</form>

<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);

%>
<table>
    <tr>
        <th>Name</th>
        <th>Last name</th>
        <th>User name</th>
        <th>ID</th>
        <th>Password</th>
        <th>Status</th>
    </tr>
    <div class="row">
        <div class="col-sm-12">
            <table id="dtBasicExample"
                   class="table table-striped table-bordered table-sm dataTable"
                   cellspacing="0" width="100%" role="grid"
                   aria-describedby="dtBasicExample_info" style="width: 100%;">
                <thead>
                <tr role="row">
                    <th class="th-sm sorting_asc" tabindex="0"
                        aria-controls="dtBasicExample" rowspan="1" colspan="1"
                        aria-label="Name
          : activate to sort column descending" style="width: 134.2px;"
                        aria-sort="ascending">Name
                    </th>
                    <th class="th-sm sorting" tabindex="0"
                        aria-controls="dtBasicExample" rowspan="1" colspan="1"
                        aria-label="Position
          : activate to sort column ascending" style="width: 210.2px;">Position
                    </th>
                    <th class="th-sm sorting" tabindex="0"
                        aria-controls="dtBasicExample" rowspan="1" colspan="1"
                        aria-label="Office
          : activate to sort column ascending" style="width: 94.2px;">Office
                    </th>
                    <th class="th-sm sorting" tabindex="0"
                        aria-controls="dtBasicExample" rowspan="1" colspan="1"
                        aria-label="Age
          : activate to sort column ascending" style="width: 89.2px;">Age
                    </th>
                    <th class="th-sm sorting" tabindex="0"
                        aria-controls="dtBasicExample" rowspan="1" colspan="1"
                        aria-label="Start date
          : activate to sort column ascending" style="width: 93.2px;">Start date
                    </th>
                    <th class="th-sm sorting" tabindex="0"
                        aria-controls="dtBasicExample" rowspan="1" colspan="1"
                        aria-label="Salary
          : activate to sort column ascending" style="width: 90.2px;">Salary
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr role="row" class="odd">
                    <td class="sorting_1">Airi Satou</td>
                    <td class="">Accountant</td>
                    <td>Tokyo</td>
                    <td>33</td>
                    <td>2008/11/28</td>
                    <td>$162,700</td>
                </tr>
                <tr role="row" class="even">
                    <td class="sorting_1">Angelica Ramos</td>
                    <td class="">Chief Executive Officer (CEO)</td>
                    <td>London</td>
                    <td>47</td>
                    <td>2009/10/09</td>
                    <td>$1,200,000</td>
                </tr>
                <tr role="row" class="odd">
                    <td class="sorting_1">Ashton Cox</td>
                    <td class="">Junior Technical Author</td>
                    <td>San Francisco</td>
                    <td>66</td>
                    <td>2009/01/12</td>
                    <td>$86,000</td>
                </tr>
                <tr role="row" class="even">
                    <td class="sorting_1">Bradley Greer</td>
                    <td class="">Software Engineer</td>
                    <td>London</td>
                    <td>41</td>
                    <td>2012/10/13</td>
                    <td>$132,000</td>
                </tr>
                <tr role="row" class="odd">
                    <td class="sorting_1">Brenden Wagner</td>
                    <td class="">Software Engineer</td>
                    <td>San Francisco</td>
                    <td>28</td>
                    <td>2011/06/07</td>
                    <td>$206,850</td>
                </tr>
                <tr role="row" class="even">
                    <td class="sorting_1">Brielle Williamson</td>
                    <td class="">Integration Specialist</td>
                    <td>New York</td>
                    <td>61</td>
                    <td>2012/12/02</td>
                    <td>$372,000</td>
                </tr>
                <tr role="row" class="odd">
                    <td class="sorting_1">Bruno Nash</td>
                    <td class="">Software Engineer</td>
                    <td>London</td>
                    <td>38</td>
                    <td>2011/05/03</td>
                    <td>$163,500</td>
                </tr>
                <tr role="row" class="even">
                    <td class="sorting_1">Caesar Vance</td>
                    <td class="">Pre-Sales Support</td>
                    <td>New York</td>
                    <td>21</td>
                    <td>2011/12/12</td>
                    <td>$106,450</td>
                </tr>
                <tr role="row" class="odd">
                    <td class="sorting_1">Cara Stevens</td>
                    <td class="">Sales Assistant</td>
                    <td>New York</td>
                    <td>46</td>
                    <td>2011/12/06</td>
                    <td>$145,600</td>
                </tr>
                <tr role="row" class="even">
                    <td class="sorting_1">Cedric Kelly</td>
                    <td class="">Senior Javascript Developer</td>
                    <td>Edinburgh</td>
                    <td>22</td>
                    <td>2012/03/29</td>
                    <td>$433,060</td>
                </tr>
                </tbody>
                <tfoot>
                <tr>
                    <th rowspan="1" colspan="1">Name
                    </th>
                    <th rowspan="1" colspan="1">Position
                    </th>
                    <th rowspan="1" colspan="1">Office
                    </th>
                    <th rowspan="1" colspan="1">Age
                    </th>
                    <th rowspan="1" colspan="1">Start date
                    </th>
                    <th rowspan="1" colspan="1">Salary
                    </th>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <%
        ArrayList<UserEntity> userEntities = usersOperations.findAllUser();
        for (UserEntity k : userEntities) {


    %>

    <tr>
        <td><%out.print(k.getFirstName());%></td>
        <td><%out.print(k.getLastName()); %></td>
        <td
        ><%out.print(k.getUserName()); %></td>
        <td><%out.print(k.getID()); %></td>
        <td
        ><%out.print(k.getPassword());%></td>
        <td><%out.print(k.getStatus());%></td>
    </tr>

    <%
        }
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
</table>
</body>
</html>