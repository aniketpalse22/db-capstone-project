# View, Joins, Subquery, Stored Procedure, Prepared Statements.

/*
Task 1

In the first task, Little Lemon need you to create a virtual table called OrdersView that focuses on OrderID, Quantity and Cost columns within the Orders table for all orders with a quantity greater than 2. 

Here’s some guidance around completing this task: 

Use a CREATE VIEW statement.

Extract the order id, quantity and cost data from the Orders table.

Filter data from the orders table based on orders with a quantity greater than 2. */


CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, TotalCost
FROM Orders
WHERE Quantity > 2;

#Output:-
Select * from OrdersView;
#--------#--------#--------#--------#--------#--------#--------#--------#--------#--------
/* 
Task 2 :-
For your second task, Little Lemon need information from four tables on all customers with orders that cost more than $150. Extract the required information from each of the following tables by using the relevant JOIN clause: 

Customers table: The customer id and full name.

Orders table: The order id and cost.

Menus table: The menus name.

MenusItems table: course name and starter name.

The result set should be sorted by the lowest cost amount.*/

SELECT 
    c.CustomerID, 
    c.CustomerName as FullName, 
    o.OrderID, 
    o.TotalCost as Cost, 
    m.ItemName, 
    mi.CourseName, 
    mi.StarterName
FROM 
    CustomerDetails c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
JOIN 
    Menu m ON o.MenuItemID = m.MenuItemID
JOIN 
    MenuItems mi ON m.MenuItemID = mi.MenuItemID
WHERE 
    o.TotalCost > 150
ORDER BY 
    o.TotalCost ASC;

#--------#--------#--------#--------#--------#--------#--------#--------#--------#--------
/*
Task 3

For the third and final task, Little Lemon need you to find all menu items for which more than 2 orders have been placed. You can carry out this task by creating a subquery that lists the menu names from the menus table for any order quantity with more than 2.

Here’s some guidance around completing this task: 

Use the ANY operator in a subquery

The outer query should be used to select the menu name from the menus table.

The inner query should check if any item quantity in the order table is more than 2. 
*/
SELECT m.ItemName as MenuName
FROM Menu m
WHERE m.MenuItemID = ANY (
    SELECT o.MenuItemID
    FROM Orders o
    WHERE o.Quantity > 2
    GROUP BY o.MenuItemID
    HAVING COUNT(o.OrderID) > 2
);
#--------#--------#--------#--------#--------#--------#--------#--------#--------#--------
/* 
Task 4:

In this first task, Little Lemon need you to create a procedure that displays the maximum ordered quantity in the Orders table. 

Creating this procedure will allow Little Lemon to reuse the logic implemented in the procedure easily without retyping the same code over again and again to check the maximum quantity. 
*/

DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantity
    FROM Orders;
END //

DELIMITER ;

CALL GetMaxQuantity();
#--------#--------#--------#--------#--------#--------#--------#--------#--------#--------
/* 
Task 2

In the second task, Little Lemon need you to help them to create a prepared statement called GetOrderDetail. This prepared statement will help to reduce the parsing time of queries. It will also help to secure the database from SQL injections.

The prepared statement should accept one input argument, the CustomerID value, from a variable. 

The statement should return the order id, the quantity and the order cost from the Orders table. 

Once you create the prepared statement, you can create a variable called id and assign it value of 1. */

DELIMITER //

PREPARE GetOrderDetail FROM
    'SELECT OrderID, Quantity, TotalCost
     FROM Orders
     WHERE CustomerID = ?';

DELIMITER ;

SET @id = 1;
EXECUTE GetOrderDetail USING @id;
#--------#--------#--------#--------#--------#--------#--------#--------#--------#--------
/* 
Task 3
Your third and final task is to create a stored procedure called CancelOrder. Little Lemon want to use this stored procedure to delete an 
order record based on the user input of the order id.

Creating this procedure will allow Little Lemon to cancel any order by specifying the order id value in the procedure parameter without 
typing the entire SQL delete statement.    */

DELIMITER //

CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
    DELETE FROM Orders
    WHERE OrderID = order_id;
    
    -- Display the message indicating the order has been cancelled
    SELECT CONCAT('Order ', order_id, ' is cancelled') AS OrderStatus;
END //

DELIMITER ;

CALL CancelOrder(5);
