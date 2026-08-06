package com.hungrify.servlets;

import java.io.IOException;

import com.hungrify.DAOImpl.UserDAOImpl;
import com.hungrify.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		if (session == null || session.getAttribute("user") == null) {
			resp.sendRedirect("login.jsp");
			return;
		}

		RequestDispatcher rd = req.getRequestDispatcher("edit-profile.jsp");

		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		if (session == null || session.getAttribute("user") == null) {
			resp.sendRedirect("login.jsp");
			return;
		}

		User user = (User) session.getAttribute("user");

		String userName = req.getParameter("userName");
		String address = req.getParameter("address");

		user.setUserName(userName);
		user.setAddress(address);

		UserDAOImpl dao = new UserDAOImpl();

		boolean updated = dao.updateUser(user);

		if (updated) {

			// Session me updated object save karo
			session.setAttribute("user", user);

			resp.sendRedirect("profile");

		} else {

			req.setAttribute("error", "Profile update failed.");

			RequestDispatcher rd = req.getRequestDispatcher("edit-profile.jsp");

			rd.forward(req, resp);
		}
	}
}
