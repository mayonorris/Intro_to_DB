# Intro_to_DB — Discovering Databases: An Easy Start for Beginners

**Repo:** `Intro_to_DB`  
**Focus:** MySQL fundamentals — schemas, DDL/DML, CRUD, and simple automation with Python.

---

## 🎯 What you’ll learn

- What a **database** and a **relational database** are.
- What **SQL** stands for and where **MySQL** fits.
- Core SQL families: **DDL** (create/alter/drop) vs **DML** (insert/update/delete/select).
- How to:
  - Create a database and tables with proper **primary/foreign keys**.
  - Run **CRUD** operations.
  - Inspect structures without `DESCRIBE`/`EXPLAIN` (e.g., `SHOW CREATE TABLE`).
- Write a tiny Python script to **create a database** safely.

---

## 📦 Project structure & deliverables

```text
Intro_to_DB/
├─ README.md # this file
├─ alx_book_store.sql # Task 0: DB + schema (PK/FK)
├─ MySQLServer.py # Task 1: create DB via Python (idempotent)
├─ task_2.sql # Task 2: create tables (DDL only)
├─ task_3.sql # Task 3: list all tables in a DB
├─ task_4.sql # Task 4: full description of books (no DESCRIBE/EXPLAIN)
├─ task_5.sql # Task 5: insert one customer row
└─ task_6.sql # Task 6: insert three customer rows
```


> **Style rule:** All **SQL keywords must be UPPERCASE** (e.g., `CREATE TABLE`, `PRIMARY KEY`, `FOREIGN KEY`, `INSERT INTO`, `VALUES`, `DATE`, `DOUBLE`, `VARCHAR`).

---

## 📚 Target schema — `alx_book_store`

**Database:** `alx_book_store`

**Tables & columns**

- **AUTHORS**
  - `author_id` **INT** **PRIMARY KEY**
  - `author_name` **VARCHAR(215)**
- **BOOKS**
  - `book_id` **INT** **PRIMARY KEY**
  - `title` **VARCHAR(130)**
  - `author_id` **INT** **FOREIGN KEY** → `AUTHORS(author_id)`
  - `price` **DOUBLE**
  - `publication_date` **DATE**
- **CUSTOMERS**
  - `customer_id` **INT** **PRIMARY KEY**
  - `customer_name` **VARCHAR(215)**
  - `email` **VARCHAR(215)**
  - `address` **TEXT**
- **ORDERS**
  - `order_id` **INT** **PRIMARY KEY**
  - `customer_id` **INT** **FOREIGN KEY** → `CUSTOMERS(customer_id)`
  - `order_date` **DATE**
- **ORDER_DETAILS**
  - `orderdetailid` **INT** **PRIMARY KEY**
  - `order_id` **INT** **FOREIGN KEY** → `ORDERS(order_id)`
  - `book_id` **INT** **FOREIGN KEY** → `BOOKS(book_id)`
  - `quantity` **DOUBLE**

> **Creation order tip:** Create parent tables first → `AUTHORS`, `CUSTOMERS`, `BOOKS`, `ORDERS`, then `ORDER_DETAILS`.

---

## ✅ Tasks checklist (what the grader expects)

### 0) `alx_book_store.sql`
- Creates the **database** and **all five tables** with PK/FK constraints.
- Types must match exactly (e.g., `VARCHAR(130)`, `DOUBLE`, `DATE`, `TEXT`).

### 1) `MySQLServer.py`
- Connects to MySQL, runs `CREATE DATABASE IF NOT EXISTS alx_book_store`.
- Prints **exact** success message:  
  `Database 'alx_book_store' created successfully!`
- Handles connection errors cleanly; always closes the connection.

### 2) `task_2.sql`
- Creates all **five tables** (DDL only).  
- All SQL keywords **UPPERCASE**.

### 3) `task_3.sql`
- Lists tables in the selected DB.  
- Assume grader runs: `mysql -D alx_book_store < task_3.sql`  
- Use a simple, portable command (e.g., `SHOW TABLES;`).

### 4) `task_4.sql`
- Prints a **full description** of `books` **without** `DESCRIBE`/`EXPLAIN`.  
- Use: `SHOW CREATE TABLE books;` (keywords uppercase).

### 5) `task_5.sql`
- Inserts **one row** into **CUSTOMERS**:
  - `(1, 'Cole Baidoo', 'cbaidoo@sandtech.com', '123 Happiness Ave.')`

### 6) `task_6.sql`
- Inserts **three rows** into **CUSTOMERS**:
  - `(2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness  Ave.')`
  - `(3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness  Ave.')`
  - `(4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness  Ave.')`

---

## 🛠️ How to run locally

1) **Create DB via Python (Task 1)**
```bash
python3 MySQLServer.py
# Expect: Database 'alx_book_store' created successfully!

# If Task 0 contains DB + tables
mysql -u <user> -p < alx_book_store.sql

# Or create tables separately in Task 2:
mysql -u <user> -p -D alx_book_store < task_2.sql
mysql -u <user> -p -D alx_book_store < task_3.sql
mysql -u <user> -p -D alx_book_store < task_4.sql
mysql -u <user> -p -D alx_book_store < task_5.sql
mysql -u <user> -p -D alx_book_store < task_6.sql
```

## License

MIT © Mayo T. Norris KADANGA