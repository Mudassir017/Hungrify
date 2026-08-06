<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.hungrify.model.Order"%>

<%@ page import="com.hungrify.model.User" %>

<%
User user = (User) session.getAttribute("user");

List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order History</title>
<link rel="stylesheet" href="css/hungrify-base.css">
<link rel="stylesheet" href="css/my-orders.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%@ include file="common/navbar.jsp"%>

	<div class="container">

		<h1>My Orders</h1>

		<%
if (orders != null && !orders.isEmpty()) {

    for(Order order : orders){
%>

		<div class="order-card">

			<div class="order-top">

				<div>

					<h3><%=order.getRestaurantName()%></h3>

					<p>
						Order #<%=order.getOrderId()%>
					</p>

				</div>

				<span class="status"> <%=order.getStatus()%>
				</span>

			</div>


			<div class="order-middle">

				<div class="order-info">

					<span>Date</span> <strong> <%=order.getOrderDate()%>
					</strong>

				</div>

				<div class="order-info">

					<span>Payment</span> <strong> <%=order.getPaymentMethod()%>
					</strong>

				</div>

				<div class="order-info">

					<span>Total</span> <strong> ₹<%=order.getTotalAmount()%>

					</strong>

				</div>

			</div>


			<div class="order-bottom">

				<a href="orderConfirmation?orderId=<%=order.getOrderId()%>"
					class="btn btn-primary""> View Details → </a>

			</div>

		</div>

		<%
    }

}else{
%>

		<div class="empty-orders">

			<h2>No Orders Yet</h2>

			<p>You haven't placed any orders yet.</p>

			<a href="restaurant" class="btn btn-primary"> Browse Restaurants

			</a>

		</div>

		<%
}
%>

	</div>
</body>
</html>