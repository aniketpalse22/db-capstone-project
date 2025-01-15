# Insert, Stored Procedure
/* 
Task 1

Little Lemon wants to populate the Bookings table of their database with some records of data. Your first task is to replicate the list of records in the following table by adding them to the Little Lemon booking table. 

You can use simple INSERT statements to complete this task.   */
-- Insert records into the Bookings table

INSERT INTO Booking(BookingID, BookingDate, TableNumber, CustomerID)
VALUES 
(1, '2022-10-10', 5, 1),
(2, '2022-11-12', 3, 3),
(3, '2022-10-11', 2, 2),
(4, '2022-10-13', 2, 1);

Select * from Booking;

#--------#--------#--------#--------#--------#--------#--------#--------#--------#--------
/* 
Task 2

For your second task, Little Lemon need you to create a stored procedure called CheckBooking to check whether a table in the 
restaurant is already booked. Creating this procedure helps to minimize the effort involved in repeatedly coding the same SQL statements.

The procedure should have two input parameters in the form of booking date and table number. You can also create a variable in the 
procedure to check the status of each table.  */

DELIMITER $$

CREATE PROCEDURE CheckBooking(IN input_booking_date DATE, IN input_table_number INT)
BEGIN
    -- Declare a variable to store the result of the query
    DECLARE table_status INT;

    -- Check if the table is already booked for the given date
    SELECT COUNT(*) INTO table_status
    FROM Booking
    WHERE BookingDate = input_booking_date AND TableNumber = input_table_number;

    -- Output message with table number and status
    IF table_status > 0 THEN
        SELECT CONCAT('Table ', input_table_number, ' is already booked') AS Status;
    ELSE
        SELECT CONCAT('Table ', input_table_number, ' is available for booking') AS Status;
    END IF;
END $$

DELIMITER ;

call CheckBooking("2022-11-12", 3);
#--------#--------#--------#--------#--------#--------#--------#--------#--------#--------
/* 
Task 3

For your third and final task, Little Lemon need to verify a booking, and decline any reservations for tables that are already booked under another name. 

Since integrity is not optional, Little Lemon need to ensure that every booking attempt includes these verification and decline steps. However, implementing these steps requires a stored procedure and a transaction. 

To implement these steps, you need to create a new procedure called AddValidBooking. This procedure must use a transaction statement to perform a rollback if a customer reserves a table that’s already booked under another name.  

Use the following guidelines to complete this task:

The procedure should include two input parameters in the form of booking date and table number.

It also requires at least one variable and should begin with a START TRANSACTION statement.

Your INSERT statement must add a new booking record using the input parameter's values.

Use an IF ELSE statement to check if a table is already booked on the given date. 

If the table is already booked, then rollback the transaction. If the table is available, then commit the transaction. 
*/
DELIMITER $$

CREATE PROCEDURE AddValidBooking(
    IN input_booking_date DATE, 
    IN input_table_number INT, 
    IN input_booking_id INT)
BEGIN
    -- Declare a variable to check the booking status
    DECLARE table_status INT;

    -- Start the transaction
    START TRANSACTION;

    -- Check if the table is already booked for the given date
    SELECT COUNT(*) INTO table_status
    FROM Bookings
    WHERE BookingDate = input_booking_date AND TableNumber = input_table_number;

    -- If the table is already booked, rollback the transaction
    IF table_status > 0 THEN
        -- Rollback the transaction to decline the booking
        ROLLBACK;
        SELECT CONCAT('Table ', input_table_number, ' is already booked - booking cancelled') AS Status;
    ELSE
        -- If the table is available, insert the new booking (with manually provided BookingID)
        INSERT INTO Bookings (BookingID, BookingDate, TableNumber)
        VALUES (input_booking_id, input_booking_date, input_table_number);

        -- Commit the transaction to save the booking
        COMMIT;
        SELECT CONCAT('Table ', input_table_number, ' has been successfully booked') AS Status;
    END IF;
END $$

DELIMITER ;

CALL AddValidBooking(101,"2022-12-17", 6);
#--------#--------#--------#--------#--------#--------#--------#--------#--------#--------
/*
Task 4

In this first task you need to create a new procedure called AddBooking to add a new table booking record.

The procedure should include four input parameters in the form of the following bookings parameters:

booking id, 

customer id, 

booking date,

and table number.
*/
DELIMITER $$

CREATE PROCEDURE AddBooking(
    IN input_booking_id INT, 
    IN input_customer_id INT, 
    IN input_booking_date DATE, 
    IN input_table_number INT)
BEGIN
    -- Insert a new booking record into the Bookings table
    INSERT INTO Booking (BookingID, CustomerID, BookingDate, TableNumber)
    VALUES (input_booking_id, input_customer_id, input_booking_date, input_table_number);

    -- Return a message indicating the success of the booking
    SELECT CONCAT('New booking added for Customer ', input_customer_id, ' on Table ', input_table_number, ' for Date ', input_booking_date) AS Status;
END $$

DELIMITER ;

CALL AddBooking(101, 3, "2022-12-30",4);

#--------#--------#--------#--------#--------#--------#--------#--------#--------#--------
/*
Task 2

For your second task, Little Lemon need you to create a new procedure called UpdateBooking that they can use to update existing 
bookings in the booking table.

The procedure should have two input parameters in the form of booking id and booking date. You must also include an UPDATE statement 
inside the procedure. */

DELIMITER $$

CREATE PROCEDURE UpdateBooking(
    IN input_booking_id INT, 
    IN input_booking_date DATE)
BEGIN
    -- Update the booking date for the given booking id
    UPDATE Booking
    SET BookingDate = input_booking_date
    WHERE BookingID = input_booking_id;

    -- Return a message indicating the update status
    SELECT CONCAT('Booking ID ', input_booking_id, ' updated to Date ', input_booking_date) AS Status;
END $$

DELIMITER ;

-- Example usage to update a booking
CALL UpdateBooking(1, '2023-12-30');

#--------#--------#--------#--------#--------#--------#--------#--------#--------#--------
/* 
Task 3

For the third and final task, Little Lemon need you to create a new procedure called CancelBooking that they can use to cancel or 
remove a booking.

The procedure should have one input parameter in the form of booking id. You must also write a DELETE statement inside the procedure. */

DELIMITER $$

CREATE PROCEDURE CancelBooking(
    IN input_booking_id INT)
BEGIN
    -- Delete the booking record for the given booking id
    DELETE FROM Booking
    WHERE BookingID = input_booking_id;

    -- Return a message indicating the booking was cancelled
    SELECT CONCAT('Booking ID ', input_booking_id, ' has been cancelled') AS Status;
END $$

DELIMITER ;

-- Example usage to cancel a booking
CALL CancelBooking(1);

#--------#--------#--------#--------#--------#--------#--------#--------#--------#--------

