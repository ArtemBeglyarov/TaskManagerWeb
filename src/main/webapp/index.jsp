<%@ page import="com.taskmanager.entity.User" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <jsp:include page='header.jsp'/>
</head>


<body>


<div class="d-flex flex-column p-3 bg-dark"
     style="width: 300px;height: 300px; margin-top: 20px;
     border-radius: 24px; color: #dddddd">

    <p >ID: <%=currUser.getID()%></p>
    <p>User name:  <%=currUser.getUserName() %></p>
    <p>Fist name: <%=currUser.getFirstName()%></p>
    <p>Last name:  <%=currUser.getLastName() %></p>
    <p>Status:     <%=currUser.getStatus()%></p>
    <a class="btn btn-success"
       style="background-color:  #0B614B" href="updateUser.jsp"
       role="button">EDIT
    </a>

</div>
</body>
</html>