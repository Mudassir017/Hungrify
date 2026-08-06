<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page
	import="java.util.Map,com.hungrify.model.Cart,com.hungrify.model.CartItems"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cart - Hungrify</title>
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet" />
<link rel="stylesheet" href="css/hungrify-base.css">
<link rel="stylesheet" href="css/cart.css">
<!-- Theme Initializer -->
<script>
  (function () {
    var saved = localStorage.getItem("theme");
    var dark = saved === "dark" || (!saved && window.matchMedia("(prefers-color-scheme: dark)").matches);
    if (dark) {
      document.documentElement.classList.add("dark-theme");
      document.documentElement.setAttribute("data-theme", "dark");
    }
  })();
</script>
</head>
<body>

	<%
	Cart cart = (Cart) session.getAttribute("cart");
	Integer restaurantId = (Integer) session.getAttribute("restaurantId");

	double grandTotal = 0;

	%>

	<!-- Header -->
	<header class="header">
		<div class="container header-content">
			<a href="#home" class="footer-logo" aria-label="Hungrify Home">
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
            <a href="menu?restaurantId=<%=restaurantId %>" class="btn btn-secondary"> <svg width="20"
					height="20" fill="none" stroke="currentColor" stroke-width="2"
					viewBox="0 0 24 24">
					<path stroke-linecap="round" stroke-linejoin="round"
						d="M15 19l-7-7 7-7"></path></svg> Continue Shopping
			</a>
		</div>
	</header>

	<!-- Hero Section -->
	<section class="hero container">
		<h1>Your Shopping Cart</h1>
		<p>Review your items and proceed to checkout.</p>
	</section>

	<!-- Main Layout -->
	<main class="container">
	<%
	if (cart != null && !cart.getItems().isEmpty()) {
	%>

		<!-- Wrapper class to toggle empty state if needed. Remove 'empty-cart-active' to show normal cart. -->
		<div class="cart-wrapper">

			<div class="cart-layout">
				<!-- Left Side: Cart Items -->
				<div class="cart-items">

					<!-- Cart Item 1 -->
					
					<%
						for(CartItems item : cart.getItems().values()) {
							
							grandTotal = item.getTotalPrice() + grandTotal;
					%>
					<article class="cart-card">
						<div class="cart-image-wrapper">
							<div class="badge-veg-nonveg veg" aria-label="Vegetarian"></div>
							<img
								src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-4.0.3&auto=format&fit=crop&w=300&q=80"
								alt="Classic Cheeseburger" loading="lazy">
						</div>
						<div class="cart-details">
							<div>
								<div class="badges">
									<span class="badge badge-bestseller">Bestseller</span>
								</div>
								<div class="cart-header">
									<div>
										<h3 class="cart-title"><%=item.getName() %></h3>
										<div class="cart-restaurant">
											<svg width="16" height="16" fill="none" stroke="currentColor"
												stroke-width="2" viewBox="0 0 24 24">
												<path stroke-linecap="round" stroke-linejoin="round"
													d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path></svg>
											<%=session.getAttribute("restaurantName") %>
										</div>
									</div>
									<div class="cart-price-container">
										<div class="cart-price"><%= item.getPrice() %></div>
									</div>
								</div>
								<p class="cart-desc">Juicy beef patty with melted cheddar
									cheese, lettuce, tomato, and our signature sauce on a toasted
									brioche bun.</p>
							</div>

							<div class="cart-actions">
								<div class="qty-update">
									<form action="cartServlet" method="post">
										<div class="quantity-selector">
											<input type="hidden" name="menuId"
												value="<%=item.getMenuId()%>"> <input type="hidden"
												name="restaurantId" value="<%=restaurantId%>"> <input
												type="hidden" name="action" value="update"> <input
												type="hidden" name="quantity"
												value="<%=item.getQuantity() - 1%>">
											<button class="quantity-btn" aria-label="Increase quantity">-</button>
										</div>
									</form>
									<span class="quantity-input"> <%=item.getQuantity()%></span>
									<form action="cartServlet" method="post">
										<div class="quantity-selector">
											<input type="hidden" name="menuId"
												value="<%=item.getMenuId()%>"> <input type="hidden"
												name="restaurantId" value="<%=restaurantId%>"> <input
												type="hidden" name="action" value="update"> <input
												type="hidden" name="quantity"
												value="<%=item.getQuantity() + 1%>">
											<button class="quantity-btn" aria-label="Increase quantity">+</button>
										</div>
									</form>
								</div>
								<div>
									<form action="cartServlet" method="post">
										<input type="hidden" name="menuId"
											value="<%=item.getMenuId()%>"> <input type="hidden"
											name="restaurantId" value="<%=restaurantId%>"> <input
											type="hidden" name="action" value="remove">
										<button class="btn-danger" aria-label="Remove item">Remove</button>
									</form>
								</div>
							</div>
						</div>
					</article>
					<%
					}
					%>
				</div>

				<!-- Right Side: Order Summary -->
				<aside class="order-summary">
					<h2 class="summary-title">Order Summary</h2>

					<div class="summary-row">
						<span>Items (<%=cart.getTotalItems()%>)</span> <span>₹<%=grandTotal %></span>
					</div>
					<div class="summary-row">
						<span>Delivery Fee</span> <span>$2.99</span>
					</div>
					<div class="summary-row discount">
						<span>Discount (PROMO10)</span> <span>-$3.05</span>
					</div>
					<div class="summary-row">
						<span>Taxes / GST</span> <span>$1.52</span>
					</div>

					<div class="summary-row total">
						<span>Grand Total</span> <span>₹<%=grandTotal %></span>
					</div>

					<div class="summary-actions">
						<a href="checkout"><button class="btn btn-primary">
							Proceed to Checkout
							<svg width="20" height="20" fill="none" stroke="currentColor"
								stroke-width="2" viewBox="0 0 24 24">
								<path stroke-linecap="round" stroke-linejoin="round"
									d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
						</button></a>
						<a href="menu?restaurantId=<%=restaurantId %>" class="btn btn-secondary">Add more items</a>
					</div>

					<div class="secure-note">
						<svg fill="none" stroke="currentColor" stroke-width="2"
							viewBox="0 0 24 24">
							<path stroke-linecap="round" stroke-linejoin="round"
								d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path></svg>
						Secure Checkout Guarantee
					</div>
				</aside>
			</div>
			
			<%
		    }
			else {
		    %>

			<!-- Empty Cart State -->
			<div class="empty-cart">
				<div class="empty-illustration">
					<svg width="80" height="80" fill="none" stroke="currentColor"
						stroke-width="2" viewBox="0 0 24 24">
						<path stroke-linecap="round" stroke-linejoin="round"
							d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
				</div>
				<h2>Your cart is empty</h2>
				<p>Looks like you haven't added any delicious food yet.</p>
				<a href="restaurant" class="btn btn-primary">Browse
					Restaurants</a>
			</div>
			<%
			}
			%>
		</div>
		
	</main>

</body>
</html>

