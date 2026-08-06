package com.hungrify.servlets;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.hungrify.DAOImpl.UserDAOImpl;
import com.hungrify.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    String email = req.getParameter("email");
	    String password = req.getParameter("password");

	    HttpSession session = req.getSession();

	    UserDAOImpl userDAOImpl = new UserDAOImpl();
	    User user = userDAOImpl.getUserByEmail(email);


	    // Ab password verify karo
	    if (user != null && BCrypt.checkpw(password, user.getPassword())) {

	        session.setAttribute("user", user);
	        resp.sendRedirect("restaurant");

	    } else {

	        req.setAttribute("error", "Invalid email or password.");

	        RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
	        rd.forward(req, resp);
	    }
	}
}
