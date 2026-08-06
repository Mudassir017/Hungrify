package com.hungrify.servlets;

import java.io.IOException;
import java.sql.Timestamp;

import com.hungrify.DAOImpl.AddressDAOImpl;
import com.hungrify.DAOImpl.OrderDAOImpl;
import com.hungrify.DAOImpl.OrderItemDAOImpl;
import com.hungrify.model.Address;
import com.hungrify.model.Cart;
import com.hungrify.model.CartItems;
import com.hungrify.model.Order;
import com.hungrify.model.OrderItem;
import com.hungrify.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		if (session == null || session.getAttribute("user") == null) {
			resp.sendRedirect("login.jsp");
			return;
		}

		User user = (User) session.getAttribute("user");

		AddressDAOImpl dao = new AddressDAOImpl();

		Address defaultAddress = dao.getDefaultAddress(user.getUserId());

		req.setAttribute("defaultAddress", defaultAddress);

		RequestDispatcher rd = req.getRequestDispatcher("checkout.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		Cart cart = (Cart) session.getAttribute("cart");
		User user = (User) session.getAttribute("user");
		Integer restaurantId = (Integer) session.getAttribute("restaurantId");

		double subTotal = cart.getTotalPrice();
		double deliveryFee = 30;
		double platformFee = 10;
		double gst = 11;
		double discount = 20;

		double grandTotal = subTotal + deliveryFee + platformFee + gst - discount;

		if (user != null) {

			if (cart != null && !cart.getItems().isEmpty()) {

				int userId = user.getUserId();
				String paymentMode = req.getParameter("paymentMode");
				String fullName = req.getParameter("fullName");
				String mobile = req.getParameter("mobile");
				String addressType = req.getParameter("addressType");
				String houseNo = req.getParameter("houseNo");
				String area = req.getParameter("area");
				String landmark = req.getParameter("landmark");
				String city = req.getParameter("city");
				String state = req.getParameter("state");
				String pincode = req.getParameter("pincode");
				boolean isDefault = req.getParameter("isDefault") != null;

				Address address = new Address(userId, fullName, mobile, addressType, houseNo, area, landmark, city,
						state, pincode, isDefault);

				AddressDAOImpl addressDAOImpl = new AddressDAOImpl();
				Address savedAddress = addressDAOImpl.addAddress(address);

				if (savedAddress == null) {
					resp.sendRedirect("checkout");
					return;
				}

				Order order = new Order(userId, restaurantId, new Timestamp(System.currentTimeMillis()), grandTotal,
						subTotal, deliveryFee, platformFee, gst, discount, "Pending", paymentMode);

				OrderDAOImpl orderDAOImpl = new OrderDAOImpl();
				Order savedOrder = orderDAOImpl.addOrder(order);

				if (savedOrder == null) {
					resp.sendRedirect("checkout");
					return;
				}

				int orderId = savedOrder.getOrderId();

				OrderItemDAOImpl orderItemDAOImpl = new OrderItemDAOImpl();
				for (CartItems cartItem : cart.getItems().values()) {
					int menuId = cartItem.getMenuId();
					int quantity = cartItem.getQuantity();
					double itemTotal = cartItem.getTotalPrice();

					OrderItem orderItem = new OrderItem(orderId, menuId, quantity, itemTotal);

					orderItemDAOImpl.addOrderItem(orderItem);
				}

				session.removeAttribute("cart");
				session.removeAttribute("restaurantId");
				session.removeAttribute("grandTotal");

				resp.sendRedirect("orderConfirmation?orderId=" + orderId);
			}

		} else {
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}

	}

}
