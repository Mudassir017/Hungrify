<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hungrify.model.Cart"%>
<%@ page import="com.hungrify.model.CartItems"%>
<%@ page import="java.util.Map"%>

<%@ page import="com.hungrify.model.Address"%>

<%
Address defaultAddress =
(Address) request.getAttribute("defaultAddress");

String addressType = "";

if(defaultAddress != null){
    addressType = defaultAddress.getAddressType();
}



User user = (User)session.getAttribute("user");
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Checkout - Hungrify</title>

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@400;500;600;700&display=swap"
	rel="stylesheet" />

<!-- Stylesheets -->
<link rel="stylesheet" href="css/hungrify-base.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/checkout.css" />

<!-- Theme Initializer -->
<script>
      (function () {
        var saved = localStorage.getItem("theme");
        var dark =
          saved === "dark" ||
          (!saved && window.matchMedia("(prefers-color-scheme: dark)").matches);
        if (dark) {
          document.documentElement.classList.add("dark-theme");
          document.documentElement.setAttribute("data-theme", "dark");
        }
      })();
    </script>
</head>
<body>

	<%@ include file="common/short-nav.jsp"%>

	<main class="container" style="padding-top: 50px;">

		<%
      Cart cart = (Cart) session.getAttribute("cart");

		double itemTotal = 0;
		
		Double df = (Double) session.getAttribute("df");
		Double pf = (Double) session.getAttribute("pf");
		Double gst = (Double) session.getAttribute("gst");
		Double discount = (Double) session.getAttribute("discount");

		if(df == null) df = 30.0;
		if(pf == null) pf = 10.0;
		if(gst == null) gst = 11.0;
		if(discount == null) discount = 20.0;

		session.setAttribute("df", df);
		session.setAttribute("pf", pf);
		session.setAttribute("gst", gst);
		session.setAttribute("discount", discount);
		
      %>

		<form action="checkout" method="post">
			<div class="checkout-layout">

				<!-- Left Column: Checkout Details -->
				<div class="checkout-details">


					<!-- 					3. Delivery Information -->
					<section class="card-surface">

						<h2 class="section-title">
							<svg width="24" height="24" fill="none" stroke="currentColor"
								stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round"
									d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
        </svg>
							Personal Details
						</h2>

						<div class="form-group">
							<label for="fullName">Full Name <span class="required">*</span></label>
							<input type="text" id="fullName" name="fullName"
								value="<%= defaultAddress != null ? defaultAddress.getFullName() : "" %>"
								class="form-input" placeholder="Enter your full name" required>
						</div>

						<div class="form-group">
							<label for="mobile">Mobile Number <span class="required">*</span></label>
							<input type="tel" id="mobile" name="mobile" class="form-input"
								value="<%= defaultAddress != null ? defaultAddress.getPhone() : "" %>"
								placeholder="Enter mobile number" maxlength="10" required>
						</div>

						<div class="form-group">
							<label for="email">Email Address</label> <input type="email"
								id="email" name="email" class="form-input"
								value="<%= defaultAddress != null ? user.getEmail() : "" %>"
								placeholder="Enter email address (optional)">
						</div>

						<div class="form-group">
							<label for="deliveryInstructions"> Delivery Instructions
								<span class="optional">(Optional)</span>
							</label>

							<textarea id="deliveryInstructions" name="deliveryInstructions"
								class="form-input" rows="3"
								placeholder="Example: Leave at the door, don't ring the bell, call on arrival..."></textarea>
						</div>

					</section>

					<!-- 6. Payment Method Section -->
					<section class="card-surface">

						<h2 class="section-title">
							<svg width="24" height="24" fill="none" stroke="currentColor"
								stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round"
									d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.242-4.243a8 8 0 1111.314 0z" />
            <path stroke-linecap="round" stroke-linejoin="round"
									d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
        </svg>

							Delivery Address
						</h2>

						<div class="form-group">
							<label>Address Type</label> <select name="addressType"
								class="form-input" required>

								<option value="">Select Address Type</option>

								<option value="HOME"
									<%= "HOME".equals(addressType) ? "selected" : "" %>>
									Home</option>

								<option value="WORK"
									<%= "WORK".equals(addressType) ? "selected" : "" %>>
									Work</option>

								<option value="OTHER"
									<%= "OTHER".equals(addressType) ? "selected" : "" %>>
									Other</option>

							</select>
						</div>

						<div class="form-group">
							<label>House / Flat No.</label> <input type="text" name="houseNo"
								class="form-input" value="<%= defaultAddress != null ? defaultAddress.getHouseNo() : "" %>" placeholder="e.g. Flat 204, Block A" required>
						</div>

						<div class="form-group">
							<label>Area</label> <input type="text" name="area"
								class="form-input" value="<%= defaultAddress != null ? defaultAddress.getArea() : "" %>" placeholder="e.g. Indiranagar" required>
						</div>

						<div class="form-group">
							<label>Landmark</label> <input type="text" name="landmark"
								class="form-input" value="<%= defaultAddress != null ? defaultAddress.getLandmark() : "" %>" placeholder="e.g. Near Metro Station">
						</div>

						<div class="form-group">
							<label>City</label> <input type="text" name="city"
								class="form-input" value="<%= defaultAddress != null ? defaultAddress.getCity() : "" %>" placeholder="e.g. Bengaluru" required>
						</div>

						<div class="form-group">
							<label>State</label> <input type="text" name="state"
								class="form-input" value="<%= defaultAddress != null ? defaultAddress.getState() : "" %>" placeholder="e.g. Karnataka" required>
						</div>

						<div class="form-group">
							<label>Pincode</label> <input type="text" name="pincode"
								maxlength="6" class="form-input"value="<%= defaultAddress != null ? defaultAddress.getPincode() : "" %>" placeholder="e.g. 560001"
								required>
						</div>

						<div class="form-group">
							<label> <input type="checkbox" name="isDefault">

								Make this my default address
							</label>
						</div>


					</section>

					<section class="card-surface">
						<h2 class="section-title">
							<svg width="24" height="24" fill="none" stroke="currentColor"
								stroke-width="2" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round"
									d="M3 10h18M7 15h1m4 0h1m-7 4h12a3 3 0 003-3V8a3 3 0 00-3-3H6a3 3 0 00-3 3v8a3 3 0 003 3z"></path>
              </svg>
							Payment Method
						</h2>

						<div class="payment-grid">

							<input type="radio" id="cod" name="paymentMode" value="COD"
								checked> <label for="cod" class="payment-card">
								<div class="payment-icon">💵</div>
								<div class="payment-name">Cash on Delivery</div>
							</label> <input type="radio" id="upi" name="paymentMode" value="UPI">
							<label for="upi" class="payment-card">
								<div class="payment-icon">📱</div>
								<div class="payment-name">UPI</div>
							</label> <input type="radio" id="card" name="paymentMode" value="CARD">
							<label for="card" class="payment-card">
								<div class="payment-icon">💳</div>
								<div class="payment-name">Credit / Debit Card</div>
							</label> <input type="radio" id="netbanking" name="paymentMode"
								value="NET_BANKING"> <label for="netbanking"
								class="payment-card">
								<div class="payment-icon">🏦</div>
								<div class="payment-name">Net Banking</div>
							</label> <input type="radio" id="wallet" name="paymentMode"
								value="WALLET"> <label for="wallet" class="payment-card">
								<div class="payment-icon">👛</div>
								<div class="payment-name">Wallet</div>
							</label>

						</div>
					</section>

				</div>

				<!-- Right Column: Order Summary & Bill -->
				<aside class="order-summary-sidebar">

					<!-- 4. Order Summary -->
					<div class="card-surface">
						<h2 class="section-title" style="margin-bottom: 8px;">Order
							Summary</h2>
						<p
							style="color: var(--color-text-secondary); margin-bottom: 16px; font-size: 0.9rem;">
							From <strong><%=session.getAttribute("restaurantName") %></strong>
						</p>

						<div class="order-items-list">


							<%
            		if (cart != null && !cart.getItems().isEmpty()) {

            		    for (CartItems item : cart.getItems().values()) {
            		        itemTotal += item.getTotalPrice();
            		    }

            		}

            		double grandTotal =
            		        itemTotal
            		      + df
            		      + pf
            		      + gst
            		      - discount;
            		
            		session.setAttribute("grandTotal", grandTotal);
            		
            		
            		if(cart != null && !cart.getItems().isEmpty()) {
            			for(CartItems item: cart.getItems().values()) {
            		%>
							<div class="order-item">
								<div>
									<div class="order-item-name"><%=item.getName() %></div>
									<div class="order-item-qty">
										Qty:
										<%=item.getQuantity() %>
										× ₹<%=item.getPrice() %></div>
								</div>
								<div class="order-item-price">
									₹<%=item.getTotalPrice() %></div>
							</div>
							<%
						}
            				%>

						</div>

						<!-- 5. Promo Code Section -->
						<div class="form-group" style="margin-bottom: 24px;">
							<div class="promo-input-group">
								<input type="text" class="form-input"
									placeholder="Enter Promo Code" />
								<button class="btn btn-secondary">Apply</button>
							</div>
						</div>

						<!-- 7. Bill Details -->
						<h3 style="font-size: 1.1rem; margin-bottom: 16px;">Bill
							Details</h3>
						<div class="summary-row">
							<span>Item Total</span> <span>₹<%= itemTotal %></span>
						</div>
						<div class="summary-row">
							<span>Delivery Fee</span> <span>₹<%= df %></span>
						</div>
						<div class="summary-row">
							<span>Platform Fee</span> <span>₹<%= pf %></span>
						</div>
						<div class="summary-row">
							<span>GST and Restaurant Charges</span> <span>₹<%= gst %></span>
						</div>
						<div class="summary-row discount">
							<span>Discount</span> <span>-₹<%= String.format("%.2f", discount) %></span>
						</div>
						<div class="summary-row total">
							<span>Grand Total</span> <span>₹<%= grandTotal %></span>
						</div>

						<!-- 8. Place Order Section -->
						<button type="submit" class="btn btn-primary" style="width: 100%;">
							Place Order • ₹<%=grandTotal%>
						</button>
						<p
							style="text-align: center; font-size: 0.8rem; color: var(--color-text-secondary);">
							By placing your order, you agree to our Terms of Service and
							Privacy Policy.</p>
						<% 
            }
			%>

						<!-- 9. Trust Section -->
						<div class="trust-badges">
							<div class="trust-badge">
								<svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
								<path stroke-linecap="round" stroke-linejoin="round"
										stroke-width="2"
										d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path></svg>
								Secure Payment
							</div>
							<div class="trust-badge">
								<svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
								<path stroke-linecap="round" stroke-linejoin="round"
										stroke-width="2"
										d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
								Fast Delivery
							</div>
							<div class="trust-badge">
								<svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
								<path stroke-linecap="round" stroke-linejoin="round"
										stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
								Fresh Food
							</div>
							<div class="trust-badge">
								<svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
								<path stroke-linecap="round" stroke-linejoin="round"
										stroke-width="2"
										d="M18.364 5.636l-3.536 3.536m0 5.656l3.536 3.536M9.172 9.172L5.636 5.636m3.536 9.192l-3.536 3.536M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-5 0a4 4 0 11-8 0 4 4 0 018 0z"></path></svg>
								24/7 Support
							</div>
						</div>

					</div>
				</aside>
			</div>

			<!-- 10. Empty & Loading States (Hidden by default, can be toggled via JS by adding .state-active) -->

			<!-- Empty Cart State -->
			<div class="state-container" id="empty-state">
				<div class="state-illustration">
					<svg width="60" height="60" fill="none" stroke="currentColor"
						stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round"
							d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path>
          </svg>
				</div>
				<h2 class="state-title">Your cart is empty</h2>
				<p class="state-desc">Looks like you haven't added any delicious
					food yet.</p>
				<a href="restaurant.jsp" class="btn btn-primary">Browse
					Restaurants</a>
			</div>

			<!-- Payment Error State -->
			<div class="state-container" id="error-state">
				<div class="state-illustration"
					style="color: var(--color-danger); background-color: rgba(239, 68, 68, 0.1);">
					<svg width="60" height="60" fill="none" stroke="currentColor"
						stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round"
							d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
          </svg>
				</div>
				<h2 class="state-title">Payment Failed</h2>
				<p class="state-desc">We couldn't process your payment. Please
					try again or use a different method.</p>
				<button class="btn btn-primary"
					onclick="document.getElementById('error-state').classList.remove('state-active')">Try
					Again</button>
			</div>

			<!-- Loading Skeleton State -->
			<div class="state-container" id="loading-state"
				style="text-align: left; background: transparent; box-shadow: none;">
				<div class="checkout-layout">
					<div>
						<div class="skeleton-box"
							style="height: 200px; margin-bottom: 24px;"></div>
						<div class="skeleton-box"
							style="height: 150px; margin-bottom: 24px;"></div>
					</div>
					<div>
						<div class="skeleton-box" style="height: 400px;"></div>
					</div>
				</div>
			</div>
		</form>
	</main>

	<!-- ==================== FOOTER (Reused from restaurant.jsp) ==================== -->
	<footer class="footer" id="footer" style="margin-top: 40px;">
		<div class="container">
			<div class="footer-grid">
				<!-- Footer Column 1: Brand -->
				<div class="footer-column footer-brand">
					<a href="restaurant.jsp" class="footer-logo"> <img
						src="images/logo/hungrify-logo-icon.png" alt="Hungrify logo"
						height="40" width="40" /> <span class="brand-name"> <span
							class="brand-dark">Hungr</span><span class="brand-orange">ify</span>
					</span>
					</a>
					<p class="footer-description">Delivering happiness one meal at
						a time. Hungrify connects you with the best local restaurants for
						a fast, fresh, and delightful dining experience.</p>
				</div>

				<!-- Footer Column 2: Quick Links -->
				<div class="footer-column">
					<h4 class="footer-heading">Quick Links</h4>
					<ul class="footer-links">
						<li><a href="#">Restaurants</a></li>
						<li><a href="#">Cuisines</a></li>
						<li><a href="#">Offers</a></li>
					</ul>
				</div>

				<!-- Footer Column 3: Contact -->
				<div class="footer-column">
					<h4 class="footer-heading">Contact</h4>
					<address class="footer-contact">
						<p>
							123 Foodie Street, Flavor Town,<br />New York, NY 10001
						</p>
						<p>
							<a href="mailto:hello@hungrify.com">hello@hungrify.com</a>
						</p>
					</address>
				</div>
			</div>

			<div class="footer-bottom">
				<p class="copyright">&copy; 2026 Hungrify. All rights reserved.</p>
			</div>
		</div>
	</footer>

	<!-- Application Scripts -->
	<script src="js/theme.js"></script>
	<script src="js/navigation.js"></script>
</body>
</html>
