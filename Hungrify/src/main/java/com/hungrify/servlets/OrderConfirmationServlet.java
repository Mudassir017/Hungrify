package com.hungrify.servlets;

import java.io.IOException;
import java.util.List;

import com.hungrify.DAOImpl.AddressDAOImpl;
import com.hungrify.DAOImpl.MenuDAOImpl;
import com.hungrify.DAOImpl.OrderDAOImpl;
import com.hungrify.DAOImpl.OrderItemDAOImpl;
import com.hungrify.model.Address;
import com.hungrify.model.Menu;
import com.hungrify.model.Order;
import com.hungrify.model.OrderItem;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderConfirmation")
public class OrderConfirmationServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		int orderId = Integer.parseInt(req.getParameter("orderId"));
		OrderDAOImpl dao = new OrderDAOImpl();
		Order order = dao.getOrderById(orderId);

		AddressDAOImpl addressDAOImpl = new AddressDAOImpl();

		Address address = addressDAOImpl.getDefaultAddress(order.getUserId());
		req.setAttribute("address", address);

		OrderItemDAOImpl orderItemDAOImpl = new OrderItemDAOImpl();
		List<OrderItem> items = orderItemDAOImpl.getOrderItemsByOrderId(orderId);

		MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
		List<Menu> recommendedMenus = menuDAOImpl.getRecommendedMenus(order.getRestaurantId());

		req.setAttribute("recommendedMenus", recommendedMenus);
		req.setAttribute("order", order);
		req.setAttribute("items", items);

		RequestDispatcher rd = req.getRequestDispatcher("order-confirmation.jsp");
		rd.forward(req, resp);

	}
}
