<%@ page import="com.taskmanager.operations.UsersOperations" %>
<%@ page import="com.taskmanager.BeansStore" %>
<%@ page import="javax.ws.rs.HttpMethod" %>
<%@ page import="com.taskmanager.entity.User" %>
<%@ page import="com.taskmanager.operations.ProjectOperations" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.taskmanager.operations.TaskOperations" %>
<%@ page import="com.taskmanager.entity.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    User currUser = (User) session.getAttribute("currUser");
    if (currUser == null) {
        response.sendRedirect("login.jsp");
    }
    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);
    TaskOperations taskOperations = (TaskOperations) BeansStore.getBean(TaskOperations.class);
    Task task = null;
    String param = request.getParameter("id");
    if (param != null && param != "") {
        Long id = Long.parseLong(param);
        task = taskOperations.findTask(id);
    } else {
        response.sendRedirect("tasks.jsp");
    }

%>
<html>
<jsp:include page='header.jsp'/>
<body>
<jsp:include page='navbar.jsp'/>
<main class="container">
    <div class="container-fluid">
        <h1 class="title" align=center>UPDATE TASK</h1>
        <form action="updateUser.jsp?id=<%=task.getID()%>" method="POST">
            <div class="mb-3 row form-floating">
                <input type="text" class="form-control" id="floatingTaskname" name="taskName" placeholder="TaskName" value="<%=task.getName()%>">
                <label for="floatingTaskname">TaskName</label>
            </div>
            <div class="mb-3 row form-floating">
                <input type="text" class="form-control" id="floatingFDescription" name="description" placeholder="Description" value="<%=task.getDescription()%>">
                <label for="floatingFDescription">Description</label>
            </div>
            <div class="mb-3 row form-floating">
                <select class="form-select" aria-label="Default select example" name="priority">
                    <option selected disabled>Select Priority</option>
                    <%
                        for(Task.Priority priority : Task.Priority.values()){
                    %>
                    <option value="<%=priority.name()%>"><%=priority.name()%></option>
                    <%}%>
                </select>
            </div>
            <div class="mb-3 row ">
                <select class="form-select" aria-label="Default select example" name="status" >
                    <option selected disabled >Select task </option>
                    <%
                        for(Task.Status status : Task.Status.values()){
                    %>
                    <option value="<%=status.name()%>>"><%=status.name()%></option>
                    <%}%>
                </select>
            </div>
            <div class="mb-3 row form-floating">
                <input type="date" class="form-control" id="floatingDueDate" name="dueDate" placeholder="<%=task.getDueDate()%>" >
                <label for="floatingDueDate">DueDate</label>
            </div>
            <div class="mb-3 row form-floating">
                <select class="form-select" aria-label="Default select example" name="users">
                    <option selected disabled>Select User</option>
                    <%
                        List<User> listUserss = usersOperations.findUsers();
                        for(User k : listUserss){
                    %>
                    <option value="<%=k.getID()%>"><%=k.getUserName()%></option>
                    <%}%>
                </select>
                <input type="text" class="form-control" id="floatingAssignee" name="dueDate" placeholder="DueDate" value="<%=task.getAssignee()%>">
                <label for="floatingAssignee">Assignee</label>
            </div>
            <div class="mb-3">
                <input class="btn btn-primary" type="submit" value="Update">
            </div>
        </form>
    </div>
</main>
    <% if (request.getMethod().equals(HttpMethod.POST)) {
    task.setName(request.getParameter("taskName"));
    task.setDescription(request.getParameter("description"));
    task.setPriority(Task.Priority.get(request.getParameter("priority")));
    task.setStatus(Task.Status.get(request.getParameter("status")));

    SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
    String assID = request.getParameter("users");
    Long idd = Long.parseLong(assID);
    task.setAssignee(usersOperations.findUser(idd));
     try {
            task.setDueDate(format1.parse(request.getParameter("dueDate")));
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    taskOperations.updateTask(task);
    response.sendRedirect("tasks.jsp");
}
%>
