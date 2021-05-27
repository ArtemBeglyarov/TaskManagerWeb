package com.taskmanager.exchange;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.taskmanager.BeansStore;
import com.taskmanager.entity.User;
import com.taskmanager.operations.UsersOperations;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@WebServlet("/Upload")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB
        maxFileSize=1024*1024*50,      	// 50 MB
        maxRequestSize=1024*1024*100)
public class Upload extends HttpServlet {

    UsersOperations usersOperations = (UsersOperations) BeansStore.getBean(UsersOperations.class);

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String contentType = req.getContentType();
        if ((contentType != null) && contentType.startsWith("multipart/form-data")) {

            Part part = req.getPart("filename");

            ObjectMapper om = new ObjectMapper();
            InputStream inputStream = part.getInputStream();
            List<User> uploadUsers = om.readValue(inputStream, List.class);
            for (User k : uploadUsers) {
                System.out.println(k.toString());
            }
        }
    }
}
