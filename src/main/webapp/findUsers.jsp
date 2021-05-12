<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
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

</table>

<section>

    <div id="dtBasicExample_wrapper" class="dataTables_wrapper dt-bootstrap4"
         >
        <div class="row">
            <div class="col-sm-12">
                <table id="dtBasicExample"
                       class="table table-striped table-bordered table-sm dataTable"
                       cellspacing="0" width="100%" role="grid"
                       aria-describedby="dtBasicExample_info"
                       style="width: 100%; margin-top: 200px">
                    <thead>
                    <tr>
                        <th><a href="createUser.jsp"><img style=" margin:10px"
                                                          src="css/images/add.png" width="20"
                                                          height="20" class="me-3" alt="CRETE"></a>
                            <a href="javascript:void(0);" onclick="fixLeaseFacilities()"><img
                                    style=" margin:10px" src="css/images/deleteUser.png"
                                    width="20" height="20" class="me-3" alt="HOME"> </a>
                        </th>
                        <th>
                            <form action="findUserByClick.jsp" method="GET">
                                <input type="text" placeholder="id...">
                                <button type="submit"></button>
                            </form>
                        </th>
                    </tr>
                    <tr role="row">
                        <th class="th-sm sorting_asc" tabindex="0"
                            aria-controls="dtBasicExample" rowspan="1"
                            colspan="1" aria-sort="ascending" aria-label="Name
          : activate to sort column descending" style="width: 123.2px;">
                        </th> <th class="th-sm sorting_asc" tabindex="0"
                            aria-controls="dtBasicExample" rowspan="1"
                            colspan="1" aria-sort="ascending" aria-label="Name
          : activate to sort column descending" style="width: 123.2px;">ID
                        </th>
                        <th class="th-sm sorting" tabindex="0"
                            aria-controls="dtBasicExample" rowspan="1"
                            colspan="1" aria-label="Position
          : activate to sort column ascending" style="width: 195.2px;">User name
                        </th>
                        <th class="th-sm sorting" tabindex="0"
                            aria-controls="dtBasicExample" rowspan="1"
                            colspan="1" aria-label="Office
          : activate to sort column ascending" style="width: 86.2px;">First name
                        </th>
                        <th class="th-sm sorting" tabindex="0"
                            aria-controls="dtBasicExample" rowspan="1"
                            colspan="1" aria-label="Age
          : activate to sort column ascending" style="width: 81.2px;">Second
                            name
                        </th>
                        <th class="th-sm sorting" tabindex="0"
                            aria-controls="dtBasicExample" rowspan="1"
                            colspan="1" aria-label="Start date
          : activate to sort column ascending" style="width: 84.2px;">Password
                        </th>
                        <th class="th-sm sorting" tabindex="0"
                            aria-controls="dtBasicExample" rowspan="1"
                            colspan="1" aria-label="Salary
          : activate to sort column ascending" style="width: 82.2px;">Status
                        </th>
                    </tr>
                    </thead>
                    <tbody>

                    <%
                        List<User> userEntities = usersOperations.findUsers();
                        for (User k : userEntities) {
                    %>
                    <tr role="row" class="odd">
                        <td style="align-content: center">
                            <input type="checkbox" class="custom-checkbox"
                                   id="id"
                                   name="lfcheckboxes" value="<%=k.getID()%>">
                        </td>
                        <td class="sorting_1"><%=k.getID()%>
                        </td>
                        <td>
                            <a href="findUserByClick.jsp?id=<%=k.getID()%>"
                               style="text-decoration: none;
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
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<script src="css/TM.js"></script>
<script src="css/deleteUser.js"></script>
</body>
</html>