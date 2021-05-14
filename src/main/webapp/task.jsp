<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 13.05.2021
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<%!
    TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(TaskOperations.class);
%>
<%
    String ID = request.getParameter("id");
    Long id = Long.parseLong(ID);
    Task task = taskOperations.findTask(id);
%>
<h1 class="title" align=center>FIND TASK</h1>
<div class="d-flex flex-column p-3 bg-dark"
     style="width: 300px;height: 250px;;
     margin-top: 20px;
     border-radius: 24px; color: #dddddd">

    <p >ID: <%=task.getID()%></p>
    <p>Task name:  <%=task.getName()%></p>
    <p>Status: <%=task.getStatus()%></p>
    <p>Priority:  <%=task.getPriority() %></p>
    <p>Start Date:   <%=task.getStartData()%></p>
    <p>Due Date:   <%=task.getDueDate()%></p>
    <p>Due Date:   <%=task.getDescription()%></p>
</div>
</body>
</html>
