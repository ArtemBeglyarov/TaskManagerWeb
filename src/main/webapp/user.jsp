<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="java.util.List" %>
<%@ page import="com.taskmanager.entity.Task" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="java.util.ArrayList" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
    TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(TaskOperations.class);
    User user = null;
    String param = request.getParameter("id");
    if (param != null && param != "") {
        Long id = Long.parseLong(param);
        user = usersOperations.findUser(id);
    } else {
        user = currUser;
    }

    List<Task> allTasks = taskOperations.findAllTasks();
    List<Task> ReporterTasksCurrUser = new ArrayList<>();
    List<Task> AssignedTaskCurrUser = new ArrayList<>();

    for (Task k : allTasks) {
        if (k.getReporter() == null) {
            break;
        }
        if (k.getReporter().getID() == user.getID()) {
            ReporterTasksCurrUser.add(k);
        }
    }
    for (Task k : allTasks) {
        if (k.getAssignee() == null) {
            break;
        }
        if (k.getAssignee().getID() == user.getID()) {
            AssignedTaskCurrUser.add(k);
        }
    }

%>
<!DOCTYPE html>
<html lang="ru">
<jsp:include page='header.jsp'/>
<body>
<jsp:include page='navbar.jsp'/>

<%--<ul class="list-group mb-3">--%>
<%--    <li class="list-group-item d-flex justify-content-between lh-sm">--%>
<%--        <div>--%>
<%--            <h6 class="my-0">ID</h6>--%>
<%--            <small class="text-muted"><%=user.getID()%></small>--%>
<%--        </div>--%>
<%--        <p style="float: right; margin-top: 20px"><a href="updateUser.jsp?id=<%=user.getID()%>"><img--%>
<%--                src="css/editImg.png" width="25" height="25" alt="edit"></a></p>--%>
<%--    </li>--%>
<%--    <li class="list-group-item d-flex justify-content-between lh-sm">--%>
<%--        <div>--%>
<%--            <h6 class="my-0">User name</h6>--%>
<%--            <small class="text-muted"> <%=user.getUserName() %></small>--%>
<%--        </div>--%>
<%--    </li>--%>
<%--    <li class="list-group-item d-flex justify-content-between lh-sm">--%>
<%--        <div>--%>
<%--            <h6 class="my-0">Last name</h6>--%>
<%--            <small class="text-muted">  <%=user.getLastName() %></small>--%>
<%--        </div>--%>
<%--    </li>--%>
<%--    <li class="list-group-item d-flex justify-content-between lh-sm">--%>
<%--        <div>--%>
<%--            <h6 class="my-0">Status</h6>--%>
<%--            <small class="text-muted"><%=user.getStatus()%></small>--%>
<%--        </div>--%>
<%--    </li>--%>
<%--</ul>--%>
<%--<div class="container "--%>
<%--     style="--%>
<%--     float: left; width: 240px;height:250px;--%>
<%--     border-radius: 24px;background-color: #198754; color: #0a0a0a; align-items: center">--%>
<%--    <a class="btn btn-success"--%>
<%--       style="background-color:  #0e0d0d;"--%>
<%--       href="updateUser.jsp?id=<%=user.getID()%>"--%>
<%--       role="button"><img width="20" height="20" src="css/editImg.png"/>--%>
<%--    </a>--%>
<%--    <p style="float: right; margin-top: 20px"><a href="updateUser.jsp?id=<%=user.getID()%>"><img--%>
<%--            src="css/editImg.png" width="25" height="25" alt="edit"></a></p>--%>
<%--    <p style=" margin-top: 20px"><b>ID:</b> <%=user.getID()%>--%>
<%--    </p>--%>
<%--    <p><b>User name:</b> <%=user.getUserName() %>--%>
<%--    </p>--%>
<%--    <p><b>Fist name:</b> <%=user.getFirstName()%>--%>
<%--    </p>--%>
<%--    <p><b>Last name:</b> <%=user.getLastName() %>--%>
<%--    </p>--%>
<%--    <p><b>Status:</b> <%=user.getStatus()%>--%>
<%--    </p>--%>

<%--</div>--%>
<div class="container" style="margin-top: 6%">
    <div class="row" style="width:60%; margin: auto" >
        <div class="col">
            <ul class="list-group mb-3">
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">ID</h6>
                        <small class="text-muted"><%=user.getID()%></small>
                    </div>
                    <p style="float: right"><a href="updateUser.jsp?id=<%=user.getID()%>"><img
                            src="css/editImg.png" width="25" height="25" alt="edit"></a></p>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">User name</h6>
                        <small class="text-muted"> <%=user.getUserName() %></small>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">First name</h6>
                        <small class="text-muted"> <%=user.getFirstName() %></small>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">Last name</h6>
                        <small class="text-muted">  <%=user.getLastName() %></small>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">Status</h6>
                        <small class="text-muted"><%=user.getStatus()%></small>
                    </div>
                </li>
            </ul>
        </div>
        <div class="col" >
            <div class="table-responsive">
                <table id="taskTable" class="table table-striped"
                       style="width:100%">
                    <thead>
                    <tr style="align-items: center">
                        <th>Created tasks</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (Task task : ReporterTasksCurrUser) {%>
                    <tr value="<%=task.getID()%>">
                        <td><a href="task.jsp?id=<%=task.getID()%>"
                               style="color:
                     black"><%=task.getName()%></a> <%=task.getStatus()%>
                        </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col">
            <div class="table-responsive">
            <table id="taskTable2" class="table table-striped"
                   style="width:100%">
                <thead>
                <tr style="align-items: center">
                    <th>Assigned tasks</th>
                </tr>
                </thead>
                <tbody>
                <% for (Task task2 : AssignedTaskCurrUser) {%>
                <tr value="<%=task2.getID()%>">
                    <td><a href="task.jsp?id=<%=task2.getID()%>"
                           style="color:
                                 black"><%=task2.getName()%>
                    </a><%=task2.getStatus()%></td>

                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
        </div>


</div>


<script>

    $(document).ready(function () {
        createTable('#taskTable', buttons);
    });
</script>
<script>

    $(document).ready(function () {
        createTable('#taskTable2', buttons);
    });
</script>
</body>
</html>