<%@ page import="com.taskmanager.entity.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page import="com.taskmanager.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 13.05.2021
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%!
    ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(ProjectOperations.class);
%>
<%
    String ID = request.getParameter("id");
    Long id = Long.parseLong(ID);
    Project currProject = projectOperations.findProject(id);

%>

<html>
<head>
    <jsp:include page='header.jsp'/>
</head>
<body>
<form action="project.jsp" method="GET"></form>
<p>ID: <%=currProject.getID()%></p>
<p>User name:  <%=currProject.getNameProject()%></p>
<p class="title" align=center>Project users:
<table id="projectsTable" class="table table-striped table-bordered table-sm" cellspacing="0" width="100">
    <thead>
    <tr>
        <th class="th-sm">ID</th>
        <th class="th-sm">UsersProject</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Task> listTask = currProject.getTasks() ;
        for (Task k : listTask) {
    %>
    <tr>
        <td><%=k.getID()%></td>
        <td><a href="project.jsp?id=<%=k.getID()%>"
               style="text-decoration: none;
	color: white;"><%=k.getName()%>
        </a></td>
    </tr>
    <%
        }
    %>
    </tbody>
    <tfoot>
    <tr>
        <th >ID</th>
        <th >Name Task</th>
    </tr>
    </tfoot>
</table>
<p class="title" align=center>Project tasks:
<table id="taskTable" class="table table-striped table-bordered table-sm" cellspacing="0" width="100">
    <thead>
    <tr>
        <th class="th-sm">ID</th>
        <th class="th-sm">taskProject</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<User> listUsers = currProject.getUsers() ;
        for (User k : listUsers) {
    %>
    <tr>
        <td><%=k.getID()%></td>
        <td><a href="project.jsp?id=<%=k.getID()%>"
               style="text-decoration: none;
	color: white;"><%=k.getUserName()%>
        </a></td>
    </tr>
    <%
        }
    %>
    </tbody>
    <tfoot>
    <tr>
        <th >ID</th>
        <th >Name User</th>
    </tr>
    </tfoot>
</table>

<p>Description:  <%=currProject.getDescription()%></p>
<p>Creator:  <%=currProject.getCreatorID()%></p>
</body>
</html>
