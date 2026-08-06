<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page
	import="com.hungrify.model.Address, com.hungrify.model.OrderItem"%>

<%@ page import="java.util.List,com.hungrify.model.Menu"%>


<%@ page import="com.hungrify.model.Cart"%>
<%@ page import="com.hungrify.model.CartItems"%>
<%@ page import="java.util.Map"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Order Confirmation | Hungrify</title>

<link rel="stylesheet" href="css/order-confirmation.css">

<link rel="preconnect" href="https://fonts.googleapis.com">

<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:wght@500;600;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>

<body>

	<%@ page import="com.hungrify.model.Order"%>
	<%@ page import="java.util.List"%>
	<%@ page import="com.hungrify.model.OrderItem"%>
	<%@ page import="com.hungrify.model.Address"%>

	<%
	Order order = (Order) request.getAttribute("order");

	List<OrderItem> items = (List<OrderItem>) request.getAttribute("items");

	Address address = (Address) request.getAttribute("address");
	%>

	<!-- ==========================================
                HEADER
=========================================== -->

	<header class="header">

		<div class="container header__container">

			<a href="#home" class="logo" aria-label="Hungrify Home">
              <img
                src="images/logo/hungrify-logo-icon.png"
                alt="Hungrify logo"
                height="40"
                width="40"
              />
              <span class="brand-name">
    				<span class="brand-dark">Hungr</span><span class="brand-orange">ify</span>
  			</span>
            </a>

			<form action="restaurant" method="get">

				<button type="submit" class="btn btn--secondary">

					<i class="fa-solid fa-house"></i> Back to Home

				</button>

			</form>

		</div>

	</header>

	<!-- ==========================================
            SUCCESS HERO
=========================================== -->

	<section class="success-hero">

		<div class="container">

			<div class="success-card">

				<div class="success-icon">

					<i class="fa-solid fa-circle-check"></i>

				</div>

				<h1>Order Confirmed!</h1>

				<p class="success-text">Thank you for choosing Hungrify.</p>

				<p class="success-subtitle">Your delicious meal is being
					prepared and will be delivered soon.</p>

			</div>

		</div>

	</section>

	<!-- ==========================================
            MAIN CONTENT
=========================================== -->

	<main class="confirmation">

		<div class="container">

			<div class="confirmation-layout">

				<!-- ==========================================
                        LEFT SIDE
            =========================================== -->

				<section class="confirmation-left">

					<!-- ==========================================
                        ORDER INFORMATION
                =========================================== -->

					<section class="card">

						<div class="card__header">
							<h2>Order Information</h2>
						</div>

						<div class="info-grid">

							<div class="info-item">
								<span class="label">Order ID</span> <span class="value">#<%=order.getOrderId()%></span>
							</div>

							<div class="info-item">
								<span class="label">Order Date</span> <span class="value"><%=order.getOrderDate()%></span>
							</div>

							<div class="info-item">
								<span class="label">Payment Method</span> <span class="value"><%=order.getPaymentMethod()%></span>
							</div>

							<div class="info-item">
								<span class="label">Order Status</span> <span
									class="status success"><%=order.getStatus()%></span>
							</div>

							<div class="info-item">
								<span class="label">Estimated Delivery</span> <span
									class="value">30 - 40 Minutes</span>
							</div>

							<div class="info-item address">

								<span class="label">Delivery Address</span>

								<%
                            if(address != null){
                            %>

								<h4><%=address.getFullName()%></h4>

								<p><%=address.getPhone()%></p>

								<p>
									<%=address.getHouseNo()%>,
									<%=address.getArea()%>
								</p>

								<p><%=address.getLandmark()%></p>

								<p>
									<%=address.getCity()%>,
									<%=address.getState()%>
									-
									<%=address.getPincode()%>
								</p>

								<%
                            }else{
                            %>

								<p>No delivery address found.</p>

								<%
                            }
                            %>

							</div>

						</div>

					</section>


					<!-- ==========================================
            ORDER ITEMS
=========================================== -->

					<!-- ==========================================
            ORDER ITEMS
=========================================== -->

					<section class="card">

						<div class="card__header">
							<h2>Ordered Items</h2>
						</div>

						<div class="ordered-items">

							<%
        for (OrderItem item : items) {
        %>

							<article class="order-item">

								<div class="order-item__image">
									<img src="<%=item.getImageUrl()%>"
										alt="<%=item.getItemName()%>">
								</div>

								<div class="order-item__content">
									<h3><%=item.getItemName()%></h3>
									<p><%=order.getRestaurantName()%></p>
								</div>

								<div class="order-item__meta">
									<span>Qty: <%=item.getQuantity()%></span> <strong>₹<%=item.getItemTotal()%></strong>
								</div>

							</article>

							<%
        }
        %>

						</div>

					</section>


					<!-- ==========================================
        DELIVERY TIMELINE
