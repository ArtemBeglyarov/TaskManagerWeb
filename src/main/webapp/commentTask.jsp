<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.operations.CommentsOperations" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.Comment" %>
<%@ page import="java.util.*" %>
<%@ page import="com.taskmanager.entity.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>comment</title>
</head>
<body>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
    CommentsOperations commentsOperations = (CommentsOperations) BeansStore.getBean(CommentsOperations.class);
    TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(TaskOperations.class);

    String getIdTask = request.getParameter("id");
    Long idCurrTask = Long.parseLong(getIdTask);
    if (request.getMethod().equals(HttpMethod.POST)) {
        Date format = new Date(Calendar.getInstance().getTimeInMillis());
        Task   currTask = taskOperations.findTask(idCurrTask);
        Comment comment = new Comment();
        comment.setCreatorComment(currUser);
        comment.setCreateData(format);
        comment.setComment(request.getParameter("comment"));
        comment.setTask(currTask);
        currTask.addComment(comment);
        taskOperations.updateTask(currTask);
        commentsOperations.create(comment);

        response.sendRedirect("task.jsp?id="+getIdTask);
    }
%>
</body>
</html>
