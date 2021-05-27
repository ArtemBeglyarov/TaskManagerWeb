<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.operations.CommentsOperations" %>
<%@ page import="com.taskmanager.entity.Comments" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
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
    <p><b>Введите ваш отзыв:</b></p>
    <p><textarea rows="10" cols="45" name="text"></textarea></p>
    <p><input type="submit" value="Отправить"></p>
</form>

<%!
    CommentsOperations co = (CommentsOperations) BeansStore.getBean(CommentsOperations.class);
%>
<%
    Date format1 = new Date(Calendar.getInstance().getTimeInMillis());
    Comments comments = new Comments();
    comments.setCreatorComment(currUser);
    comments.setCreateData(format1);
//    comments.setComment();
//    comments.setTaskComment();
%>
</body>
</html>
