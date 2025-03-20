# Oslo Bookshop SQL Data Model

Welcome to the **Oslo Bookshop SQL Data Model**! 📚 This project represents a database design for a fictional bookshop in Oslo, Norway. The database model includes tables for books, authors, customers, and more, with clear relationships between them. The goal of this project is to demonstrate how to structure a relational database using SQL, complete with queries to interact with and retrieve useful data.

---

## Project Structure

The project is divided into a few parts to help you understand the structure of the database and how to interact with it.

- **SQL Data Model**: This includes the SQL code for creating tables, inserting data, and querying the database.
- **ER Diagram**: A visual representation of the database schema to show how the tables are related.
- **Jupyter Notebook**: A notebook that explains the data model and demonstrates running SQL queries (with the option to expand into Python for future work).

---

## Files & Folders

- **notebooks/**: Contains the Jupyter notebook with explanations and SQL code.
  - `oslo_bookshop_data_model.ipynb`: The main notebook where the SQL code runs and the database model is explained.
- **images/**: This folder contains images used in the notebook, such as the ER diagram.
  - `oslo_book_shop.drawio.png`: The ER diagram image showing how the tables are connected.

---

## How to Use This Project

1. **Set up your database**:
   You'll need to create a SQL Server database (or use another SQL database) and execute the SQL code to create the tables. You can do this directly in the database management system (DBMS) you're using.

2. **Run the SQL Queries**:
   Use the queries provided in the notebook to interact with the database, retrieve data, and experiment with the relationships.

3. **Play Around with the Jupyter Notebook**:
   Open the notebook and run the cells to explore the SQL data model, along with some sample queries to get insights about the bookshop (e.g., top-selling books, customers who made the most purchases).

4. **Future Expansion (Python)**:
   In the future, you can extend the notebook to use **Python** to interact with the database, retrieve data using **pyodbc**, and analyze it further.

---

## Example Queries

Here is an example query included in the notebook:

- **Find most frequent customers**:
    ```sql
    SELECT name, COUNT(order_id) AS NumberOfOrders
    FROM orders
    GROUP BY name
    ORDER BY NumberOfOrders DESC;

--

## ER Diagram

The ER Diagram is a visual illustration of the database structure to understand how the different tables are related to each other.

- You can find the ER diagram in the `images` folder, and it is also referenced in the jupyter notebook to help you better understand the relationships.

--

## How to Contribute

Feel free to fork this repository, experiment with queries, and even improve the model. For suggestions or improvements, create an issue or submit a pull request.

--

# License

This project is open-source.
