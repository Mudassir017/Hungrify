<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List,com.hungrify.model.Menu, com.hungrify.model.Restaurant, com.hungrify.model.User" %>


<%@ page import="com.hungrify.model.Cart"%>
<%@ page import="com.hungrify.model.CartItems"%>
<%@ page import="java.util.Map"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Restaurant Menu — Hungrify</title>
    <meta
      name="description"
      content="Browse menu, offers and bestsellers on Hungrify — fast food delivery from your favourite restaurants."
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:wght@500;600;700;800&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="css/hungrify-base.css" />
    <link rel="stylesheet" href="css/menu.css" />
    <script src="js/theme.js"></script>
    <script>
      (function () {
        var saved = localStorage.getItem("theme");
        if (saved === "dark" || (!saved && window.matchMedia("(prefers-color-scheme: dark)").matches)) {
          document.documentElement.classList.add("dark-theme");
        }
      })();
    </script>
  </head>
  <body>

	<%
	Restaurant restaurant = (Restaurant) request.getAttribute("restaurant");
	User loggedInUser = (User) session.getAttribute("user");
	%>
	<!-- ===================== NAVBAR (existing) ===================== -->
    <header class="nav" role="banner">
      <div class="container nav__inner">
        <a href="#" class="nav__logo" aria-label="Hungrify home">
          <span class="nav__logo-mark" aria-hidden="true">
          	<img class="menu-logo" alt="" src="images/logo/hungrify-logo-icon.png">
          </span>
          <span class="brand-name">
    				<span class="brand-dark">Hungr</span><span class="brand-orange">ify</span>
  			</span>
        </a>
        <nav class="nav__links" aria-label="Primary">
          <a href="restaurant">Home</a>
          <a href="menu" class="is-active">Menu</a>
          <a href="#">Offers</a>
          <a href="#">Help</a>
        </nav>
        <div class="nav__actions">
          <button class="btn btn--ghost btn--icon" aria-label="Search">
            <svg
              viewBox="0 0 24 24"
              width="18"
              height="18"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <circle cx="11" cy="11" r="7" />
              <path d="m20 20-3.5-3.5" />
            </svg>
          </button>
          
          <a href="cart.jsp">
             <button class="btn btn--ghost btn--icon" aria-label="Cart">
            <svg
              viewBox="0 0 24 24"
              width="18"
              height="18"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <circle cx="9" cy="20" r="1.6" />
              <circle cx="18" cy="20" r="1.6" />
              <path
                d="M3 4h2l2.4 12.2a2 2 0 0 0 2 1.6h8.2a2 2 0 0 0 2-1.5L21 8H6"
              />
            </svg>
            <span class="nav__badge">3</span>
          </button>
          </a>
          <button class="btn btn--primary"><%=loggedInUser.getFirstName() %></button>
        </div>
      </div>
    </header>

    <main>
      <!-- ===================== HERO ===================== -->
      <section class="hero" aria-label="Restaurant hero">
			<div class="hero__cover">
				<div class="hero__cover-gradient"></div>
			</div>

			<div class="container">
          <div class="hero__card">
            <div class="hero__logo" aria-hidden="true">
              <span>LOGO</span>
            </div>

            <div class="hero__body">
              <div class="hero__title-row">
                <div>
                  <h1 class="hero__name"><%=restaurant.getRestaurantName() %></h1>
                  <p class="hero__cuisine">
                    <%=restaurant.getCuisine() %>
                  </p>
                </div>
                <span class="badge badge--status badge--open">
                  <span class="dot"></span> Open Now
                </span>
              </div>

              <div class="hero__meta">
                <span class="chip chip--rating">
                  <svg
                    viewBox="0 0 24 24"
                    width="14"
                    height="14"
                    fill="currentColor"
                  >
                    <path
                      d="M12 2l2.9 6.9L22 10l-5.5 4.8L18 22l-6-3.6L6 22l1.5-7.2L2 10l7.1-1.1z"
                    />
                  </svg>
                  4.5 <span class="chip__muted">(1,240 reviews)</span>
                </span>
                <span class="chip">
                  <svg
                    viewBox="0 0 24 24"
                    width="14"
                    height="14"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  >
                    <circle cx="12" cy="12" r="9" />
                    <path d="M12 7v5l3 2" />
                  </svg>
                  <%=restaurant.getDeliveryTime() %>
                </span>
                <span class="chip">
                  <svg
                    viewBox="0 0 24 24"
                    width="14"
                    height="14"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  >
                    <path d="M3 7h13l3 4v6h-3" />
                    <circle cx="7" cy="18" r="2" />
                    <circle cx="17" cy="18" r="2" />
                  </svg>
                  ₹12.99 delivery
                </span>
                <span class="chip">Min. order ₹100</span>
              </div>

              <p class="hero__desc">
                Short restaurant description placeholder — a friendly line that
                captures the vibe, signature dishes, and what guests love most.
              </p>

              <div class="hero__foot">
                <span class="hero__addr">
                  <svg
                    viewBox="0 0 24 24"
                    width="14"
                    height="14"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  >
                    <path d="M21 10c0 7-9 13-9 13S3 17 3 10a9 9 0 1 1 18 0z" />
                    <circle cx="12" cy="10" r="3" />
                  </svg>
                  <%=restaurant.getAddress() %>
                </span>
                <div class="hero__tags">
                  <span class="tag">Bestseller</span>
                  <span class="tag">Pure Veg Options</span>
                  <span class="tag">Family Pack</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- ===================== OFFER BANNER ===================== -->
      <section class="container">
        <div class="offers" aria-label="Current offers">
          <article class="offer">
            <div class="offer__icon" aria-hidden="true">%</div>
            <div>
              <h3>50% OFF up to ₹200</h3>
              <p>Use code <strong>HUNGRIFY50</strong> • Above ₹200</p>
            </div>
          </article>
          <article class="offer offer--alt">
            <div class="offer__icon" aria-hidden="true">
              <svg
                viewBox="0 0 24 24"
                width="18"
                height="18"
                fill="none"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
              >
                <path
                  d="M20.8 4.6a5.5 5.5 0 0 0-7.8 0L12 5.6l-1-1a5.5 5.5 0 1 0-7.8 7.8l1 1L12 21l7.8-7.8 1-1a5.5 5.5 0 0 0 0-7.8z"
                />
              </svg>
            </div>
            <div>
              <h3>Free delivery on orders ₹15+</h3>
              <p>No coupon required • Limited time</p>
            </div>
          </article>
          <article class="offer offer--warn">
            <div class="offer__icon" aria-hidden="true">★</div>
            <div>
              <h3>Flat 20% off on first order</h3>
              <p>Auto applied at checkout</p>
            </div>
          </article>
        </div>
      </section>

      <!-- ===================== STICKY CATEGORY NAV ===================== -->
		<nav class="catnav" aria-label="Menu categories">
			<div class="container">
				<div class="catnav__inner">

					<a href="#recommended" class="catnav__item is-active">Recommended</a>
					<a href="#chef" class="catnav__item">Chef's Special</a> <a
						href="#favorites" class="catnav__item">Customer Favorites</a> <a
						href="#most" class="catnav__item">Most Ordered</a> <a
						href="#starters" class="catnav__item">Starters</a> <a
						href="#mains" class="catnav__item">Main Course</a> <a
						href="#pizza" class="catnav__item">Pizza</a> <a href="#burgers"
						class="catnav__item">Burgers</a> <a href="#desserts"
						class="catnav__item">Desserts</a> <a href="#beverages"
						class="catnav__item">Beverages</a>

				</div>
			</div>
		</nav>

		<!-- ===================== CONTENT ===================== -->
      <div class="container layout">
        <div class="layout__main">
          <!-- Recommended -->
          <section class="menu" id="recommended">
            <header class="menu__head">
              <h2>Recommended for You</h2>
              <p>Handpicked bestsellers curated by Hungrify</p>
            </header>

            <div class="menu__grid">
              <!-- CARD -->
              <%
              	List<Menu> menuByRestaurantId = (List<Menu>)request.getAttribute("menuByRestaurantId");
            		  for(Menu menu : menuByRestaurantId) {
            	  %>
            			  <article class="card">
                          <div class="card__media">
                            <div class="card__img-placeholder">
							  <img alt="" src="<%=menu.getImageUrl() %>">
							</div>
                            <button class="wish" aria-label="Add to wishlist">
                              <svg
                                viewBox="0 0 24 24"
                                width="18"
                                height="18"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                              >
                                <path
                                  d="M20.8 4.6a5.5 5.5 0 0 0-7.8 0L12 5.6l-1-1a5.5 5.5 0 1 0-7.8 7.8l1 1L12 21l7.8-7.8 1-1a5.5 5.5 0 0 0 0-7.8z"
                                />
                              </svg>
                            </button>
                            <span class="badge badge--best">Bestseller</span>
                          </div>
                          <div class="card__body">
                            <div class="card__row">
                              <span class="veg" title="Vegetarian" aria-label="Vegetarian"
                                ><span></span
                              ></span>
                              <span class="card__cat"><%=restaurant.getCuisine() %></span>
                              <span class="card__spice" aria-label="Medium spice"
                                >🌶️🌶️</span
                              >
                            </div>
                            <h3 class="card__name"><%=menu.getItemName() %></h3>
                            <p class="card__desc">
                              <%=menu.getDescription() %>
                            </p>
                            <div class="card__meta">
                              <span class="chip chip--rating chip--sm">
                                <svg
                                  viewBox="0 0 24 24"
                                  width="12"
                                  height="12"
                                  fill="currentColor"
                                >
                                  <path
                                    d="M12 2l2.9 6.9L22 10l-5.5 4.8L18 22l-6-3.6L6 22l1.5-7.2L2 10l7.1-1.1z"
                                  />
                                </svg>
                                <%=restaurant.getRating() %>
                              </span>
                              <span class="chip chip--sm">⏱ <%=restaurant.getDeliveryTime() %></span>
                            </div>
                            <div class="card__foot">
									<div class="price">
										<span class="price__now">₹<%=menu.getPrice()%></span> <span
											class="price__old">₹<%=menu.getPrice() + 50%></span>
									</div>

									<form action="cartServlet" method="post" class="add-cart-form">

										<input type="hidden" name="menuId"
											value="<%=menu.getMenuId()%>">
										<input type="hidden"
											name="restaurantId" value="<%=menu.getRestaurantId()%>">
										<input type="hidden" name="quantity" value="1">
										<input type="hidden" name="action" value="add">

										<button type="submit" class="btn btn--primary btn--sm">
											Add +</button>

									</form>
								</div>
                          </div>
                        </article>
              <% 
            		  }
              %>
              

              <!-- CARD with quantity selector active -->
              <article class="card">
                <div class="card__media">
                  <div class="card__img-placeholder">Food Image</div>
                  <button
                    class="wish is-active"
                    aria-label="Remove from wishlist"
                  >
                    <svg
                      viewBox="0 0 24 24"
                      width="18"
                      height="18"
                      fill="currentColor"
                      stroke="currentColor"
                      stroke-width="2"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                    >
                      <path
                        d="M20.8 4.6a5.5 5.5 0 0 0-7.8 0L12 5.6l-1-1a5.5 5.5 0 1 0-7.8 7.8l1 1L12 21l7.8-7.8 1-1a5.5 5.5 0 0 0 0-7.8z"
                      />
                    </svg>
                  </button>
                  <span class="badge badge--rec">Recommended</span>
                </div>
                <div class="card__body">
                  <div class="card__row">
                    <span
                      class="veg veg--nonveg"
                      title="Non-vegetarian"
                      aria-label="Non-vegetarian"
                      ><span></span
                    ></span>
                    <span class="card__cat">Grill</span>
                    <span class="card__spice">🌶️🌶️🌶️</span>
                  </div>
                  <h3 class="card__name">Dish Name Placeholder</h3>
                  <p class="card__desc">
                    Slow-cooked, char-grilled and topped with a signature house
                    sauce for a smoky finish.
                  </p>
                  <div class="card__meta">
                    <span class="chip chip--rating chip--sm">
                      <svg
                        viewBox="0 0 24 24"
                        width="12"
                        height="12"
                        fill="currentColor"
                      >
                        <path
                          d="M12 2l2.9 6.9L22 10l-5.5 4.8L18 22l-6-3.6L6 22l1.5-7.2L2 10l7.1-1.1z"
                        />
                      </svg>
                      <%=restaurant.getRating() %>
                    </span>
                    <span class="chip chip--sm">⏱ 20 min</span>
                  </div>
                  <div class="card__foot">
                    <div class="price">
                      <span class="price__now">₹11.50</span>
                    </div>
                    <div class="qty" role="group" aria-label="Quantity">
                      <button aria-label="Decrease">−</button>
                      <span>2</span>
                      <button aria-label="Increase">+</button>
                    </div>
                  </div>
                </div>
              </article>

            </div>
          </section>

          <!-- Chef's Special -->
          <section class="menu" id="chef">
            <header class="menu__head">
              <h2>Chef's Special</h2>
              <p>Exclusive creations from the kitchen</p>
            </header>
            <div class="menu__grid">
              <article class="card">
                <div class="card__media">
                  <div class="card__img-placeholder">Food Image</div>
                  <button class="wish" aria-label="Wishlist">
                    <svg
                      viewBox="0 0 24 24"
                      width="18"
                      height="18"
                      fill="none"
                      stroke="currentColor"
                      stroke-width="2"
                    >
                      <path
                        d="M20.8 4.6a5.5 5.5 0 0 0-7.8 0L12 5.6l-1-1a5.5 5.5 0 1 0-7.8 7.8l1 1L12 21l7.8-7.8 1-1a5.5 5.5 0 0 0 0-7.8z"
                      />
                    </svg>
                  </button>
                </div>
                <div class="card__body">
                  <div class="card__row">
                    <span class="veg"><span></span></span
                    ><span class="card__cat">Signature</span>
                  </div>
                  <h3 class="card__name">Dish Name Placeholder</h3>
                  <p class="card__desc">
                    Chef-curated plate with seasonal ingredients and a signature
                    reduction.
                  </p>
                  <div class="card__foot">
                    <div class="price">
                      <span class="price__now">₹14.00</span>
                    </div>
                    <button class="btn btn--primary btn--sm">Add +</button>
                  </div>
                </div>
              </article>
              <article class="card">
                <div class="card__media">
                  <div class="card__img-placeholder">Food Image</div>
                  <button class="wish" aria-label="Wishlist">
                    <svg
                      viewBox="0 0 24 24"
                      width="18"
                      height="18"
                      fill="none"
                      stroke="currentColor"
                      stroke-width="2"
                    >
                      <path
                        d="M20.8 4.6a5.5 5.5 0 0 0-7.8 0L12 5.6l-1-1a5.5 5.5 0 1 0-7.8 7.8l1 1L12 21l7.8-7.8 1-1a5.5 5.5 0 0 0 0-7.8z"
                      />
                    </svg>
                  </button>
                </div>
                <div class="card__body">
                  <div class="card__row">
                    <span class="veg veg--nonveg"><span></span></span
                    ><span class="card__cat">Signature</span>
                  </div>
                  <h3 class="card__name">Dish Name Placeholder</h3>
                  <p class="card__desc">
                    A hearty, warmly spiced plate that pairs perfectly with our
                    house bread.
                  </p>
                  <div class="card__foot">
                    <div class="price">
                      <span class="price__now">₹16.50</span
                      ><span class="price__old">₹19.00</span>
                    </div>
                    <button class="btn btn--primary btn--sm">Add +</button>
                  </div>
                </div>
              </article>
            </div>
          </section>

          <!-- Customer Favorites -->
          <section class="menu" id="favorites">
            <header class="menu__head">
              <h2>Customer Favorites</h2>
              <p>Loved by thousands this month</p>
            </header>
            <div class="menu__grid">
              <article class="card">
                <div class="card__media">
                  <div class="card__img-placeholder">Food Image</div>
                  <span class="badge badge--best">Bestseller</span>
                </div>
                <div class="card__body">
                  <div class="card__row">
                    <span class="veg"><span></span></span
                    ><span class="card__cat">Pasta</span>
                  </div>
                  <h3 class="card__name">Dish Name Placeholder</h3>
                  <p class="card__desc">
                    Creamy, comforting and served piping hot with fresh herbs.
                  </p>
                  <div class="card__foot">
                    <div class="price">
                      <span class="price__now">₹10.25</span>
                    </div>
                    <button class="btn btn--primary btn--sm">Add +</button>
                  </div>
                </div>
              </article>
              <article class="card">
                <div class="card__media">
                  <div class="card__img-placeholder">Food Image</div>
                </div>
                <div class="card__body">
                  <div class="card__row">
                    <span class="veg veg--nonveg"><span></span></span
                    ><span class="card__cat">Burgers</span>
                  </div>
                  <h3 class="card__name">Dish Name Placeholder</h3>
                  <p class="card__desc">
                    Juicy patty, melted cheese and toasted brioche — a crowd
                    favourite.
                  </p>
                  <div class="card__foot">
                    <div class="price">
                      <span class="price__now">₹7.99</span>
                    </div>
                    <button class="btn btn--primary btn--sm">Add +</button>
                  </div>
                </div>
              </article>
            </div>
          </section>

          <!-- Most Ordered -->
          <section class="menu" id="most">
            <header class="menu__head">
              <h2>Most Ordered</h2>
              <p>Trending picks in your area</p>
            </header>
            <div class="menu__grid">
              <article class="card">
                <div class="card__media">
                  <div class="card__img-placeholder">Food Image</div>
                </div>
                <div class="card__body">
                  <div class="card__row">
                    <span class="veg"><span></span></span
                    ><span class="card__cat">Snacks</span>
                  </div>
                  <h3 class="card__name">Dish Name Placeholder</h3>
                  <p class="card__desc">
                    Crispy, golden and served with a tangy dipping sauce.
                  </p>
                  <div class="card__foot">
                    <div class="price">
                      <span class="price__now">₹5.50</span>
                    </div>
                    <button class="btn btn--primary btn--sm">Add +</button>
                  </div>
                </div>
              </article>
              <article class="card">
                <div class="card__media">
                  <div class="card__img-placeholder">Food Image</div>
                </div>
                <div class="card__body">
                  <div class="card__row">
                    <span class="veg"><span></span></span
                    ><span class="card__cat">Rice Bowls</span>
                  </div>
                  <h3 class="card__name">Dish Name Placeholder</h3>
                  <p class="card__desc">
                    Wholesome grain bowl with fresh vegetables and house
                    dressing.
                  </p>
                  <div class="card__foot">
                    <div class="price">
                      <span class="price__now">₹9.00</span>
                    </div>
                    <button class="btn btn--primary btn--sm">Add +</button>
                  </div>
                </div>
              </article>
            </div>
          </section>

          <!-- Frequently Ordered Together -->
          <section class="menu" id="fot">
            <header class="menu__head">
              <h2>Frequently Ordered Together</h2>
              <p>Complete your meal with these combos</p>
            </header>
            <div class="combo">
              <div class="combo__item">
                <div class="card__img-placeholder">Item</div>
                <p>Dish Name</p>
                <span>₹4.50</span>
              </div>
              <span class="combo__plus">+</span>
              <div class="combo__item">
                <div class="card__img-placeholder">Item</div>
                <p>Dish Name</p>
                <span>₹8.99</span>
              </div>
              <span class="combo__plus">+</span>
              <div class="combo__item">
                <div class="card__img-placeholder">Item</div>
                <p>Dish Name</p>
                <span>₹2.99</span>
              </div>
              <div class="combo__cta">
                <p class="combo__total">Total <strong>₹16.48</strong></p>
                <button class="btn btn--primary">Add Combo</button>
              </div>
            </div>
          </section>

          <!-- Dynamic categories -->
          <section class="menu" id="starters">
            <header class="menu__head">
              <h2>Starters</h2>
              <p>12 items</p>
            </header>
            <div class="menu__grid">
              <article class="card">
                <div class="card__media">
                  <div class="card__img-placeholder">Food Image</div>
                </div>
                <div class="card__body">
                  <div class="card__row">
                    <span class="veg"><span></span></span
                    ><span class="card__cat">Starters</span>
                  </div>
                  <h3 class="card__name">Dish Name Placeholder</h3>
                  <p class="card__desc">Light bites to kick off your meal.</p>
                  <div class="card__foot">
                    <div class="price">
                      <span class="price__now">₹6.00</span>
                    </div>
                    <button class="btn btn--primary btn--sm">Add +</button>
                  </div>
                </div>
              </article>
              <article class="card">
                <div class="card__media">
                  <div class="card__img-placeholder">Food Image</div>
                </div>
                <div class="card__body">
                  <div class="card__row">
                    <span class="veg veg--nonveg"><span></span></span
                    ><span class="card__cat">Starters</span>
                  </div>
                  <h3 class="card__name">Dish Name Placeholder</h3>
                  <p class="card__desc">Marinated and grilled to perfection.</p>
                  <div class="card__foot">
                    <div class="price">
                      <span class="price__now">₹7.50</span>
                    </div>
                    <button class="btn btn--primary btn--sm">Add +</button>
                  </div>
                </div>
              </article>
            </div>
          </section>

          <section class="menu" id="mains">
            <header class="menu__head">
              <h2>Main Course</h2>
              <p>18 items</p>
            </header>
            <div class="menu__grid">
              <article class="card">
                <div class="card__media">
                  <div class="card__img-placeholder">Food Image</div>
                </div>
                <div class="card__body">
                  <div class="card__row">
                    <span class="veg"><span></span></span
                    ><span class="card__cat">Mains</span>
                  </div>
                  <h3 class="card__name">Dish Name Placeholder</h3>
                  <p class="card__desc">Rich, hearty and full of flavour.</p>
                  <div class="card__foot">
                    <div class="price">
                      <span class="price__now">₹12.00</span>
                    </div>
                    <button class="btn btn--primary btn--sm">Add +</button>
                  </div>
                </div>
              </article>
            </div>
          </section>

          <!-- Empty category state -->
          <section class="menu" id="desserts">
            <header class="menu__head"><h2>Desserts</h2></header>
            <div class="empty">
              <div class="empty__icon">🍰</div>
              <h3>No items in this category yet</h3>
              <p>We're preparing something sweet. Please check back soon.</p>
            </div>
          </section>

          <!-- Restaurant closed state (example) -->
          <section class="menu" id="closed-example">
            <div class="empty empty--warn">
              <div class="empty__icon">⏰</div>
              <h3>Restaurant is currently closed</h3>
              <p>Opens tomorrow at 11:00 AM. You can still browse the menu.</p>
            </div>
          </section>
        </div>

        <!-- ===================== DESKTOP CART ===================== -->
