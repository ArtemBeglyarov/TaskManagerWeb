<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
<%@ page import="com.taskmanager.repository.Repository" %>
<%@ page import="javax.imageio.IIOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>

<%!
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);

%>
<%
    String IDchek =request.getParameter("ID");

    ObjectMapper mapper = new ObjectMapper();
    Long[] listID = mapper.readValue(IDchek,Long[].class);
    List<User> usersByCheck = new ArrayList<>();
    for (Long k:listID){
        usersByCheck.add(usersOperations.findUser(k));
    }
    for (User k : usersByCheck) {
        System.out.println(k.toString());
    }
    mapper.writeValue(new File("users.json"), usersByCheck);
%>
</body>
</html>
