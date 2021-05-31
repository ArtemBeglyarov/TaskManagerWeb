<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="java.util.List" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
%>

<!DOCTYPE HTML>
<html>
<jsp:include page='header.jsp'/>
<body>
<jsp:include page='navbar.jsp'/>
<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
//    List<User> users = usersOperations.findUsers();
%>
<%List<User> users = usersOperations.findUsers();
    for (User check : users) {
        System.out.println(check.toString());
    }
%>
<main class="container">
    <div class="container-fluid">
        <div class="table-responsive">
            <table id="usersTable" class="table table-striped" style="width:100%">
                <thead>
                <tr>
                    <th>Username</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <% for(User user : users){%>
                <tr value="<%=user.getID()%>">
                    <td><a href="user.jsp?id=<%=user.getID()%>"><%=user.getUserName()%></a></td>
                    <td><%=user.getFirstName()%></td>
                    <td><%=user.getLastName()%></td>
                    <td><%=user.getStatus()%></td>
                </tr>
                <%}%>
                </tbody>
            </table>
            <!-- Modal -->
            <div class="modal fade" id="createUserModal" tabindex="-1" aria-labelledby="createUserModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="createUserModalLabel">Create User</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="createUser.jsp" method="POST">
                        <div class="modal-body">

                                <div class="mb-3 row form-floating">
                                    <input type="text" class="form-control" id="floatingUsername" name="userName" placeholder="Username">
                                    <label for="floatingUsername">Username</label>
                                </div>
                                <div class="mb-3 row form-floating">
                                    <input type="text" class="form-control" id="floatingFirstname" name="firstName" placeholder="Firstname">
                                    <label for="floatingFirstname">Firstname</label>
                                </div>
                                <div class="mb-3 row form-floating">
                                    <input type="text" class="form-control" id="floatingLastname" name="lastName" placeholder="Lastname">
                                    <label for="floatingLastname">Lastname</label>
                                </div>
                                <div class="mb-3 row form-floating">
                                    <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password">
                                    <label for="floatingPassword">Password</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="admin" name="status" id="isAdminCheck">
                                    <label class="form-check-label" for="isAdminCheck">
                                        Is Admin?
                                    </label>
                                </div>

                        </div>
                        <div class="modal-footer">
                            <input type="submit" class="btn btn-primary"></input>
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
                '<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#createUserModal">Add User</button> ' +
                '<button type="button" id="editButton" class="btn btn-success">Edit User</button> ' +
                '<button type="button" id="deleteButton" class="btn btn-danger"">Delete Users</button';
            $(document).ready(function () {
                table = createTable('#usersTable', buttons);
                $('#editButton').click( function () {
                    var data = table.getSelected();
                    sendEdit(data, 'updateUser.jsp')
                });
                $('#deleteButton').click( function () {
                    var data = table.getSelected();
                    sendDelete(data, 'removeUser.jsp');
                });
            });
        </script>
</body>
</html>