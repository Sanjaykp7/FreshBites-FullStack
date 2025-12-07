🍽️ FreshBites – Full Stack Food Ordering Web Application

A fully functional Java Full Stack Food Ordering Web Application built using JSP, Servlets, JDBC, MySQL, and DAO Design Pattern, deployed on Apache Tomcat.
This project simulates a real-world online food delivery workflow including menu browsing, cart management, ordering, login/registration, and checkout.

🚀 Tech Stack Used
Backend

Java JEE (Servlets & JSP)
JDBC (Database Connectivity)
DAO Design Pattern
MySQL Database
Apache Tomcat Server 10
Frontend
HTML5, CSS
JavaScript
Responsive UI with custom styling
Font Awesome Icons

📌 Project Features

✔️ User Features
User Registration & Login
Session-based User Authentication
View restaurants & menu
Add items to cart
Increase / decrease quantity
Remove items from cart

Checkout with:
Delivery Address
Payment Method
Order Summary & confirmation

✔️ Admin-Level Backend Logic
DAO Design Pattern for scalable database access
Tight JDBC integration for CRUD operations
Proper servlet routing for menu, cart, order, login, register

📂 Project Structure
FreshBites-FullStack/
│
├── src/main/java/
│   ├── com.tap.dao/                     # DAO Interfaces
│   ├── com.tap.daoimplementation/        # DAO Implementations (JDBC)
│   ├── com.tap.model/                    # POJO Models (User, Restaurant, Menu, Cart...)
│   ├── com.tap.servlets/                 # JEE Servlets
│   └── com.tap.util/                     # DB Connection Utility
│
├── src/main/webapp/
│   ├── home.jsp
│   ├── menu.jsp
│   ├── cart.jsp
│   ├── checkOut.jsp
│   ├── orderConfirmation.jsp
│   ├── Login.jsp
│   ├── Register.jsp
│   ├── Profile.jsp
│   └── WEB-INF/
│       ├── web.xml
│       └── lib/mysql-connector-j.jar
│
└── README.md

🗄️ Database Schema (MySQL)
user Table:
userId (PK) | name | email | password | phone | address | role | createdDate | lastLoginDate

restaurant Table:
restaurantId (PK) | name | email | phone | address | city | pincode | ratings | isActive | deliveryTime | image

menu Table:
itemId (PK) | name | description | price | image | restaurantId (FK)

orders & order_items:
Handles order creation and item-level tracking.

🛠️ How to Run the Project
1️⃣ Import Project into Eclipse
File → Import → Existing Maven/Java Project → Select Folder

2️⃣ Create MySQL Database
Run the SQL schema and insert sample data.

3️⃣ Configure Database
Update DB credentials inside:
com.tap.util.DataBaseConnection.java

4️⃣ Deploy on Tomcat
Run on Server → Apache Tomcat 10

5️⃣ Open in Browser
http://localhost:8080/FullStack-Project/home

🎯 Key Learning Outcomes
Implemented Java Servlet-based MVC architecture
Used JDBC + DAO Pattern for clean database access
Created a fully responsive UI with JSP & CSS
Applied session management for user login & cart state
Designed complete end-to-end order workflow
