<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="java.util.List" %>
<%@ page import="com.taskmanager.entity.Task" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }

%>
<html>
<jsp:include page='header.jsp'/>
<body>
<jsp:include page='navbar.jsp'/>
<%
    TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(TaskOperations.class);
    List<Task> tasks = taskOperations.findAllTasks();
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
%>
<main class="container">
    <div class="container-fluid">
        <div class="table-responsive">
            <table id="taskTable" class="table table-striped" style="width:100%">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Status</th>
                    <th>Priority</th>
                    <th>Due Date</th>
                    <th>Project</th>
                    <th>Reporter</th>
                    <th>Assignee</th>
                </tr>
                </thead>
                <tbody>
                <% for (Task task : tasks) {
                    String duodate = simpleDateFormat.format(task.getDueDate());
                %>
                <tr value="<%=task.getID()%>">
                    <td><a href="task.jsp?id=<%=task.getID()%>"><%=task.getName()%>
                    </a></td>
                    <td><%=task.getStatus()%></td>
                    <td><%=task.getPriority()%></td>
                    <td><%=duodate%></td>
                    <td><a href="project.jsp?id=<%=task.getProject().getID()%>"><%=task.getProject().getName()%></a></td>
                    <td><a href="user.jsp?id=<%=task.getReporter().getID()%>"><%=task.getReporter().getUserName()%></a></td>
                    <td>
                        <% if(task.getAssignee() != null){%>
                        <a href="user.jsp?id=<%=task.getAssignee().getID()%>"><%=task.getAssignee().getUserName()%></a>
                    <%}%>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
    </div>
</main>
<script>

    $(document).ready(function () {
        createTable('#taskTable', buttons);
    });
</script>
</body>
</html>
