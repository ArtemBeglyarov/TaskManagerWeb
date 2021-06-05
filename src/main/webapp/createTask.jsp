<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 30.04.2021
  Time: 0:50
  To change this template use File | Settings | File Templates.
--%>
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

    SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-DD");


    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
    TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(TaskOperations.class);
    ProjectOperations projectOperations = (ProjectOperations) BeansStore.getBean(ProjectOperations.class);



    if (request.getMethod().equals(HttpMethod.POST)) {
        Task task = new Task();

        task.setName(request.getParameter("name"));
        task.setPriority(Task.Priority.get(request.getParameter("priority")));
        task.setStatus(Task.Status.OPENED);
        task.setDescription(request.getParameter("description")); //
        task.setCreateDate(new Date());
        try {
            task.setDueDate(format.parse(request.getParameter("dueDate")));
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        String ID = request.getParameter("projectId");

        Long id = Long.parseLong(ID);
        task.setProject(projectOperations.findProject(id));

        //String assID = request.getParameter("Users");
        //Long idd = Long.parseLong(assID);
        //task.setAssignee(usersOperations.findUser(idd));

        task.setReporter(currUser);

        taskOperations.createTask(task);
        response.sendRedirect("tasks.jsp");
    }
%>

