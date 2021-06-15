<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }

    TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(TaskOperations.class);
    String checkID =request.getParameter("IDs");
    ObjectMapper mapper = new ObjectMapper();
    Long[] listID = mapper.readValue(checkID,Long[].class);
    for (Long k:listID){
        taskOperations.removeTaskById(k);
    }
    response.sendRedirect("tasks.jsp");
%>
