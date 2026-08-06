<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ page import="java.util.List,com.hungrify.model.Restaurant,com.hungrify.model.User" %>
    
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hungrify - Fast. Fresh. Delivered. | Food Delivery</title>
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
  <body>
  
  
    <a href="#top" class="skip-link">Skip to main content</a>

    <!-- ==================== HEADER ==================== -->
    <%@ include file="common/navbar.jsp" %>

    <main>
      <!-- ==================== HERO SECTION ==================== -->
      <section class="hero" id="home">
        <div class="container">
          <div class="hero-content">
            <div class="hero-text">
              <span class="badge">🚀 #1 Food Delivery Platform</span>
              <h1>
                Your Favorite Food,<br />
                Delivered <span class="text-highlight">Fast</span>
              </h1>
              <p class="hero-description">
                Discover the best restaurants in your city and get your favorite
                meals delivered straight to your doorstep. Fresh ingredients,
                fast delivery, and an unbeatable dining experience — all from
                the comfort of your home.
              </p>

              <!-- CTA Buttons -->
              <div class="hero-cta">
                <a
                  href="#restaurants"
                  class="btn btn-primary btn-lg"
                  aria-label="Order food now"
                  >Order Now</a
                >
                <a
                  href="#restaurants"
                  class="btn btn-secondary btn-lg"
                  aria-label="Browse available restaurants"
                  >Explore Restaurants</a
                >
              </div>

              <!-- Trust Indicators -->
              <div class="trust-indicators">
                <div class="trust-item">
                  <span class="trust-number">4.8★</span>
                  <span class="trust-label">App Rating</span>
                </div>
                <div class="trust-item">
                  <span class="trust-number">500+</span>
                  <span class="trust-label">Restaurants</span>
                </div>
                <div class="trust-item">
                  <span class="trust-number">10K+</span>
                  <span class="trust-label">Happy Customers</span>
                </div>
              </div>
            </div>

            <!-- Featured Recommendation — populated dynamically via js/featured-recommendation.js -->
            <div class="hero-visual">
              <article
                class="recommendation-card is-loading"
                id="hero-recommendation"
                aria-labelledby="rec-title-label"
                aria-busy="true"
              >
                <div class="rec-glow" aria-hidden="true"></div>
                <div class="rec-header">
                  <span class="rec-badge" id="rec-title-label"></span>
                  <span class="status-badge" id="rec-availability"></span>
                </div>
                <div class="rec-content">
                  <div class="rec-img-wrapper">
                    <img
                      src=""
                      alt=""
                      class="rec-dish-img"
                      id="rec-dish-image"
                      width="280"
                      height="200"
                    />
                    <span class="rec-cuisine" id="rec-cuisine"></span>
                  </div>
                  <div class="rec-details">
                    <h3 class="rec-name" id="rec-dish-name"></h3>
                    <p class="rec-restaurant" id="rec-restaurant-name"></p>
                    <p class="rec-desc" id="rec-dish-desc" hidden></p>
                    <div class="rec-meta">
                      <div class="rec-rating" aria-label="Rating">
                        <span class="star" aria-hidden="true">★</span>
                        <span class="rating-value" id="rec-rating-value"></span>
                      </div>
                      <div class="rec-delivery">
                        <span class="icon" aria-hidden="true">🕐</span>
                        <span id="rec-delivery-time"></span>
                      </div>
                      <div class="rec-price" id="rec-dish-price"></div>
                    </div>
                  </div>
                </div>
                <div class="rec-footer">
                  <a
                    href="#restaurants"
                    class="btn btn-primary btn-sm rec-cta"
                    id="rec-cta"
                  ></a>
                </div>
              </article>
            </div>
          </div>
        </div>
      </section>

      <!-- ==================== SEARCH SECTION ==================== -->
      <section class="search-section">
        <div class="container">
          <div class="search-wrapper">
            <form
              class="search-form"
              id="search-form"
              action="#"
              method="get"
              role="search"
            >
              <label for="search-input" class="sr-only"
                >Search restaurants, cuisines, or dishes</label
              >
              <input
                type="search"
                class="search-input"
                name="q"
                placeholder="Search restaurants, cuisines, or dishes..."
                id="search-input"
                autocomplete="off"
              />
              <button
                type="submit"
                class="btn btn-primary search-btn"
                aria-label="Search"
              >
                Search
              </button>
            </form>
            <div class="search-tags">
              <a href="#restaurants" class="search-tag">Popular</a>
              <a href="#restaurants" class="search-tag">Near Me</a>
              <a href="#restaurants" class="search-tag">Top Rated</a>
              <a href="#restaurants" class="search-tag">Fast Delivery</a>
              <a href="#restaurants" class="search-tag">New</a>
              <a href="#promo" class="search-tag">Offers</a>
            </div>
          </div>
        </div>
      </section>

      <!-- ==================== CATEGORIES SECTION ==================== -->
      <section class="categories section" id="categories">
        <div class="container">
          <div class="section-header">
            <span class="badge">Categories</span>
            <h2 class="section-title">Browse By Category</h2>
            <p class="section-subtitle">
              Explore our wide range of cuisines and find exactly what you're
              craving today.
            </p>
          </div>
          <div class="categories-grid">
            <!-- Category Card 1: Pizza -->
            <article class="category-card" id="category-card">
              <div class="category-icon">🍕</div>
              <h3 class="category-name">Pizza</h3>
              <p class="category-count">120+ Restaurants</p>
            </article>

            <!-- Category Card 2: Burgers -->
            <article class="category-card">
              <div class="category-icon">🍔</div>
              <h3 class="category-name">Burgers</h3>
              <p class="category-count">95+ Restaurants</p>
            </article>

            <!-- Category Card 3: Sushi -->
            <article class="category-card">
              <div class="category-icon">🍣</div>
              <h3 class="category-name">Sushi</h3>
              <p class="category-count">60+ Restaurants</p>
            </article>

            <!-- Category Card 4: Salads -->
            <article class="category-card">
              <div class="category-icon">🥗</div>
              <h3 class="category-name">Salads</h3>
              <p class="category-count">75+ Restaurants</p>
            </article>

            <!-- Category Card 5: Desserts -->
            <article class="category-card">
              <div class="category-icon">🍰</div>
              <h3 class="category-name">Desserts</h3>
              <p class="category-count">85+ Restaurants</p>
            </article>

            <!-- Category Card 6: Beverages -->
            <article class="category-card">
              <div class="category-icon">🥤</div>
              <h3 class="category-name">Beverages</h3>
              <p class="category-count">110+ Restaurants</p>
            </article>
          </div>
        </div>
      </section>

      <!-- ==================== POPULAR RESTAURANTS SECTION ==================== -->
      <section class="restaurants section" id="restaurants">
        <div class="container">
          <div class="section-header">
            <span class="badge">Top Picks</span>
            <h2 class="section-title">Popular Restaurants</h2>
            <p class="section-subtitle">
              Handpicked restaurants loved by thousands of food enthusiasts in
              your area.
            </p>
          </div>
          <div class="restaurants-grid">
    <%
    List<Restaurant> allRestaurants = (List<Restaurant>)request.getAttribute("allRestaurants");
            		for(Restaurant restaurant : allRestaurants) {
    %>       		
          <article class="restaurant-card">
              <div class="restaurant-image">
                <div class="image-placeholder">🍕</div>
                <span class="offer-badge">20% OFF</span>
                <button class="favorite-btn" aria-label="Add to favorites">
                  ♡
                </button>
              </div>
              <div class="restaurant-content">
                <div class="restaurant-header">
                  <h3 class="restaurant-title"><%=restaurant.getRestaurantName() %></h3>
                  <span class="restaurant-status open">Open</span>
                </div>
                <div class="restaurant-rating">
                  <span class="star">★</span>
                  <span class="rating-value"><%=restaurant.getRating() %></span>
                  <span class="rating-count">(342 reviews)</span>
                </div>
                <div class="restaurant-meta">
                  <span class="restaurant-cuisine"><%=restaurant.getCuisine() %></span>
                  <span class="meta-divider">•</span>
                  <span class="restaurant-delivery">🕐 <%=restaurant.getDeliveryTime() %></span>
                  <span class="meta-divider">•</span>
                  <span class="restaurant-fee">Free Delivery</span>
                </div>
                <a
                  href="menu?restaurantId=<%=restaurant.getRestaurantId() %>"
                  class="btn btn-primary btn-sm restaurant-cta"
                  aria-label="View menu of The Italian Corner"
                  >View Menu</a
                >
              </div>
            </article>
    	<%
            		}
    %>
        </div>
      </div>
    </section>

    <!-- ==================== POPULAR DISHES SECTION ==================== -->
    <section class="dishes section" id="dishes">
        <div class="container">
          <div class="section-header">
            <span class="badge">Trending Now</span>
            <h2 class="section-title">Popular Dishes</h2>
            <p class="section-subtitle">
              The most ordered dishes this week — discover what everyone is
              raving about.
            </p>
          </div>
          <div class="dishes-grid">
            <!-- Dish Card 1 -->
            <article class="dish-card" id="food-card">
              <div class="dish-image">
                <div class="image-placeholder">🍕</div>
                <button class="favorite-btn" aria-label="Add to favorites">
                  ♡
                </button>
              </div>
              <div class="dish-content">
                <h3 class="food-name">Margherita Pizza</h3>
                <p class="dish-restaurant">The Italian Corner</p>
                <div class="dish-footer">
                  <span class="food-price">₹299</span>
                  <span class="dish-rating">★ 4.8</span>
                </div>
                <button
                  class="btn btn-primary btn-sm add-to-cart"
                  aria-label="Add Margherita Pizza to cart"
                >
                  Add to Cart
                </button>
              </div>
            </article>

            <!-- Dish Card 2 -->
            <article class="dish-card">
              <div class="dish-image">
                <div class="image-placeholder">🍔</div>
                <button class="favorite-btn" aria-label="Add to favorites">
                  ♡
                </button>
              </div>
              <div class="dish-content">
                <h3 class="food-name">Classic Cheeseburger</h3>
                <p class="dish-restaurant">Burger Barn</p>
                <div class="dish-footer">
                  <span class="food-price">₹9.49</span>
                  <span class="dish-rating">★ 4.7</span>
                </div>
                <button
                  class="btn btn-primary btn-sm add-to-cart"
                  aria-label="Add Classic Cheeseburger to cart"
                >
                  Add to Cart
                </button>
              </div>
            </article>

            <!-- Dish Card 3 -->
            <article class="dish-card">
              <div class="dish-image">
                <div class="image-placeholder">🍜</div>
                <button class="favorite-btn" aria-label="Add to favorites">
                  ♡
                </button>
              </div>
              <div class="dish-content">
                <h3 class="food-name">Spicy Ramen Bowl</h3>
                <p class="dish-restaurant">Dragon Wok</p>
                <div class="dish-footer">
                  <span class="food-price">₹14.99</span>
                  <span class="dish-rating">★ 4.9</span>
                </div>
                <button
                  class="btn btn-primary btn-sm add-to-cart"
                  aria-label="Add Spicy Ramen Bowl to cart"
                >
                  Add to Cart
                </button>
              </div>
            </article>

            <!-- Dish Card 4 -->
            <article class="dish-card">
              <div class="dish-image">
                <div class="image-placeholder">🥗</div>
                <button class="favorite-btn" aria-label="Add to favorites">
                  ♡
                </button>
              </div>
              <div class="dish-content">
                <h3 class="food-name">Caesar Salad</h3>
                <p class="dish-restaurant">Green Bowl Café</p>
                <div class="dish-footer">
                  <span class="food-price">₹8.99</span>
                  <span class="dish-rating">★ 4.5</span>
                </div>
                <button
                  class="btn btn-primary btn-sm add-to-cart"
                  aria-label="Add Caesar Salad to cart"
                >
                  Add to Cart
                </button>
              </div>
            </article>

            <!-- Dish Card 5 -->
            <article class="dish-card">
              <div class="dish-image">
                <div class="image-placeholder">🍣</div>
                <button class="favorite-btn" aria-label="Add to favorites">
                  ♡
                </button>
              </div>
              <div class="dish-content">
                <h3 class="food-name">Salmon Nigiri Set</h3>
                <p class="dish-restaurant">Tokyo Bites</p>
                <div class="dish-footer">
                  <span class="food-price">₹18.99</span>
                  <span class="dish-rating">★ 4.8</span>
                </div>
                <button
                  class="btn btn-primary btn-sm add-to-cart"
                  aria-label="Add Salmon Nigiri Set to cart"
                >
                  Add to Cart
                </button>
              </div>
            </article>

            <!-- Dish Card 6 -->
            <article class="dish-card">
              <div class="dish-image">
                <div class="image-placeholder">🌮</div>
                <button class="favorite-btn" aria-label="Add to favorites">
                  ♡
                </button>
              </div>
              <div class="dish-content">
                <h3 class="food-name">Chicken Tacos</h3>
                <p class="dish-restaurant">Casa Del Taco</p>
                <div class="dish-footer">
                  <span class="food-price">₹10.49</span>
                  <span class="dish-rating">★ 4.6</span>
                </div>
                <button
                  class="btn btn-primary btn-sm add-to-cart"
                  aria-label="Add Chicken Tacos to cart"
                >
                  Add to Cart
                </button>
              </div>
            </article>

            <!-- Dish Card 7 -->
            <article class="dish-card">
              <div class="dish-image">
                <div class="image-placeholder">🥘</div>
                <button class="favorite-btn" aria-label="Add to favorites">
                  ♡
                </button>
              </div>
              <div class="dish-content">
                <h3 class="food-name">Butter Chicken</h3>
                <p class="dish-restaurant">Spice Garden</p>
                <div class="dish-footer">
                  <span class="food-price">₹13.99</span>
                  <span class="dish-rating">★ 4.9</span>
                </div>
                <button
                  class="btn btn-primary btn-sm add-to-cart"
                  aria-label="Add Butter Chicken to cart"
                >
                  Add to Cart
                </button>
              </div>
            </article>

            <!-- Dish Card 8 -->
            <article class="dish-card">
              <div class="dish-image">
                <div class="image-placeholder">🍰</div>
                <button class="favorite-btn" aria-label="Add to favorites">
                  ♡
                </button>
              </div>
              <div class="dish-content">
                <h3 class="food-name">Tiramisu</h3>
                <p class="dish-restaurant">The Italian Corner</p>
                <div class="dish-footer">
                  <span class="food-price">₹7.99</span>
                  <span class="dish-rating">★ 4.7</span>
                </div>
                <button
                  class="btn btn-primary btn-sm add-to-cart"
                  aria-label="Add Tiramisu to cart"
                >
                  Add to Cart
                </button>
              </div>
            </article>
          </div>
        </div>
      </section>

      <!-- ==================== FEATURES / WHY CHOOSE SECTION ==================== -->
      <section class="features section" id="features">
        <div class="container">
          <div class="section-header">
            <span class="badge">Why Hungrify</span>
            <h2 class="section-title">Why Choose Us</h2>
            <p class="section-subtitle">
              We go above and beyond to make sure every order is a delightful
              experience.
            </p>
          </div>
          <div class="features-grid">
            <!-- Feature Card 1 -->
            <article class="feature-card">
              <div class="feature-icon">🚀</div>
              <h3 class="feature-title">Fast Delivery</h3>
              <p class="feature-description">
                Get your food delivered in under 30 minutes. Our optimized
                logistics network ensures your meals arrive hot and fresh, every
                single time.
              </p>
            </article>

            <!-- Feature Card 2 -->
            <article class="feature-card">
              <div class="feature-icon">🛡️</div>
              <h3 class="feature-title">Secure Payments</h3>
              <p class="feature-description">
                Your transactions are protected with industry-leading
                encryption. Pay with confidence using credit cards, digital
                wallets, or cash on delivery.
              </p>
            </article>

            <!-- Feature Card 3 -->
            <article class="feature-card">
              <div class="feature-icon">🍽️</div>
              <h3 class="feature-title">Premium Restaurants</h3>
              <p class="feature-description">
                We partner with only the finest restaurants in your area. Every
                establishment is vetted for quality, hygiene, and customer
                satisfaction.
              </p>
            </article>

            <!-- Feature Card 4 -->
            <article class="feature-card">
              <div class="feature-icon">💯</div>
              <h3 class="feature-title">Quality Guaranteed</h3>
              <p class="feature-description">
                Not satisfied with your order? We offer a full money-back
                guarantee. Your happiness is our top priority — no questions
                asked.
              </p>
            </article>
          </div>
        </div>
      </section>

      <!-- ==================== PROMOTIONAL BANNER SECTION ==================== -->
      <section class="promo-banner" id="promo">
        <div class="container">
          <div class="promo-content">
            <div class="promo-text">
              <span class="promo-badge">Limited Offer</span>
              <h2>Get 50% Off Your First Order!</h2>
              <p>
                New to Hungrify? Enjoy an exclusive half-price discount on your
                very first order. Use code <strong>WELCOME50</strong> at
                checkout. Hurry — this offer won't last forever!
              </p>
              <a
                href="#restaurants"
                class="btn btn-primary btn-lg"
                aria-label="Order now and get 50 percent off"
                >Order Now</a
              >
            </div>
            <div class="promo-image">
              <img
                src="images/banners/promo-banner.png"
                alt="Special food delivery offer"
                class="promo-img"
              />
            </div>
          </div>
        </div>
      </section>

      <!-- ==================== DOWNLOAD APP SECTION ==================== -->
      <section class="app-section section" id="app">
        <div class="container">
          <div class="app-content">
            <div class="app-mockup">
              <img
                src="images/banners/app-mockup.png"
                alt="Hungrify mobile application"
                class="app-img"
              />
            </div>
            <div class="app-text">
              <span class="badge">Mobile App</span>
              <h2>Download the Hungrify App</h2>
              <p>
                Take Hungrify wherever you go. Track your orders in real-time,
                unlock app-exclusive deals, reorder your favorites with a single
                tap, and enjoy a seamless food delivery experience right from
                your phone.
              </p>
              <div class="app-buttons">
                <a
                  href="#"
                  class="app-store-btn"
                  aria-label="Download on App Store"
                >
                  <span class="store-icon">🍎</span>
                  <span class="store-text"
                    ><small>Download on</small>App Store</span
                  >
                </a>
                <a
                  href="#"
                  class="app-store-btn"
                  aria-label="Get it on Google Play"
                >
                  <span class="store-icon">▶️</span>
                  <span class="store-text"
                    ><small>Get it on</small>Google Play</span
                  >
                </a>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- ==================== TESTIMONIALS SECTION ==================== -->
      <section class="testimonials section" id="testimonials">
        <div class="container">
          <div class="section-header">
            <span class="badge">Testimonials</span>
            <h2 class="section-title">What Our Customers Say</h2>
            <p class="section-subtitle">
              Real stories from real food lovers who trust Hungrify for their
              daily meals.
            </p>
          </div>
          <div class="testimonials-grid">
            <!-- Testimonial Card 1 -->
            <article class="testimonial-card">
              <div class="testimonial-header">
                <div class="customer-photo">👤</div>
                <div class="customer-info">
                  <h4 class="customer-name">Sarah Johnson</h4>
                  <p class="customer-designation">Food Blogger</p>
                </div>
              </div>
              <div class="testimonial-rating">★★★★★</div>
              <p class="testimonial-text">
                "Hungrify has completely changed the way I order food. The
                delivery is lightning-fast, the restaurant selection is
                incredible, and the app is so easy to use. I recommend it to
                everyone!"
              </p>
            </article>

            <!-- Testimonial Card 2 -->
            <article class="testimonial-card">
              <div class="testimonial-header">
                <div class="customer-photo">👤</div>
                <div class="customer-info">
                  <h4 class="customer-name">Michael Chen</h4>
                  <p class="customer-designation">Software Engineer</p>
                </div>
              </div>
              <div class="testimonial-rating">★★★★★</div>
              <p class="testimonial-text">
                "As someone who works long hours, Hungrify is a lifesaver. The
                food always arrives hot, the portions are generous, and the
                customer support team is fantastic. Five stars all the way!"
              </p>
            </article>

            <!-- Testimonial Card 3 -->
            <article class="testimonial-card">
              <div class="testimonial-header">
                <div class="customer-photo">👤</div>
                <div class="customer-info">
                  <h4 class="customer-name">Emily Rodriguez</h4>
                  <p class="customer-designation">Marketing Manager</p>
                </div>
              </div>
              <div class="testimonial-rating">★★★★★</div>
              <p class="testimonial-text">
                "I've tried many food delivery apps, but Hungrify stands out.
                The exclusive offers are unbeatable, and I love being able to
                track my order in real-time. Truly a premium experience!"
              </p>
            </article>
          </div>
        </div>
      </section>

      <!-- ==================== NEWSLETTER SECTION ==================== -->
      <section class="newsletter section" id="newsletter">
        <div class="container">
          <div class="newsletter-content">
            <h2>Stay Updated</h2>
            <p>Subscribe to get exclusive offers and updates.</p>
            <form
              class="newsletter-form"
              id="newsletter-form"
              action="#"
              method="post"
            >
              <label for="newsletter-email" class="sr-only"
                >Enter your email address</label
              >
              <input
                type="email"
                class="newsletter-input"
                name="email"
                placeholder="Enter your email address"
                id="newsletter-email"
                required
                autocomplete="email"
              />
              <button
                type="submit"
                class="btn btn-primary"
                aria-label="Subscribe to newsletter"
              >
                Subscribe
              </button>
            </form>
          </div>
        </div>
      </section>
    </main>

    <!-- Back to Top -->
    <a href="#top" class="back-to-top" aria-label="Back to top">↑</a>

    <!-- ==================== FOOTER ==================== -->
    <%@ include file="common/footer.jsp" %>

    <!-- Application Scripts -->
    <script src="js/theme.js"></script>
    <script src="js/data-service.js"></script>
    <script src="js/featured-recommendation.js"></script>
    <script src="js/navigation.js"></script>
    <script src="js/interactions.js"></script>
    <script src="js/main.js"></script>
  </body>
</html>
