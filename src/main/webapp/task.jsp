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
<%@ page import="com.taskmanager.exchange.Download" %>
<%@ page import="java.text.SimpleDateFormat" %>

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
    CommentsOperations commentsOperations = (CommentsOperations) BeansStore.getBean(CommentsOperations.class);
    String ID = request.getParameter("id");
    Long id = Long.parseLong(ID);
    Task currTask = taskOperations.findTask(id);
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String duodate = simpleDateFormat.format(currTask.getDueDate());

%>
<div class="nav-scroller bg-body shadow-sm">
    <nav class="nav nav-underline" aria-label="Secondary navigation">
        <a class="nav-link"
           href="deleteTask.jsp?id=<%=currTask.getID()%>">Delete Task</a>
        <a class="nav-link"
           href="updateTask.jsp?id=<%=currTask.getID()%>">Update Task</a>
        <%
            if (currUser.getID() == currTask.getAssignee().getID()) {
                if (currTask.getStatus() == Task.Status.OPENED) {
        %>
        <a class="nav-link" href="statusForAsignee.jsp?id=<%=currTask.getID()%>">In Progress
        </a>
        <%
        } else if (currTask.getStatus() == Task.Status.IN_PROGRESS) {

        %>
        <a class="nav-link" href="statusAIR.jsp?id=<%=currTask.getID()%>">AIR
        </a>
        <a class="nav-link" href="statusResolve.jsp?id=<%=currTask.getID()%>">Resolve
        </a>
        <%
        } else if (currTask.getStatus() == Task.Status.INFO_PROVIDED) {
        %>
        <a class="nav-link" href="statusForAsignee.jsp?id=<%=currTask.getID()%>">In progress
        </a>
        <%
        } else if (currTask.getStatus() == Task.Status.RE_OPENED) {
        %>
        <a class="nav-link" href="statusForAsignee.jsp?id=<%=currTask.getID()%>">In progress
        </a>
        <%
            }
        } else if (currUser.getID() == currTask.getReporter().getID()) {
            if (currTask.getStatus() == Task.Status.OPENED) {


        %><a class="nav-link" href="statusCancelled.jsp?id=<%=currTask.getID()%>">Cancelled
    </a>
        <%
        } else if (currTask.getStatus() == Task.Status.ADDITIONAL_INFO_REQUIRED) {


        %> <a class="nav-link" href="statusInfoProvided.jsp?id=<%=currTask.getID()%>">Info Provided
    </a>

        <%
        } else if (currTask.getStatus() == Task.Status.RESOLVE) {


        %> <a class="nav-link" href="statusReOpened.jsp?id=<%=currTask.getID()%>">Re Opened
    </a>
        <a class="nav-link" href="statusClosed.jsp?id=<%=currTask.getID()%>">Closed
        </a>
        <%
                }
            }
        %>
    </nav>
</div>
<form action="task.jsp" method="GET"></form>
<div class="container" style="margin-top: 3%">
    <div class="row" style="width:70%; margin: auto" >
        <div class="col">
            <ul class="list-group mb-3">
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">Task name</h6>
                        <small class="text-muted"> <%=currTask.getName()%></small>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">Task description</h6>
                        <small class="text-muted"> <%=currTask.getDescription()%></small>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">Task priority</h6>
                        <small class="text-muted"> <%=currTask.getPriority()%></small>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">Status</h6>
                        <small class="text-muted"><%=currTask.getStatus()%></small>
                    </div>
                </li>
                <% if(currTask.getStartData() != null) {
                    SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
                    String startDate = simpleDateFormat1.format(currTask.getStartData());
                %>
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">Start date</h6>
                        <small class="text-muted"><%=startDate%></small>
                    </div>
                </li>
                    <%}
                        else {
                    %>
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">Start date</h6>
                        <small class="text-muted">Not assigned </small>
                    </div>
                </li>
                    <%
                        }
                    %>
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">Due date</h6>
                        <small class="text-muted"><%=duodate%></small>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">Reporter</h6>
                        <small class="text-muted"><a href="user.jsp?id=<%=currTask.getReporter().getID()%>"><%=currTask.getReporter().getUserName()%>
                        </a></small>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">Assignee</h6>
                        <small class="text-muted"><a href="user.jsp?id=<%=currTask.getAssignee().getID()%>"><%=currTask.getAssignee().getUserName()%>
                        </a></small>
                    </div>
                </li>
            </ul>
        </div>
        <div class="col">
            <li class="list-group-item d-flex justify-content-between lh-sm">
                <div>
                    <h6 class="my-0">Comments</h6>
                    <small class="text-muted">    <%
                        if (currTask.getComments() != null) {
                            List<Comment> commentTask = commentsOperations.getSortComment(currTask.getComments());
                            for (Comment k : commentTask) {%>

                        <p><%=k.getCreateData()%> <%=k.getCreatorComment().getUserName()%>:
                            <%=k.getComment()%>
                        </p>
                        <%
                                }
                            }
                        %></small>
                </div>
            </li>

            <hr>
            <form action="commentTask.jsp?id=<%=currTask.getID()%>" method="post">
                <p><b>Your comment:</b></p>
                <p><textarea rows="5" cols="55"
                             name="comment"><%currUser.getUserName();%></textarea></p>
                <p><input type="submit" value="Отправить"></p>
            </form>
        </div>
    </div>
</div>

<%--<p>ID: <%=currTask.getID()%>--%>
<%--</p>--%>
<%--<p>Task name:  <%=currTask.getName()%>--%>
<%--</p>--%>
<%--<p>Description: <%=currTask.getDescription()%>--%>
<%--</p>--%>
<%--<p>Priority: <%=currTask.getPriority()%>--%>
<%--</p>--%>
<%--<p>Status: <%=currTask.getStatus()%>--%>
<%--</p>--%>
<%--<p>Start Date: <%=currTask.getStartData()%>--%>
<%--</p>--%>
<%--<p>Due Date: <%=currTask.getDueDate()%>--%>
<%--</p>--%>
<%--<p>Reporter: <a href="user.jsp?id=<%=currTask.getReporter().getID()%>"><%=currTask.getReporter().getUserName()%>--%>
<%--</a>--%>
<%--</p>--%>
<%--<p>Assignee: <a href="user.jsp?id=<%=currTask.getAssignee().getID()%>"><%=currTask.getAssignee().getUserName()%>--%>
<%--</a>--%>
<%--</p>--%>

<%--<hr>--%>
</body>
</html>
