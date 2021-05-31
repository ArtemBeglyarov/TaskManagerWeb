<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.operations.CommentsOperations" %>
<%@ page import="com.taskmanager.entity.Comments" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
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
<form action="commentTask.jsp" method="post">
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
        Comments comments = new Comments();
    comments.setCreatorComment(currUser);
    comments.setCreateData(format);
    comments.setComment(request.getParameter("comment"));
    co.create(comments);

  List<Comments> allComments = co.getAllComments();
    for (Comments k : allComments) {%>

<p><%=k.getCreateData()%> <%=k.getCreatorComment().getUserName()%>:
    <%=k.getComment()%></p>
<%} }%>





</body>
</html>
