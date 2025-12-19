-- task_2.sql
-- Create all tables for the ALX Book Store schema (DDL only)

USE alx_book_store;

-- Authors
CREATE TABLE IF NOT EXISTS Authors (
  author_id INT PRIMARY KEY,
  author_name VARCHAR(215) NOT NULL
) ENGINE=INNODB;

-- Books
CREATE TABLE IF NOT EXISTS Books (
  book_id INT PRIMARY KEY,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DOUBLE,
  publication_date DATE,
  CONSTRAINT fk_Books_Author
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
) ENGINE=INNODB;

-- Customers
CREATE TABLE IF NOT EXISTS Customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215),
  address TEXT
) ENGINE=INNODB;

-- Orders
CREATE TABLE IF NOT EXISTS Orders (
  order_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE,
  CONSTRAINT fk_Orders_Customer
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
) ENGINE=INNODB;

-- Order_Details
CREATE TABLE IF NOT EXISTS Order_Details (
  orderdetailid INT PRIMARY KEY,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity DOUBLE,
  CONSTRAINT fk_OrderDetails_Order
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  CONSTRAINT fk_OrderDetails_Book
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
) ENGINE=INNODB;
