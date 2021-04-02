<%@ page import="com.taskmanager.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<!DOCTYPE HTML>
<html>

<head>

	<meta charset="utf-8">
	<link rel="stylesheet" href="css/style.css" type="text/css" />
	<title>Remove User</title>
	<style>
		body{
			background: url(images/pap.jpg);
		}
	</style>
</head>
<body>
<h1 class="title" align=center>DELETE USER</h1>
<form action="removeUser.jsp" method="DELETE">
	<p class="title" align=center>Enter the id of the user you want to delete:
	<p align=center>	<input type="text" name="id">
	<p class="title" align=center><input type="submit" value="Remove">
</form>

<%!
	UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<%
	if (request.getMethod().equals(HttpMethod.DELETE)){
		String  ID = request.getParameter("id");
		usersOperations.removeUserById(ID);
	}
%>

</body>
</html>