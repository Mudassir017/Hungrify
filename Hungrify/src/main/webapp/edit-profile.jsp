<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.hungrify.model.User"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hungrify - Edit Profile</title>
    <meta
      name="description"
      content="Hungrify delivers your favorite food from the best local restaurants, fast and fresh to your doorstep. Order online now!"
    />
    <meta
      name="keywords"
      content="food delivery, restaurants, online ordering, Hungrify, fast delivery"
    />
    <meta name="author" content="Hungrify" />
    <meta name="theme-color" content="#FF7A00" />
    <meta name="robots" content="index, follow" />
    <link rel="canonical" href="https://hungrify.com/" />

    <!-- Open Graph -->
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Hungrify - Fast. Fresh. Delivered." />
    <meta
      property="og:description"
      content="Discover the best restaurants in your city and get your favorite meals delivered straight to your doorstep."
    />
    <meta property="og:image" content="images/logo/hungrify-logo-full.png" />
    <meta property="og:url" content="https://hungrify.com/" />
    <meta property="og:site_name" content="Hungrify" />

    <!-- Twitter Card -->
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="Hungrify - Fast. Fresh. Delivered." />
    <meta
      name="twitter:description"
      content="Discover the best restaurants in your city and get your favorite meals delivered straight to your doorstep."
    />
    <meta name="twitter:image" content="images/logo/hungrify-logo-full.png" />

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="images/logo/favicon.png" />
    <link rel="apple-touch-icon" href="images/logo/hungrify-logo-icon.png" />

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Poppins:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />

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
<body class="edit-profile-page">

	<%
User user = (User) session.getAttribute("user");

if(user == null){
	response.sendRedirect("login.jsp");
	return;
}
%>

	<%@ include file="common/short-nav.jsp" %>

	<main class="profile-container">

    <div class="profile-card">

        <div class="profile-header">

            <div class="profile-avatar">
                <%= user.getUserName().substring(0,1).toUpperCase() %>
            </div>

            <div class="profile-info">
                <h2>Edit Profile</h2>
                <p>Update your personal information.</p>
            </div>

        </div>


        <form action="editProfile" method="post" class="profile-form">

            <div class="form-group">
                <label>Full Name</label>

                <input
                    type="text"
                    name="userName"
                    value="<%= user.getUserName() %>"
                    required>
            </div>


            <div class="form-group">
                <label>Email</label>

                <input
                    type="email"
                    value="<%= user.getEmail() %>"
                    readonly>
            </div>


            <div class="form-group">

                <label>Address</label>

                <textarea
                    name="address"
                    rows="4"><%= user.getAddress()==null?"":user.getAddress() %></textarea>

            </div>


            <div class="form-group">

                <label>Role</label>

                <input
                    type="text"
                    value="<%= user.getRole().substring(0,1).toUpperCase() + user.getRole().substring(1).toLowerCase() %>"
                    readonly>

            </div>


            <div class="form-buttons">

                <button
                    type="submit"
                    class="btn-primary btn">

                    Save Changes

                </button>

                <a
                    href="profile"
                    class="btn-outline btn">

                    Cancel

                </a>

            </div>

        </form>

    </div>

</main>
</body>
</html>