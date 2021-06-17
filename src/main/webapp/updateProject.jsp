<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
    UsersOperations usersOperations =  (UsersOperations) BeansStore.getBean(UsersOperations.class);
    ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(ProjectOperations.class);
    Project project = null;
    String param = request.getParameter("id");
    if (param != null && param != "") {
        Long id = Long.parseLong(param);
        project = projectOperations.findProject(id);
    } else {
        response.sendRedirect("projects.jsp");
    }

%>
<html>
<jsp:include page='header.jsp'/>
<body>
<jsp:include page='navbar.jsp'/>
<main class="container">
    <div class="container-fluid">
        <h1 class="title" align=center>UPDATE PROJECT</h1>
        <form action="updateProject.jsp?id=<%=project.getID()%>" method="POST">
            <div class="mb-3 row form-floating">
                <input type="text" class="form-control" id="floatingName" name="name" placeholder="Name"
                       value="<%=project.getName()%>">
                <label for="floatingName">Name</label>
            </div>
            <div class="mb-3 row form-floating">
                <input type="text" class="form-control" id="floatingDescription" name="description"
                       placeholder="Description" value="<%=project.getDescription()%>">
                <label for="floatingDescription">Description</label>
            </div>
            <div class="mb-3 row form-floating">
                <select class="form-select" aria-label="Default select example" name="users" placeholder="Description" value="<%=project.getUsers()%>">
                    <option selected disabled>Select Users</option>
                    <%
                        List<User> users = usersOperations.findUsers();
                        for(User user : users){
                    %>
                    <option value="<%=user.getID()%>"><%=user.getUserName()%></option>
                    <%}%>
                </select>
            </div>
            <div class="mb-3">
                <input class="btn btn-primary" type="submit" value="Update">
            </div>
        </form>
    </div>
</main>
    <% if (request.getMethod().equals(HttpMethod.POST)) {
    project.setName(request.getParameter("name"));
    project.setDescription(request.getParameter("description"));
    String ID = request.getParameter("users");
    Long id = Long.parseLong(ID);
    User user = usersOperations.findUser(id);
    project.addUsers(user);
    projectOperations.updateProject(project);
    response.sendRedirect("projects.jsp");
}
%>
