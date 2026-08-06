<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

	<form action="">
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

			<form action="address" method="post">

				<!-- Full Name -->

				<div class="form-group">
					<label>Full Name *</label> <input type="text" name="fullName"
						class="form-input" placeholder="Enter full name" required>
				</div>

				<!-- Phone -->

				<div class="form-group">
					<label>Phone Number *</label> <input type="tel" name="phone"
						class="form-input" maxlength="10"
						placeholder="Enter mobile number" required>
				</div>

				<!-- Address Type -->

				<div class="form-group">
					<label>Address Type *</label> <select name="addressType"
						class="form-input" required>

						<option value="">Select Address Type</option>
						<option value="HOME">Home</option>
						<option value="WORK">Work</option>
						<option value="OTHER">Other</option>

					</select>
				</div>

				<!-- House -->

				<div class="form-group">
					<label>House / Flat / Building *</label> <input type="text"
						name="houseNo" class="form-input"
						placeholder="Flat No., House No." required>
				</div>

				<!-- Area -->

				<div class="form-group">
					<label>Area / Street *</label> <input type="text" name="area"
						class="form-input" placeholder="Area, Street, Locality" required>
				</div>

				<!-- Landmark -->

				<div class="form-group">
					<label>Landmark</label> <input type="text" name="landmark"
						class="form-input" placeholder="Nearby Landmark">
				</div>

				<!-- City -->

				<div class="form-group">
					<label>City *</label> <input type="text" name="city"
						class="form-input" placeholder="Enter city" required>
				</div>

				<!-- State -->

				<div class="form-group">
					<label>State *</label> <input type="text" name="state"
						class="form-input" placeholder="Enter state" required>
				</div>

				<!-- Pincode -->

				<div class="form-group">
					<label>Pincode *</label> <input type="text" name="pincode"
						maxlength="6" class="form-input" placeholder="Enter pincode"
						required>
				</div>

				<!-- Default -->

				<div class="form-group">

					<label
						style="display: flex; align-items: center; gap: 10px; cursor: pointer;">

						<input type="checkbox" name="isDefault"> Set as default
						address

					</label>

				</div>

				<button type="submit" class="btn btn-primary">Save Address

				</button>

			</form>

		</section>
	</form>

</body>
</html>