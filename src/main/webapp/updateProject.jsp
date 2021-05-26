<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
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
        <h1 class="title" align=center>UPDATE USER</h1>
        <form action="updateProject.jsp?id=<%=project.getID()%>" method="POST">
            <div class="mb-3 row form-floating">
                <input type="text" class="form-control" id="floatingName" name="name" placeholder="Name"
                       value="<%=project.getNameProject()%>">
                <label for="floatingName">Name</label>
            </div>
            <div class="mb-3 row form-floating">
                <input type="text" class="form-control" id="floatingDescription" name="description"
                       placeholder="Description" value="<%=project.getDescription()%>">
                <label for="floatingDescription">Description</label>
            </div>
            <div class="mb-3">
                <input class="btn btn-primary" type="submit" value="Update">
            </div>
        </form>
    </div>
</main>
    <% if (request.getMethod().equals(HttpMethod.POST)) {
    project.setNameProject(request.getParameter("name"));
    project.setDescription(request.getParameter("description"));
    //TODO Сделать здесь же обновление участников проекта
    projectOperations.updateProject(project);
    response.sendRedirect("projects.jsp");
}
%>
