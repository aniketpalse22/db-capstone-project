# Little Lemon Booking System

This project involves the development of a Restaurant Management Database called `little_lemon_db`. The system is designed to manage various aspects of restaurant operations, including menu management, table bookings, employee records, and sales reports. 

## Project Overview

The Little Lemon Booking System incorporates a comprehensive database structure to efficiently handle restaurant operations and generate valuable insights. The project includes the following key components:

### 1. ER Diagram (LittleLemonDB.png) 
The Entity-Relationship (ER) diagram showcases the database design, highlighting the relationships between tables such as `Menu`, `MenuItems`, `Orders`, `OrderDeliveryStatus`, `CustomerDetails`, `Booking`, `Staff`.

![ER Diagram](Little%20Lemon%20Booking%20System/LittleLemonDB.png)

### 2. Database Design and Forward Engineering (LittleLemonDB.sql)
Designed and implemented in MySQL, the database consists of tables for:
- Menu items and menus
- Bookings, orders and OrderDeliveryStatus
- CustomerDetails and Staff  

**Forward Engineering Feature**: The MySQL Workbench Forward Engineering feature was used to generate the database schema file.  

## 3. Sales Report Using SQL Query (SalesReportQuery.sql) 

This section demonstrates generating insightful sales reports and performing database operations using SQL queries. Below are the key tasks completed:  

- **Task 1**: Created a view (`OrdersView`) to focus on order details for quantities greater than 2.  
- **Task 2**: Used JOINs to extract customer and order details for high-value orders exceeding $150.  
- **Task 3**: Identified popular menu items with more than two orders using subqueries.  
- **Task 4**: Created a stored procedure to find the maximum quantity ordered.  
- **Task 5**: Developed a prepared statement to fetch order details by `CustomerID`.  
- **Task 6**: Created a stored procedure to cancel orders by `OrderID`.  

## 4. Table Booking System Using SQL Query (TableBookingSystemQuery.sql)

A system to manage table bookings, ensuring efficient allocation and handling cancellations. Key tasks include:  

- **Task 1**: Inserted initial booking records into the `Bookings` table.  
- **Task 2**: Created a stored procedure `CheckBooking` to verify table availability.  
- **Task 3**: Developed a stored procedure `AddValidBooking` to ensure valid bookings using transactions.  
- **Task 4**: Added a stored procedure `AddBooking` for creating new bookings.  
- **Task 5**: Created a stored procedure `UpdateBooking` for modifying existing bookings.  
- **Task 6**: Designed a stored procedure `CancelBooking` to remove bookings.

### 5. Visualization Using Tableau
Using Tableau, insightful visualizations were created to analyze sales and profit trends. This section includes five key charts and a dashboard:

**Charts**:
**1. Customer Sales** 
![Customer Sales](Little%20Lemon%20Booking%20System/01-Customer%20Sales.png)

**2. Profit Sales** 
![Profit Sales](Little%20Lemon%20Booking%20System/02-Profit%20Chart.png)  

**3. Sales Bubble Chart**
![Sales Bubble Chart](Little%20Lemon%20Booking%20System/03-Sales%20Bubble%20Chart.png)  

**4. Cuisine Sales and Profit**
![Cuisine Sales and Profit](Little%20Lemon%20Booking%20System/04-Cuisine%20Sales%20and%20Profits.png)  

**5. Customer Sales and Profit Dashboard** 
![Customer Sales and Profit Dashboard](Little%20Lemon%20Booking%20System/05-Customer%20Sales%20Dashboard.png)

### 6. Database Modeling (LittleLemon.ipynb)
A detailed walkthrough of the database design process, including schema design and relationship modeling, implemented in Python using Jupyter Notebook.  

## Tools and Technologies  
- **Database**: MySQL (with MySQL Workbench)  
- **Visualization**: Tableau  
- **Version Control**: Git  
- **Programming Language**: Python for data analytics and integration  

## Instructions for Use
1. Import the little_lemon_db schema using the provided file (`littlelemondb.sql`) into your MySQL Workbench.
2. Use the provided SQL scripts (`SalesReportQuery.sql` and `TablesBookingSystem.sql`) for sales reporting and table booking operations.
3. View Tableau visualizations (`Sales_Profit_Dashboard.twb`) for sales and profit insights.
4. Explore the database modeling process using the provided Jupyter Notebook (`LittleLemonDC.ipynb`).

## Acknowledgments
This project is a part of the Meta Database Engineer Professional Certificate and demonstrates key concepts in database design, management, and visualization.
