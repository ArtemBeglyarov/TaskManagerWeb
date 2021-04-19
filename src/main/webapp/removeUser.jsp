<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<!DOCTYPE HTML>
<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
<form action="removeUser.jsp" method="GET">
	<p class="title" align=center>Enter the id of the user you want to delete:
	<p align=center>	<input type="text" name="id">
	<p class="title" align=center><input type="submit" value="Remove">
</form>

<%!
	UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
%>
<%
	String  ID = request.getParameter("id");
	if (ID != null){

		usersOperations.removeUserById(ID);
	}
%>

</body>
</html>