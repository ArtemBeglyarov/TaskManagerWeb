<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
    ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(ProjectOperations.class);
    String checkID =request.getParameter("IDs");
    ObjectMapper mapper = new ObjectMapper();
    Long[] listID = mapper.readValue(checkID,Long[].class);
    for (Long k:listID){
        projectOperations.deleteProjByID(k);
    }
    response.sendRedirect("projects.jsp");
%>