=========================================== -->

					<section class="card">

						<div class="card__header">
							<h2>Delivery Status</h2>
						</div>

						<div class="timeline">

							<div class="timeline__item active">

								<div class="timeline__icon">
									<i class="fa-solid fa-check"></i>
								</div>

								<div>
									<h4>Order Confirmed</h4>
									<p>Your order has been successfully placed.</p>
								</div>

							</div>

							<div class="timeline__item">
								<div class="timeline__icon"></div>
								<div>
									<h4>Preparing Food</h4>
								</div>
							</div>

							<div class="timeline__item">
								<div class="timeline__icon"></div>
								<div>
									<h4>Out for Delivery</h4>
								</div>
							</div>

							<div class="timeline__item">
								<div class="timeline__icon"></div>
								<div>
									<h4>Delivered</h4>
								</div>
							</div>

						</div>

					</section>


					<!-- ==========================================
        DELIVERY PARTNER
=========================================== -->

					<section class="card">

						<div class="card__header">
							<h2>Delivery Partner</h2>
						</div>

						<div class="partner">

							<div class="partner__image">Photo</div>

							<div class="partner__details">

								<h3>DELIVERY_PARTNER_NAME</h3>

								<p>Vehicle : BIKE_NUMBER</p>

								<p>Contact : +91 XXXXXXXXXX</p>

							</div>

						</div>

					</section>

					<!-- LEFT COLUMN END -->
				</section>


				<!-- ==========================================
            RIGHT SIDEBAR
=========================================== -->

				<%
double df = order.getDeliveryFee();
double pf = order.getPlatformFee();
double gst = order.getGst();
double discount = order.getDiscount();
double subTotal = order.getSubTotal();
%>

				<!-- ==========================================
            RIGHT SIDEBAR
=========================================== -->

				<aside class="confirmation-right">

					<section class="card sticky">

						<h2>Payment Summary</h2>

						<div class="summary">

							<div>
								<span>Subtotal</span> <strong>₹<%=subTotal%></strong>
							</div>

							<div>
								<span>Delivery Fee</span> <strong>₹<%=df%></strong>
							</div>

							<div>
								<span>Platform Fee</span> <strong>₹<%=pf%></strong>
							</div>

							<div>
								<span>GST</span> <strong>₹<%=gst%></strong>
							</div>

							<div>
								<span>Discount</span> <strong>-₹<%=discount%></strong>
							</div>

							<hr>

							<div class="grand-total">
								<span>Grand Total</span> <strong>₹<%=order.getTotalAmount()%></strong>
							</div>

						</div>

						<div class="action-buttons">

							<form action="trackOrder" method="get">
								<input type="hidden" name="orderId"
									value="<%=order.getOrderId()%>">
								<button type="submit" class="btn btn--primary">Track
									Order</button>
							</form>

							<form action="downloadInvoice" method="get">
								<input type="hidden" name="orderId"
									value="<%=order.getOrderId()%>">
								<button type="submit" class="btn btn--secondary">
									Download Invoice</button>
							</form>

							<form action="restaurant" method="get">
								<button type="submit" class="btn btn--outline">
									Continue Shopping</button>
							</form>

						</div>

					</section>

				</aside>

			</div>
			<!-- confirmation-layout -->
			<!-- container -->


			<!-- ==========================================
        RECOMMENDATIONS
=========================================== -->

			<section class="recommendations">

				<div class="section-header">
					<h2>You May Also Like</h2>
				</div>

				<%
List<Menu> recommendedMenus =
(List<Menu>) request.getAttribute("recommendedMenus");
%>

				<div class="recommendation-grid">

					<%
if(recommendedMenus != null){

    for(Menu menu : recommendedMenus){
%>

					<div class="food-card">

						<img src="<%= menu.getImageUrl() %>"
							alt="<%= menu.getItemName() %>">

						<div class="food-info">

							<h3 class="fi"><%= menu.getItemName() %></h3>

							<p class="fi"><%= order.getRestaurantName() %></p>

							<h4 class="fi">
								₹<%= menu.getPrice() %></h4>

							<form action="cart" method="post">

								<input type="hidden" name="menuId"
									value="<%= menu.getMenuId() %>"> <input type="hidden"
									name="restaurantId" value="<%= menu.getRestaurantId() %>">

								<button type="submit" class="btn btn--primary">Add to
									Cart</button>

							</form>

						</div>

					</div>

					<%
    }
}
%>

				</div>

			</section>

		</div>

	</main>

	<!-- ==========================================
            FOOTER
=========================================== -->

	<footer class="footer">

		<div class="container">

			<p>© 2026 Hungrify. Fresh Food, Fast Delivery.</p>

		</div>

	</footer>

</body>

</html>