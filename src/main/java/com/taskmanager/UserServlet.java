package com.taskmanager;

import com.taskmanager.entity.User;
import com.taskmanager.repository.UserRepository;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
    @EJB
    JavaBeanUser javaBean;
    @Inject
    UserRepository userRepository;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            userRepository.createUser();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        resp.getWriter().println("Hello from servlet+++");

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
