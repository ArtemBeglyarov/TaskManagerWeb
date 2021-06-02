<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="com.taskmanager.entity.Task" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
    TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(TaskOperations.class);
    Task task = null;
    String param = request.getParameter("id");
    if (param != null && param != "") {
        Long id = Long.parseLong(param);
        task = taskOperations.findTask(id);
    } else {
        response.sendRedirect("tasks.jsp");
    }

%>
<html>
<jsp:include page='header.jsp'/>
<body>
<jsp:include page='navbar.jsp'/>
<main class="container">
    <div class="container-fluid">
        <h1 class="title" align=center>UPDATE USER</h1>
        <form action="updateUser.jsp?id=<%=task.getID()%>" method="POST">
            <div class="mb-3 row form-floating">
                <input type="text" class="form-control" id="floatingUsername" name="userName" placeholder="Username" value="<%=user.getUserName()%>">
                <label for="floatingUsername">Username</label>
            </div>
            <div class="mb-3 row form-floating">
                <input type="text" class="form-control" id="floatingFirstname" name="firstName" placeholder="Firstname" value="<%=user.getFirstName()%>">
                <label for="floatingFirstname">Firstname</label>
            </div>
            <div class="mb-3 row form-floating">
                <input type="text" class="form-control" id="floatingLastname" name="lastName" placeholder="Lastname" value="<%=user.getLastName()%>">
                <label for="floatingLastname">Lastname</label>
            </div>
            <div class="mb-3 row form-floating">
                <input type="password" class="form-control" id="floatingPassword" name="password"
                       placeholder="Password">
                <label for="floatingPassword">Password</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="admin" name="status"
                       id="isAdminCheck" <%="admin".equals(user.getStatus()) ? "checked" : ""%>>
                <label class="form-check-label" for="isAdminCheck">
                    Is Admin?
                </label>
            </div>
            <div class="mb-3">
                <input class="btn btn-primary" type="submit" value="Update">
            </div>
        </form>
    </div>
</main>
    <% if (request.getMethod().equals(HttpMethod.POST)) {
    user.setFirstName(request.getParameter("firstName"));
    user.setLastName(request.getParameter("lastName"));
    user.setUserName(request.getParameter("userName"));
    user.setPassword(request.getParameter("password"));
    user.setStatus(request.getParameter("status"));
    usersOperations.updateUser(user);
    response.sendRedirect("users.jsp");
}
%>
