package com.hungrify.servlets;

import java.io.IOException;

import com.hungrify.DAOImpl.OrderDAOImpl;
import com.hungrify.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		if (session == null || session.getAttribute("user") == null) {

			resp.sendRedirect("login.jsp");
			return;
		}
		
		User user = (User) session.getAttribute("user");

		OrderDAOImpl orderDAO = new OrderDAOImpl();

		int totalOrders = orderDAO.getOrdersByUserId(user.getUserId()).size();

		req.setAttribute("totalOrders", totalOrders);

		RequestDispatcher rd = req.getRequestDispatcher("profile.jsp");

		rd.forward(req, resp);
	}
}
