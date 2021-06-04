<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="java.util.List" %>
<%@ page import="com.taskmanager.entity.Task" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }

    TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(TaskOperations.class);
    String ID = request.getParameter("id");
    Long id = Long.parseLong(ID);
    Task currTask = taskOperations.findTask(id);

%>

<html>
<body>
<%


    if(currUser.getID() != currTask.getReporter().getID()){

    }
%>
<div class="collapse navbar-collapse" id="navbarCollapse">
    <ul class="navbar-nav me-auto mb-2 mb-md-0">
        <li class="nav-item">
            <a class="nav-link" href="projects.jsp">Projects</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="tasks.jsp">Tasks</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="users.jsp">Users</a>
        </li>
    </ul>
    <a class="btn btn-outline-danger" href="singOut.jsp">Log out</a>
</div>
</body>
</html>
