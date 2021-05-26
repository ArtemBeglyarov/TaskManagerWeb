<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
    User user = null;
    String param = request.getParameter("id");
    if (param != null && param != "") {
        Long id = Long.parseLong(param);
        user = usersOperations.findUser(id);
    } else {
        user = currUser;
    }
%>
<!DOCTYPE html>
<html lang="ru">
<jsp:include page='header.jsp'/>
<body>
<jsp:include page='navbar.jsp'/>
<div class="d-flex flex-column p-3 bg-dark"
     style="width: 300px;height: 300px; margin-top: 20px;
     border-radius: 24px; color: #dddddd">

    <p >ID: <%=user.getID()%></p>
    <p>User name:  <%=user.getUserName() %></p>
    <p>Fist name: <%=user.getFirstName()%></p>
    <p>Last name:  <%=user.getLastName() %></p>
    <p>Status:     <%=user.getStatus()%></p>
    <a class="btn btn-success"
       style="background-color:  #0B614B" href="updateUser.jsp?id=<%=user.getID()%>"
       role="button">EDIT
    </a>

</div>
</body>
</html>