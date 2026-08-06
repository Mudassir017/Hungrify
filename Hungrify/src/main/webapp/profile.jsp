<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.hungrify.model.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Hungrify - Profile</title>
<meta name="description"
	content="Hungrify delivers your favorite food from the best local restaurants, fast and fresh to your doorstep. Order online now!" />
<meta name="keywords"
	content="food delivery, restaurants, online ordering, Hungrify, fast delivery" />
<meta name="author" content="Hungrify" />
<meta name="theme-color" content="#FF7A00" />
<meta name="robots" content="index, follow" />
<link rel="canonical" href="https://hungrify.com/" />

<!-- Open Graph -->
<meta property="og:type" content="website" />
<meta property="og:title" content="Hungrify - Fast. Fresh. Delivered." />
<meta property="og:description"
	content="Discover the best restaurants in your city and get your favorite meals delivered straight to your doorstep." />
<meta property="og:image" content="images/logo/hungrify-logo-full.png" />
<meta property="og:url" content="https://hungrify.com/" />
<meta property="og:site_name" content="Hungrify" />

<!-- Twitter Card -->
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:title" content="Hungrify - Fast. Fresh. Delivered." />
<meta name="twitter:description"
	content="Discover the best restaurants in your city and get your favorite meals delivered straight to your doorstep." />
<meta name="twitter:image" content="images/logo/hungrify-logo-full.png" />

<!-- Favicon -->
<link rel="icon" type="image/png" href="images/logo/favicon.png" />
<link rel="apple-touch-icon" href="images/logo/hungrify-logo-icon.png" />

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@400;500;600;700&display=swap"
	rel="stylesheet" />

<!-- Stylesheet -->
<link rel="stylesheet" href="css/hungrify-base.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/profile.css">
<!-- Theme Initializer (prevents flash of wrong theme) -->
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

<!-- Backend-injected featured recommendation JSON (populated by JSP/Servlet) -->
<script id="featured-recommendation-data" type="application/json"></script>
</head>
<body class="profile-page">

<%@ include file="common/short-nav.jsp" %>

	<%
User user = (User)session.getAttribute("user");
%>

	<div class="profile-card">

		<div class="profile-top">

			<div class="profile-avatar">
				<%= user.getUserName().substring(0,1).toUpperCase() %>
			</div>

			<h2><%= user.getUserName() %></h2>

			<p><%= user.getEmail() %></p>

		</div>

		<div class="profile-stats">

			<div class="stat-box">
				<span>Role</span>
				<h4><%= user.getRole().substring(0,1).toUpperCase() + user.getRole().substring(1).toLowerCase() %></h4>
			</div>

			<div class="stat-box">
				<span>Member Since</span>
				<h4>
					<%= new java.text.SimpleDateFormat("MMM yyyy")
                .format(user.getCreatedDate()) %>
				</h4>
			</div>

			<div class="stat-box">
				<span>Total Orders</span>
				<h4><%= request.getAttribute("totalOrders") %></h4>
			</div>

		</div>

		<div class="info-card">

			<h3>Personal Information</h3>

			<div class="info-row">
				<label>Full Name</label> <span><%= user.getUserName() %></span>
			</div>

			<div class="info-row">
				<label>Email</label> <span><%= user.getEmail() %></span>
			</div>

			<div class="info-row">
				<label>Address</label> <span><%= user.getAddress() %></span>
			</div>

		</div>

		<div class="profile-actions">

			<a href="editProfile" class="btn btn-primary"> Edit Profile </a> <a
				href="changePassword" class="btn btn-outline"> Change Password </a>

		</div>
</div>
</body>
</html>