<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 30.04.2021
  Time: 0:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.entity.Task" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page import="java.util.List" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head>
    <jsp:include page='header.jsp'/>
</head>
<body>
<h1 class="title" align=center>CREATE PROJECT</h1>
<form action="createProject.jsp" method="POST">
    <p class="title" align=center>Name Project:
        <input type="text" name="ProjectName">
    <p class="title" align=center>select users:
    <select name="Users">
        <%
            List<User> usersArrayList = usersOperations.findUsers();
            for (User k : usersArrayList) {
        %>
        <option value="<%=k.getID()%>"><%=k.getUserName()%></option>

        <%
        }
    %>
    </select>
    <%--<p class="title" align=center>select Tasks:
        <select name="Tasks">
            <%
                List<Task> tasksArrayList = taskOperations.findAllTask() ;
                for (Task t : tasksArrayList) {
            %>
            <option value="<%=t.getID()%>"><%=t.getName()%></option>
w
            <%
                }
            %>
        </select>
    <p class="title" align=center>enter Description:--%>
    <p class="title" align=center>enter Description:
        <input type="text" name="Description">
    <p class="title" align=center>Creator:
        <input type="text" value="<%=currUser.getUserName()%>" >
    <p class="title" align=center><input type="submit" value="Create">
</form>

    <%!
    ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(ProjectOperations.class);//
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
    TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(TaskOperations.class);
    %>

<% if (request.getMethod().equals(HttpMethod.POST)) {
    Project project = new Project();
    project.setNameProject(request.getParameter("ProjectName"));
    project.setUsers(usersArrayList);
    //project.setTasks(tasksArrayList);
    project.setDescription(request.getParameter("Description"));
    project.setCreatorID(currUser);
    projectOperations.createProject(project);
    response.sendRedirect("Projects.jsp");
}
%>
</body>
</html>
