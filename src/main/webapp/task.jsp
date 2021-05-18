<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 09.05.2021
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page import="com.taskmanager.entity.Task" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="com.taskmanager.entity.User" %>
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
<%
    String ID = request.getParameter("id");
    Long id = Long.parseLong(ID);
    Task currTask = taskOperations.findTask(id);
%>
<h1 class="title" align=center>Task</h1>
<a class="btn btn-success"
   style="background-color:  #0B614B; margin-left:90%;  margin-top: 30px"  href="removeTask.jsp?id=<%=currTask.getID()%>"
   role="button">Remove Task
</a>
<a class="btn btn-success"
   style="background-color:  #0B614B; margin-left:90%;  margin-top: 30px"  href="updateTask.jsp?id=<%=currTask.getID()%>"
   role="button">Update task
</a>

<form action="task.jsp" method="GET"></form>
<p >ID: <%=currTask.getID()%></p>
<p>Task name:  <%=currTask.getName()%></p>
<p>Description: <%=currTask.getDescription()%></p>
<p>Priority: <%=currTask.getPriority()%></p>
<p>Status: <%=currTask.getStatus()%></p>
<p>Start Date: <%=currTask.getAssigneeId()%></p>
<p>Due Date: <%=currTask.getDueDate()%></p>
<p>Reporter: <%=currTask.getReporterId()%></p>
<p>Assignee: <%=currTask.getAssigneeId()%></p>
</body>
</html>
