# Hungrify — Food Delivery Web Application

[![Java](https://img.shields.io/badge/Java-21-orange.svg?logo=openjdk&logoColor=white)](https://www.oracle.com/java/)
[![Jakarta EE](https://img.shields.io/badge/Jakarta%20EE-Servlets%20%26%20JSP-red.svg)](https://jakarta.ee/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0%20%2F%209.2-blue.svg?logo=mysql&logoColor=white)](https://www.mysql.com/)
[![BCrypt](https://img.shields.io/badge/BCrypt-Password%20Hashing-green.svg)](https://www.mindrot.org/projects/jBCrypt/)
[![Architecture](https://img.shields.io/badge/Architecture-MVC%20Pattern-lightgrey.svg)](#architecture--mvc-pattern)

> A full-stack food ordering and delivery web application built with **Java (Jakarta EE Servlets & JSP)**, **JDBC**, and **MySQL**, adhering strictly to the **Model-View-Controller (MVC)** architectural pattern. Features role-based access, BCrypt-secured authentication, session-managed shopping carts, restaurant catalog browsing, and end-to-end checkout.

---

## 🎯 Key Features & Functional Flow

- **Secure Authentication**: User registration and login utilizing **BCrypt password hashing** (`jBCrypt-0.4`) with salt rounds to prevent plain-text credential leaks.
- **Session-Based Cart Management**: Real-time shopping cart operations (add item, update quantity, remove item, subtotal calculations) persisted securely within the `HttpSession`.
- **Restaurant & Menu Catalog**: Dynamic restaurant listing and restaurant-wise menu loading via parameterized JDBC queries.
- **Delivery Address Management**: Multi-address management enabling users to store, edit, and select preferred delivery destinations.
- **Order Processing & History**: Structured checkout converting active cart items into immutable `Order` and `OrderItem` records with timestamp tracking and status updates.

---

## 🏛️ Architecture & MVC Pattern

Hungrify is architected following the classic **Model-View-Controller (MVC)** separation of concerns:

```
Hungrify/src/main/java/com/hungrify/
├── model/           # [M] Domain Entities (User, Restaurant, Menu, Cart, CartItems, Order, OrderItem, Address)
├── DAO/             # Data Access Object Interfaces (UserDAO, RestaurantDAO, MenuDAO, OrderDAO, etc.)
├── DAOImpl/         # Concrete JDBC implementations executing prepared SQL queries
├── servlets/        # [C] Controller Servlets handling HTTP GET/POST, sessions, and request dispatching
└── utility/         # Database connection singleton (DBConnection.java)
Hungrify/src/main/webapp/
├── *.jsp            # [V] Dynamic Views (restaurant.jsp, menu.jsp, cart.jsp, checkout.jsp, profile.jsp)
├── common/          # Reusable view components (navbar.jsp, footer.jsp, short-nav.jsp)
├── css/             # Responsive stylesheets
├── js/              # Client-side validation, theme management, and interaction scripts
└── WEB-INF/         # Deployment descriptor (web.xml) and library JARs
```

### Flow of a Request:
1. **User Request**: Browser sends an HTTP request to a Servlet mapping (e.g., `/restaurant`, `/menu`, `/cart`, `/checkout`).
2. **Controller Processing**: The Servlet validates parameters, inspects user session (`HttpSession`), and delegates data retrieval to the corresponding `DAOImpl`.
3. **Model & Database Layer**: `DAOImpl` executes parameterized SQL queries against MySQL via `DBConnection`, populating Model POJOs.
4. **View Rendering**: Servlet attaches data to `HttpServletRequest` attributes and forwards (`RequestDispatcher.forward()`) to the targeted JSP view for server-side HTML rendering.

---

## 🛠️ Technology Stack & Dependencies

- **Language / Platform**: Java 21 (Jakarta EE 10 / 5.0 web specifications)
- **Servlet Container**: Apache Tomcat 10.1+
- **Persistence & Driver**: MySQL Connector/J (`mysql-connector-j-9.2.0.jar`)
- **Security**: jBCrypt (`jbcrypt-0.4.jar`)
- **Frontend / Views**: JSP (JavaServer Pages), JSTL, HTML5, CSS3, JavaScript (ES6)

---

## 🗄️ Database Schema & Entities

The application manages 6 core relational entities:

1. **`users`**: `userId` (PK), `name`, `email` (Unique), `password` (BCrypt hash), `address`, `role` (`Customer` / `Admin`), `createdDate`
2. **`restaurants`**: `restaurantId` (PK), `name`, `cuisineType`, `deliveryTime`, `address`, `rating`, `isActive`, `imagePath`
3. **`menu`**: `menuId` (PK), `restaurantId` (FK), `itemName`, `description`, `price`, `ratings`, `isAvailable`, `imagePath`
4. **`orders`**: `orderId` (PK), `userId` (FK), `restaurantId` (FK), `totalAmount`, `status`, `paymentMethod`, `orderDate`
5. **`order_items`**: `orderItemId` (PK), `orderId` (FK), `menuId` (FK), `quantity`, `itemTotal`
6. **`user_addresses`**: `addressId` (PK), `userId` (FK), `streetAddress`, `city`, `state`, `postalCode`

---

## ⚙️ Setup & Deployment Instructions

### Prerequisites
- **JDK 21** installed and configured in your `JAVA_HOME` path.
- **Apache Tomcat 10.1+** installed (Tomcat 10+ is required for `jakarta.*` namespace compatibility).
- **MySQL Server 8.0+** running locally.
- **Eclipse IDE for Enterprise Java and Web Developers** (or IntelliJ IDEA Ultimate).

### Step 1: Database Setup
1. Log into your MySQL instance:
   ```bash
   mysql -u root -p
   ```
2. Create the database:
   ```sql
   CREATE DATABASE hungrify CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```
3. Update database credentials in `com.hungrify.utility.DBConnection.java`:
   ```java
   private static final String URL = "jdbc:mysql://localhost:3306/hungrify";
   private static final String USERNAME = "YOUR_MYSQL_USERNAME";
   private static final String PASSWORD = "YOUR_MYSQL_PASSWORD";
   ```

### Step 2: Import & Run in Eclipse
1. Open Eclipse IDE.
2. Select **File** -> **Import** -> **Existing Projects into Workspace**.
3. Choose the `Hungrify` root directory.
4. Right-click the project -> **Properties** -> **Targeted Runtimes** -> Ensure **Apache Tomcat v10.1** is selected.
5. Ensure the external JARs in `WEB-INF/lib/` (`mysql-connector-j-9.2.0.jar` and `jbcrypt-0.4.jar`) are included on the build path.
6. Right-click project -> **Run As** -> **Run on Server** -> Select Tomcat 10.1.
7. Access the application in your browser at: `http://localhost:8080/Hungrify/restaurant`.

---

## 🌐 Servlet URL Mappings

| Servlet | Mapping | Description |
|:---|:---|:---|
| `RestaurantServlet` | `/restaurant` | Default welcome view; lists available restaurants |
| `MenuServlet` | `/menu` | Loads restaurant-specific food items |
| `CartServlet` | `/cart` | Handles session cart mutations (add, update, delete) |
| `LoginServlet` | `/login` | Authenticates users and initiates session |
| `RegisterServlet` | `/register` | Validates & hashes password for new accounts |
| `LogoutServlet` | `/logout` | Invalidates user session and redirects |
| `CheckoutServlet` | `/checkout` | Manages final order placement & validation |
| `OrderHistoryServlet` | `/order-history` | Displays user's past orders |
| `ProfileServlet` | `/profile` | Shows user profile and linked addresses |

---

## 👤 Author
- **Nezamul Haque**
- GitHub: [@Mudassir017](https://github.com/Mudassir017)
- LinkedIn: [nezamul-haque](https://www.linkedin.com/in/nezamul-haque)
- Portfolio: [nezamul-portfolio.vercel.app](https://nezamul-portfolio.vercel.app/)
