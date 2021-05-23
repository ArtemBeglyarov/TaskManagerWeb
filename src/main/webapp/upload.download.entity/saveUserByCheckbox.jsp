<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

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

    String fileName = "user.json";

    response.setContentType("application/octet-stream");
    response.setHeader("Content-Disposition","attachment;filename=\"" + fileName + "\"");


    mapper.writeValue(response.getWriter(),usersByCheck);
    response.getOutputStream().flush();
    response.getOutputStream().close();

%>
