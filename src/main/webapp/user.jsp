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
<div class="container "
     style="
     float: left; width: 240px;height:280px;
     border-radius: 24px;background-color: #198754; color: #0a0a0a; align-items: center">

    <p style=" margin-top: 20px"><b>ID:</b> <%=user.getID()%>
    </p>
    <p><b>User name:</b> <%=user.getUserName() %>
    </p>
    <p><b>Fist name:</b> <%=user.getFirstName()%>
    </p>
    <p><b>Last name:</b> <%=user.getLastName() %>
    </p>
    <p><b>Status:</b> <%=user.getStatus()%>
    </p>
    <a class="btn btn-success"
       style="background-color:  #0e0d0d"
       href="updateUser.jsp?id=<%=user.getID()%>"
       role="button">EDIT
    </a>
</div>
<div class="container" style="
     float:left">
    <div class="table-responsive">
        <table id="taskTable" class="table table-striped" style="width:30%">
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
                     black"><%=task.getName()%>
                </a></td>
            </tr>
            <%}%>
            </tbody>
        </table>
    </div>
    <div class="table-responsive">
        <table id="taskTable2" class="table table-striped" style="width:30%">
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
                </a></td>
            </tr>
            <%}%>
            </tbody>
        </table>
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