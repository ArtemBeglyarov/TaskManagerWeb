<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 13.05.2021
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page import="com.taskmanager.entity.Task" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="com.taskmanager.entity.User" %>
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
<%!
  ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(ProjectOperations.class);
  TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(TaskOperations.class);
%>
<h1 class="title" align=center>TASKS</h1>
<form action="Tasks.jsp" method="GET">
  <table id="tasksTable" class="table table-striped table-bordered table-sm" cellspacing="0" width="100">
    <thead>
    <tr>
      <th class="th-sm">ID</th>
      <th class="th-sm">Name Project</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Task> listTasks = taskOperations.findAllTasks();
      for (Task k : listTasks) {
    %>
    <tr>
      <td><%=k.getID()%></td>
      <td><a href="task.jsp?id=<%=k.getID()%>"
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
      <th >Task Name</th>
    </tr>
    </tfoot>
  </table>
</form>
</body>
</html>
