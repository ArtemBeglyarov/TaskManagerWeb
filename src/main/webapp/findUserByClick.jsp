<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page='header.jsp'/>
</head>
<body>
<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<%
    String ID = request.getParameter("id");
        Long id = Long.parseLong(ID);
        User currUser = usersOperations.findUser(id);


%>

<div class="d-flex flex-column p-3 bg-dark"
     style="width: 300px;height: 250px;;
     margin-top: 20px;
     border-radius: 24px; color: #dddddd">

    <p >ID: <%=currUser.getID()%></p>
    <p>User name:  <%=currUser.getUserName()%></p>
    <p>Fist name: <%=currUser.getFirstName()%></p>
    <p>Last name:  <%=currUser.getLastName() %></p>
    <p>Status:     <%=currUser.getStatus()%></p>
</div>
</body>
</html>
