<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.entity.Task" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.CommentsOperations" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.Comment" %>
<%@ page import="java.util.*" %>
<%@ page import="com.taskmanager.entity.Comment" %>

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
<%
    ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(ProjectOperations.class);
    TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(TaskOperations.class);
    CommentsOperations co = (CommentsOperations) BeansStore.getBean(CommentsOperations.class);
    String ID = request.getParameter("id");
    Long id = Long.parseLong(ID);
    Task currTask = taskOperations.findTask(id);
%>
<%
    if(currUser.getID() != currTask.getReporter().getID()){
%>
    <div class="nav-scroller bg-body shadow-sm">
        <a class="nav-link active" aria-current="page" href="" value="<%=currTask.setStatus(Task.Status.ADDITIONAL_INFO_REQUIRED)%>">Status is AIR</a>

        <a class="nav-link" href=""></a>
        <a class="nav-link" href=""></a>
            <%


    }
%>
<h1 class="title" align=center>Task</h1>
<a class="btn btn-success"
   style="background-color:  #0B614B; margin-left:90%;  margin-top: 30px"
   href="removeTask.jsp?id=<%=currTask.getID()%>"
   role="button">Remove Task
</a>
<a class="btn btn-success"
   style="background-color:  #0B614B; margin-left:90%;  margin-top: 30px"
   href="updateTask.jsp?id=<%=currTask.getID()%>"
   role="button">Update task
</a>
<form action="task.jsp" method="GET"></form>
<p>ID: <%=currTask.getID()%>
</p>
<p>Task name:  <%=currTask.getName()%>
</p>
<p>Description: <%=currTask.getDescription()%>
</p>
<p>Priority: <%=currTask.getPriority()%>
</p>
<p>Status: <%=currTask.getStatus()%>
</p>
<p>Start Date: <%=currTask.getStartData()%>
</p>
<p>Due Date: <%=currTask.getDueDate()%>
</p>
<p>Reporter: <%=currTask.getReporter()%>
</p>
<p>Assignee: <%=currTask.getAssignee()%>
</p>

<hr>
<%
    if (currTask.getComments() != null) {

        Set<Comment> commentTask = currTask.getComments();
        for (Comment k : commentTask){%>

<p><%=k.getCreateData()%> <%=k.getCreatorComment().getUserName()%>:
    <%=k.getComment()%>
</p>
<%}}%>

<form action="commentTask.jsp?id=<%=currTask.getID()%>" method="post">
    <p><b>Your comment:</b></p>
    <p><textarea rows="5" cols="55"
                 name="comment"><%currUser.getUserName();%></textarea></p>
    <p><input type="submit" value="Отправить"></p>
</form>


</body>
</html>