<!--         <aside class="cart" aria-label="Cart summary"> -->
<!--           <div class="cart__head"> -->
<!--             <h3>Your Cart</h3> -->
<!--             <span class="cart__count">3 items</span> -->
<!--           </div> -->
<!--           <ul class="cart__list"> -->
<!--             <li> -->
<!--               <span class="veg"><span></span></span> -->
<!--               <div> -->
<!--                 <p class="cart__name">Dish Name Placeholder</p> -->
<!--                 <div class="qty qty--sm"> -->
<!--                   <button>−</button><span>1</span><button>+</button> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <span class="cart__price">₹8.99</span> -->
<!--             </li> -->
<!--             <li> -->
<!--               <span class="veg veg--nonveg"><span></span></span> -->
<!--               <div> -->
<!--                 <p class="cart__name">Dish Name Placeholder</p> -->
<!--                 <div class="qty qty--sm"> -->
<!--                   <button>−</button><span>2</span><button>+</button> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <span class="cart__price">₹23.00</span> -->
<!--             </li> -->
<!--           </ul> -->
<!--           <div class="cart__totals"> -->
<!--             <div><span>Subtotal</span><span>₹31.99</span></div> -->
<!--             <div><span>Delivery</span><span>₹2.99</span></div> -->
<!--             <div class="cart__grand"><span>Total</span><span>₹34.98</span></div> -->
<!--           </div> -->
<!--           <button class="btn btn--primary btn--block">Checkout</button> -->
<!--           <p class="cart__note">Free delivery on orders above ₹15</p> -->
<!--         </aside> -->


			<%
			Cart cart = (Cart) session.getAttribute("cart");
			Integer restaurantId = (Integer)session.getAttribute("restaurantId");

			double subtotal = 0;
			int totalItems = 0;
			%>

			<aside class="cart" aria-label="Cart summary">
				<div class="cart__head">
					<h3>Your Cart</h3>
					<span class="cart__count"> <%=(cart != null) ? cart.getItems().size() : 0%>
						items
					</span>
				</div>
				<ul class="cart__list">
				
					<%
					if (cart != null && !cart.getItems().isEmpty()) {
						for (CartItems item : cart.getItems().values()) {
							double total = item.getPrice() * item.getQuantity();
							subtotal += total;
							totalItems += item.getQuantity();
					%>

					<li><span class="veg"> <span></span>
					</span>
						<div>
							<p class="cart__name">
								<%=item.getName()%>
							</p>
							<div class="qty qty--sm">
								<button disabled>−</button>
								<span><%=item.getQuantity()%></span>
								<button disabled>+</button>
							</div>
						</div> <span class="cart__price"> ₹<%=total%>
					</span></li>
					<%
					}
					} else {
					%>
					<li>
						<p class="cart__name">Your cart is empty</p>
					</li>
					<%
					}
					%>
				</ul>
				<div class="cart__totals">
					<div>
						<span>Subtotal</span> <span>₹<%=subtotal%></span>
					</div>
					<div>
						<span>Delivery</span> <span>FREE</span>
					</div>
					<div class="cart__grand">
						<span>Total</span> <span>₹<%=subtotal%></span>
					</div>
				</div>
				<form action="checkout.jsp" method="get">
					<button class="btn btn--primary btn--block" type="submit">
						Checkout</button>
				</form>
				<p class="cart__note">Free delivery on all orders</p>
			</aside>
		</div>

      <!-- ===================== MOBILE STICKY CART ===================== -->
      <div class="mcart" role="region" aria-label="Cart">
        <div>
          <p class="mcart__count">3 items added</p>
          <p class="mcart__total">₹34.98 <span>· incl. delivery</span></p>
        </div>
        <button class="btn btn--primary">View Cart →</button>
      </div>
    </main>

    <!-- ===================== FOOTER (existing) ===================== -->
    <footer class="footer">
      <div class="container footer__inner">
        <div>
          <a href="#" class="nav__logo" aria-label="Hungrify home">
          <span class="nav__logo-mark" aria-hidden="true">
          	<img class="menu-logo" alt="" src="images/logo/hungrify-logo-icon.png">
          </span>
          <span class="brand-name">
    				<span class="brand-dark">Hungr</span><span class="brand-orange">ify</span>
  			</span>
        </a>
          <p class="footer__tag">Fast delivery. Fresh food. Happy people.</p>
        </div>
        <div class="footer__cols">
          <div>
            <h4>Company</h4>
            <a href="#">About</a><a href="#">Careers</a><a href="#">Blog</a>
          </div>
          <div>
            <h4>For You</h4>
            <a href="#">Restaurants</a><a href="#">Offers</a
            ><a href="#">Gift Cards</a>
          </div>
          <div>
            <h4>Support</h4>
            <a href="#">Help Center</a><a href="#">Contact</a
            ><a href="#">Privacy</a>
          </div>
        </div>
      </div>
      <div class="footer__base">© 2026 Hungrify. All rights reserved.</div>
    </footer>

    <script>
      window.HungrifyTheme && window.HungrifyTheme.initThemeToggle();
    </script>
  </body>
</html>
