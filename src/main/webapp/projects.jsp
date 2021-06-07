<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 13.05.2021
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
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
<%
    ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(ProjectOperations.class);
    List<Project> projects = projectOperations.findAllProjects();
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<main class="container">
<div class="container-fluid">
    <div class="table-responsive">
        <table id="projectTable" class="table table-striped" style="width:100%">
            <thead>
            <tr>
                <th>Name</th>
                <th>Description</th>
            </tr>
            </thead>
            <tbody>
            <% for(Project project : projects){%>
            <tr value="<%=project.getID()%>">
                <td><a href="project.jsp?id=<%=project.getID()%>"><%=project.getName()%></a></td>
                <td><%=project.getDescription()%></td>
            </tr>
            <%}%>
            </tbody>
        </table>
        <!-- Modal -->
        <div class="modal fade" id="createProjectModal" tabindex="-1" aria-labelledby="createProjectModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="createProjectModalLabel">Create Project</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="createProject.jsp" method="POST">
                        <div class="modal-body">

                            <div class="mb-3 row form-floating">
                                <input type="text" class="form-control" id="floatingUsername" name="name" placeholder="Name">
                                <label for="floatingUsername">Name</label>
                            </div>
                            <div class="mb-3 row form-floating">
                                <input type="text" class="form-control" id="floatingFirstname" name="description" placeholder="Description">
                                <label for="floatingFirstname">Description</label>
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
</div>
</main>
<script>
    var buttons =
        '<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#createProjectModal">Add Project</button> ' +
        '<button type="button" id="editButton" class="btn btn-success">Edit Project</button> ' +
        '<button type="button" id="deleteButton" class="btn btn-danger"">Delete Project</button';
    $(document).ready(function () {
        table = createTable('#projectTable', buttons);
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
