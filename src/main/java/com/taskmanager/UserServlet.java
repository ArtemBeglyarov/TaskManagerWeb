package com.taskmanager;

import com.taskmanager.entity.User;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    @EJB
    userService javaBean;



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String firstName = req.getParameter("firstName");
    String secondName = req.getParameter("secondName");
    String userName = req.getParameter("userName");
    String password = req.getParameter("password");
    User user = new User(firstName,secondName,userName,password);
    javaBean.saveUser(user);
    resp.getWriter().println("страница такс менеджера");
    }
}
