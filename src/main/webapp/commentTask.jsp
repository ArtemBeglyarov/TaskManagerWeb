<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.operations.CommentsOperations" %>
<%@ page import="com.taskmanager.entity.Comment" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.taskmanager.entity.Comment" %>
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

%>
<form action="task.jsp?id=" method="post">
    <p><b>Your comment:</b></p>
    <p><textarea rows="10" cols="45"
                 name="comment"><%currUser.getUserName();%></textarea></p>
    <p><input type="submit" value="Отправить"></p>
</form>
<hr>
<%!
    CommentsOperations co = (CommentsOperations) BeansStore.getBean(CommentsOperations.class);
%>
<%
    Date format = new Date(Calendar.getInstance().getTimeInMillis());

    if (request.getMethod().equals(HttpMethod.POST)){
        Comment comment = new Comment();
    comment.setCreatorComment(currUser);
    comment.setCreateData(format);
    comment.setComment(request.getParameter("comment"));
    co.create(comment);

  List<Comment> allComments = co.getAllComments();
    for (Comment k : allComments) {%>

<p><%=k.getCreateData()%> <%=k.getCreatorComment().getUserName()%>:
    <%=k.getComment()%></p>
<%} }%>





</body>
</html>
