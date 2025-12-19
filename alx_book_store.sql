-- alx_book_store.sql
-- Create database and full schema for the ALX Book Store

CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- AUTHORS table
CREATE TABLE IF NOT EXISTS AUTHORS (
  author_id INT PRIMARY KEY,
  author_name VARCHAR(215) NOT NULL
) ENGINE=INNODB;

-- BOOKS table
CREATE TABLE IF NOT EXISTS BOOKS (
  book_id INT PRIMARY KEY,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DOUBLE,
  publication_date DATE,
  CONSTRAINT fk_books_author
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
) ENGINE=INNODB;

-- CUSTOMERS table
CREATE TABLE IF NOT EXISTS CUSTOMERS (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215),
  address TEXT
) ENGINE=INNODB;

-- ORDERS table
CREATE TABLE IF NOT EXISTS ORDERS (
  order_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE,
  CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
) ENGINE=INNODB;

-- ORDER_DETAILS table
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
  orderdetailid INT PRIMARY KEY,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity DOUBLE,
  CONSTRAINT fk_orderdetails_order
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
  CONSTRAINT fk_orderdetails_book
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
) ENGINE=INNODB;
