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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String confirmPassword = req.getParameter("confirmPassword");
		String address = req.getParameter("address");
		String role = req.getParameter("role");

		if (!password.equals(confirmPassword)) {

			req.setAttribute("error", "Password and Confirm Password do not match.");

			RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
			rd.forward(req, resp);

			return;
		}

		UserDAOImpl userDAOImpl = new UserDAOImpl();

		if (userDAOImpl.getUserByEmail(email) != null) {

			req.setAttribute("error", "Email is already registered.");

			RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
			rd.forward(req, resp);

			return;
		}

		String hashpw = BCrypt.hashpw(password, BCrypt.gensalt(8));

		User user = new User(name, email, hashpw, address, role);

		int rowsAffected = userDAOImpl.addUser(user);

		if (rowsAffected == 1) {
		    resp.sendRedirect("login.jsp");
		} else {
		    req.setAttribute("error", "Registration failed. Please try again.");
		    RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
		    rd.forward(req, resp);
		}
		
		if (name == null || name.trim().isEmpty() ||
			    email == null || email.trim().isEmpty() ||
			    password == null || password.trim().isEmpty() ||
			    confirmPassword == null || confirmPassword.trim().isEmpty() ||
			    role == null || role.trim().isEmpty()) {

			    req.setAttribute("error", "Please fill all required fields.");

			    RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
			    rd.forward(req, resp);

			    return;
			}
		
	}

}
