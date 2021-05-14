<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 13.05.2021
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.entity.Task" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.sql.Array" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  <h1 class="title" align=center>PROJECTS</h1>
  <form action="Projects.jsp" method="GET">
    <%!
      ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(ProjectOperations.class);
    %>
  <table id="projectsTable" class="table table-striped table-bordered table-sm" cellspacing="0" width="100">
    <thead>
    <tr>
      <th class="th-sm">ID</th>
      <th class="th-sm">Name Project</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Project> listProjects = projectOperations.findAllProjects();
      for (Project k : listProjects) {
    %>
    <tr>
      <td><%=k.getID()%></td>
      <td><a href="project.jsp?id=<%=k.getID()%>"
             style="text-decoration: none;
	color: white;"><%=k.getNameProject()%>
      </a></td>
    </tr>
    <%
      }
    %>
    </tbody>
    <tfoot>
    <tr>
      <th >ID</th>
      <th >Name Project</th>
    </tr>
    </tfoot>
  </table>
  </form>
  </body>
</html>
