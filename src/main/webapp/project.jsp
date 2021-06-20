<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.entity.Task" %>
<%@ page import="org.hibernate.Hibernate" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
    ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(ProjectOperations.class);
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
    String ID = request.getParameter("id");
    Long id = Long.parseLong(ID);
    Project project = projectOperations.findProject(id);
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
%>
<html>
<jsp:include page='header.jsp'/>
<body>
<jsp:include page='navbar.jsp'/>
<div class="p-5 mb-4 bg-light rounded-3">
    <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold"><%=project.getName()%></h1>
        <p class="col-md-8 fs-4"><%=project.getDescription()%></p>
        <p class="col-md-8 fs-4"><%=project.getCreator().getUserName()%></p>
    </div>
</div>
<table id="usersTable" class="table table-striped" style="width:100%">
    <thead>
    <tr>
        <th>Username</th>
        <th>First Name</th>
        <th>Last Name</th>
    </tr>
    </thead>
    <tbody>
    <% for(User user : project.getUsers()) {%>
    <tr value="<%=user.getID()%>">
        <td><a href="user.jsp?id=<%=user.getID()%>"><%=user.getUserName()%></a></td>
        <td><%=user.getFirstName()%></td>
        <td><%=user.getLastName()%></td>
    </tr>
    <%}%>
    </tbody>
</table>
</table>
<div class="table-responsive">
    <table id="taskTable" class="table table-striped" style="width:100%">
        <thead>
        <tr>
            <th>Name</th>
            <th>Status</th>
            <th>Priority</th>
            <th>Due Date</th>
            <th>Reporter</th>
            <th>Assignee</th>
        </tr>
        </thead>
        <tbody>
        <% for (Task task : project.getTasks()) {
        String duodate = simpleDateFormat.format(task.getDueDate());
        %>
        <tr value="<%=task.getID()%>">
            <td><a href="task.jsp?id=<%=task.getID()%>"><%=task.getName()%>
            </a></td>
            <td><%=task.getStatus()%></td>
            <td><%=task.getPriority()%></td>
            <td><%=duodate%></td>
            <td><a href="user.jsp?id=<%=task.getReporter().getID()%>"><%=task.getReporter().getUserName()%></a></td>
            <td><a href="user.jsp?id=<%=task.getAssignee().getID()%>"><%=task.getAssignee().getUserName()%></a></td>
        </tr>
        <%}%>
        </tbody>
    </table>
    <!-- Modal -->
    <div class="modal fade" id="createTaskModal" tabindex="-1" aria-labelledby="createTaskModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="createTaskModalLabel">Create Task</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="createTask.jsp?projectId=<%=project.getID()%>" method="POST">
                    <div class="modal-body">
                        <div class="mb-3 row form-floating">
                            <input type="text" class="form-control" id="floatingName" name="name" Name="name">
                            <label for="floatingName">Name</label>
                        </div>
                        <div class="mb-3 row">
                            <select class="form-select" aria-label="Default select example" name="priority">
                                <option selected disabled>Select Priority</option>
                                <%
                                    for(Task.Priority priority : Task.Priority.values()){
                                %>
                                <option value="<%=priority.name()%>"><%=priority.name()%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="mb-3 row form-floating">
                            <input type="date" class="form-control" id="floatingDueDate" name="dueDate" placeholder="Due Date">
                            <label for="floatingDueDate">Due Date</label>
                        </div>
                        <div class="mb-3 row ">
                            <select class="form-select" aria-label="Default select example" name="users">
                                <option selected disabled>Select asignee</option>
                                <%
                                    List<User> listUsers = new ArrayList<>();
                                    listUsers.add(project.getCreator());
                                    listUsers.addAll(project.getUsers());
                                    for(User k : listUsers){
                                %>
                                <option value="<%=k.getID()%>"><%=k.getUserName()%></option>
                                <%}%>
                            </select>
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
    <!-- Modal -->
    <div class="modal fade" id="addUser" tabindex="-1" aria-labelledby="addUserLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addUserLabel">Select User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="addUserInProject.jsp?id=<%=project.getID()%>" method="POST">
                    <div class="modal-body">
                    <div class="mb-3 row">
                        <select class="form-select" aria-label="Default select example" name="users">
                            <option selected disabled>Select User</option>
                            <%
                                List<User> listUserss = new ArrayList<>();
                                listUserss.addAll(usersOperations.findUsers());
                                listUserss.remove(project.getCreator());
                                listUserss.removeAll(project.getUsers());
                                //List<User> listUserss = usersOperations.findUsers();
                                for(User user : listUserss){
                            %>
                            <option value="<%=user.getID()%>"><%=user.getUserName()%></option>
                            <%}%>
                        </select>
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
</div>
<script>
    var button =
        '<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addUser">Add User</button> '+
        '<button type="button" id="deleteUser" class="btn btn-danger">Delete User</button';
    var buttons =
        '<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#createTaskModal">Add Task</button> ' +
        '<button type="button" id="editButton" class="btn btn-success">Edit Task</button> ' +
        '<button type="button" id="deleteButton" class="btn btn-danger">Delete Task</button';
    $(document).ready(function () {
        tableUser = createTable('#usersTable', button);
        table = createTable('#taskTable', buttons);
        $('#editButton').click( function () {
            var data = table.getSelected();
            sendEdit(data, 'updateTask.jsp')
        });
        $('#deleteButton').click( function () {
            var data = table.getSelected();
            sendDelete(data, 'removeTask.jsp');
        });
        $('#deleteUser').click( function () {
            var data = tableUser.getSelected();
            sendDelete(data, 'deleteUserInProject.jsp?id=' +  <%=project.getID()%>)});
    });
</script>
</body>
</html>
