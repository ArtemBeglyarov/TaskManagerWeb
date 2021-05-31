<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="java.util.List" %>
<%@ page import="com.taskmanager.entity.Task" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<%!
    TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(TaskOperations.class);
    List<Task> tasks = taskOperations.findAllTasks();
    Project project = new Project();
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
                <% for (Task task : tasks) {%>
                <tr value="<%=task.getID()%>">
                    <td><a href="task.jsp?id=<%=task.getID()%>"><%=task.getName()%>
                    </a></td>
                    <td><%=task.getStatus()%>></td>
                    <td><%=task.getPriority()%>></td>
                    <td><%=task.getDueDate()%>></td>
                    <td><a href="project.jsp?id=<%=task.getProject().getID()%>"><%=task.getProject().getNameProject()%></a></td>
                    <td><a href="user.jsp?id=<%=task.getReporter().getID()%>"><%=task.getReporter().getUserName()%></a></td>
                    <td><a href="user.jsp?id=<%=task.getAssignee().getID()%>"><%=task.getAssignee().getUserName()%></a></td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="createTaskModal" tabindex="-1" aria-labelledby="createTaskModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="createTaskModalLabel">Create Task</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="createTask.jsp" method="POST"> ///???? зачем
                    <div class="modal-body">
                        <div class="mb-3 row form-floating">
                            <input type="text" class="form-control" id="floatingName" name="name" Name="Name">
                            <label for="floatingName">Name</label>
                        </div>
                        <div class="mb-3 row">
                            <select class="form-select" aria-label="Default select example">
                                <option selected disabled>Select Priority</option>
                                <%
                                    for(Task.Priority priority : Task.Priority.values()){
                                %>
                                <option value="<%=priority.toString()%>>"><%=priority.toString()%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="mb-3 row form-floating">
                            <input type="date" class="form-control" id="floatingDueDate" name="dueDate" placeholder="Due Date">
                            <label for="floatingDueDate">Due Date</label>
                        </div>
                        <div class="mb-3 row form-floating">
                            <input type="text" class="form-control" id="floatingDescription" name="description" placeholder="Description">
                            <label for="floatingDescription">Description</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" class="btn btn-primary"/>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>
<script>
    var buttons =
        '<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#createTaskModal">Add Task</button> ' +
        '<button type="button" id="editButton" class="btn btn-success">Edit Task</button> ' +
        '<button type="button" id="deleteButton" class="btn btn-danger"">Delete Task</button';
    $(document).ready(function () {
        createTable('#taskTable', buttons);
        $('#editButton').click( function () {
            var data = table.getSelected();
            sendEdit(data, 'updateProject.jsp')
        });
        $('#deleteButton').click( function () {
            var data = table.getSelected();
            sendDelete(data, 'removeProject.jsp');
        });
    });
</script>
</body>
</html>
