package com.hungrify.servlets;

import java.io.IOException;
import java.util.List;

import com.hungrify.DAOImpl.OrderDAOImpl;
import com.hungrify.model.Order;
import com.hungrify.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/myOrders")
public class OrderHistoryServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    HttpSession session = req.getSession(false);

	    if (session == null) {
	        resp.sendRedirect("login.jsp");
	        return;
	    }

	    User user = (User) session.getAttribute("user");

	    if (user == null) {
	        resp.sendRedirect("login.jsp");
	        return;
	    }

	    int userId = user.getUserId();

	    OrderDAOImpl orderDAOImpl = new OrderDAOImpl();

	    List<Order> orders = orderDAOImpl.getOrdersByUserId(userId);

	    req.setAttribute("orders", orders);

	    RequestDispatcher rd = req.getRequestDispatcher("my-orders.jsp");
	    rd.forward(req, resp);
	}
	
}
