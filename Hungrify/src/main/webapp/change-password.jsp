<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/hungrify-base.css" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/profile.css">
</head>
<body class="change-password-page">
		
		<main class="profile-container">

    <div class="profile-card">

        <div class="profile-header">

            <div class="profile-avatar">
                🔒
            </div>

            <div class="profile-info">
                <h2>Change Password</h2>
                <p>Keep your account secure by updating your password.</p>
            </div>

        </div>

			<%
			String error = (String) request.getAttribute("error");

			if (error != null) {
			%>

			<p style="color: red;"><%=error%></p>

			<%
			}
			%>

			<form action="changePassword" method="post" class="profile-form">

            <div class="form-group">

                <label>Current Password</label>

                <input
                    type="password"
                    name="currentPassword"
                    required>

            </div>

            <div class="form-group">

                <label>New Password</label>

                <input
                    type="password"
                    name="newPassword"
                    required>

            </div>

            <div class="form-group">

                <label>Confirm Password</label>

                <input
                    type="password"
                    name="confirmPassword"
                    required>

            </div>

            <div class="form-buttons">

                <button
                    type="submit"
                    class="btn btn-primary">

                    Change Password

                </button>

                <a
                    href="profile"
                    class="btn btn-outline">

                    Cancel

                </a>

            </div>

        </form>

    </div>

</main>
	
</body>
</html>