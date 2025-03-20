-- OSLO BOOKSHOP DTA MODEL SQL CODE

-- create tables
CREATE TABLE books (
  book_id INT PRIMARY KEY,
  title VARCHAR(50),
  year_published DATE,
  price INT
);

CREATE TABLE authors (
  author_id INT PRIMARY KEY,
  name VARCHAR(50),
  birth_year DATE
);

CREATE TABLE book_authors (
  book_id INT,
  author_id INT,
  PRIMARY KEY (book_id, author_id),
  FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
  FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

CREATE TABLE customers (
  customer_id INT IDENTITY(1, 1) PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(50)
);


CREATE TABLE orders (
  order_id INT IDENTITY(1, 1) PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE CASCADE
);

CREATE TABLE order_items (
  order_id INT,
  book_id INT,
  quantity INT,
  PRIMARY KEY (order_id, book_id),
  FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
  FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE
);


--insert into books
INSERT INTO books VALUES (1, 'Harry Potter: Filosophers Stone Vol I', '1997-01-04', 22);
INSERT INTO books VALUES (2, 'Lord of The Rings: Fellowship - Vol I', '1954-02-18', 22);
INSERT INTO books VALUES (3, 'Gruffalo', '2012-09-12', 9);
INSERT INTO books VALUES (4, 'Harry Potter: Chamber of Secrets - Vol II', '1999-08-12', 22);
INSERT INTO books VALUES (5, 'Harry Potter: Prisioner of Askaban', '2001-05-19', 24);
INSERT INTO books VALUES (6, 'Lord of The Rings: Two Towers - Vol II', '1954-11-11', 22);
INSERT INTO books VALUES (7, 'Lord of The Rings: Return of The King', '1955-10-20', 24);
INSERT INTO books VALUES (8, 'The Shinning', '1977-01-28', 17);
INSERT INTO books VALUES (9, 'Jack Reacher: Killing Floor - Vol I', '1997-03-17', 18);
INSERT INTO books VALUES (10, 'The talisman', '1984-11-07', 12);

--insert into authors
INSERT INTO authors VALUES (1, 'J. K. Rowling', '1965-07-31');
INSERT INTO authors VALUES (2, 'John Ronald Reuel Tolkien', '1892-01-03');
INSERT INTO authors VALUES (3, 'Julia Donaldson', '1948-09-16');
INSERT INTO authors VALUES (4, 'Axel Scheffler', '1957-12-12');
INSERT INTO authors VALUES (5, 'Stephen King', '1947-09-21');
INSERT INTO authors VALUES (6, 'Peter Straub', '1943-03-02');
INSERT INTO authors VALUES (7, 'Lee Child', '1954-10-29');

--insert into book_authors
INSERT INTO book_authors VALUES (1, 1);
INSERT INTO book_authors VALUES (2, 2);
INSERT INTO book_authors VALUES (3, 3);
INSERT INTO book_authors VALUES (3, 4);
INSERT INTO book_authors VALUES (4, 1);
INSERT INTO book_authors VALUES (5, 1);
INSERT INTO book_authors VALUES (6, 2);
INSERT INTO book_authors VALUES (7, 2);
INSERT INTO book_authors VALUES (8, 5);
INSERT INTO book_authors VALUES (9, 7);
INSERT INTO book_authors VALUES (10, 5);
INSERT INTO book_authors VALUES (10, 6);


--insert into customers
INSERT INTO customers (name, email) --Because I have auto increment/identity(1,1) I don't type in the primary key value
VALUES ('Alice', 'alice@gmail.com'),
('James', 'james@gmail.com'),
('Beatrice', 'bea@gmail.com'),
('Carol', 'carol@gmail.com');

--insert into orders
INSERT INTO orders (customer_id, order_date)
VALUES (1, '2025-03-10'),
(2, '2025-03-10'),
(4, '2025-03-10'),
(1, '2025-03-11'),
(3, '2025-03-12'),
(4, '2025-03-13'),
(1, '2025-03-16'),
(2, '2025-03-16'),
(3, '2025-03-16');

--insert into order_items
INSERT INTO order_items VALUES (1, 1, 1),
(2, 3, 2),
(3, 5, 1),
(4, 6, 1),
(4, 5, 1),
(4, 2, 1),
(5, 7, 1),
(5, 10, 1),
(6, 2, 1),
(7, 8, 1),
(8, 2, 1),
(8, 4, 1),
(9, 9, 2);









–**PROBLEM 1: Write a SQL query to find all books written by a 'John Ronald Reuel Tolkien' and 'Stephen King'. **

SELECT title
FROM books b
WHERE book_id IN (
SELECT book_id
FROM book_authors ba
WHERE author_id IN (
SELECT author_id
FROM authors
WHERE name IN ('John Ronald Reuel Tolkien', 'Stephen King')));

--Problem 1 Output:

--title
--------------------------------------------------
--Lord of The Rings: Fellowship - Vol I
--Lord of The Rings: Two Towers - Vol II
--Lord of The Rings: Return of The King
--The Shinning
--The talisman

–**PROBLEM 2: Retrieve all orders made by a customer James.**

SELECT order_id
FROM orders
WHERE customer_id IN (
SELECT customer_id
FROM customers
WHERE name = 'James'
);

--Problem 2 Output:

--order_id
-----------
--          2
--          8

–**Problem 3: Calculate total revenue from all orders.**
SELECT SUM(price * quantity) AS total_revenue
FROM order_items oi
JOIN books b ON oi.book_id = b.book_id;

--Problem 3 Output:

--total_revenue
-------------
--       287

