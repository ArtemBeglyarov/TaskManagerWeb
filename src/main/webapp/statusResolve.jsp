<%@ page import="com.taskmanager.entity.Task" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="javax.ws.rs.HttpMethod" %> %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.sql.Array" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.taskmanager.entity.Project" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
    TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(TaskOperations.class);
    Task task = null;
    String param = request.getParameter("id");
    Long id = Long.parseLong(param);
    task = taskOperations.findTask(id);
    task.setStatus(Task.Status.RESOLVE);
    task.setEndDate(new Date());
    taskOperations.updateTask(task);
    response.sendRedirect("task.jsp?id="+id);

%>
