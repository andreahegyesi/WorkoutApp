package com.controller;

import com.model.User;
import com.repository.JpaUserRepository;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.security.InvalidParameterException;

@WebServlet(urlPatterns = "/login")
public class LoginController extends HttpServlet {


    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("showMyWorkouts.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        try {
            JpaUserRepository userRepo = new JpaUserRepository();
            User user = userRepo.checkIfExists(email, password);
            session.setAttribute("user", user.getEmail());
            session.setAttribute("user_id", user.getId());
            response.sendRedirect("showMyWorkouts.jsp");
        } catch (InvalidParameterException e) {
            session.setAttribute("status", "failed");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}