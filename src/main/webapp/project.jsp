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

<p class="title" align=center>ID project:
    <input type="text" name="id">
<a class="d-flex flex-column p-3 bg-dark"
   style="width: 300px;height: 250px;;
     margin-top: 20px;
     border-radius: 24px; color: #dddddd">
</a>


<p>ID: <%=currProject.getID()%></p>
<p>User name:  <%=currProject.getNameProject()%></p>
</body>
</html>
