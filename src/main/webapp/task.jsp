
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.BeansStore" %>
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
<jsp:include page='header.jsp'/>
<body>
<jsp:include page='navbar.jsp'/>
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
//кнопка
<form action="task.jsp" method="GET"></form>
<p >ID: <%=currTask.getID()%></p>
<p>Task name:  <%=currTask.getName()%></p>
<p>Description: <%=currTask.getDescription()%></p>
<p>Priority: <%=currTask.getPriority()%></p>
<p>Status: <%=currTask.getStatus()%></p>
<p>Start Date: <%=currTask.getAssignee()%></p>
<p>Due Date: <%=currTask.getDueDate()%></p>
<p>Reporter: <%=currTask.getReporter()%></p>
<p>Assignee: <%=currTask.getAssignee()%></p>
</body>
</html>
