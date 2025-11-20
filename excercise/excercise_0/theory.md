## 3. Theory questions

These study questions are good to get an overview of how SQL and relational databases work.

&nbsp; a) What is SQL, and why is it important in relational databases?

Structured Query Language is a way to turn data in to valuble insights and handle inconsistent data. It can handle alot of data. 

&nbsp; b) Explain the difference between FROM and WHERE clauses.

FROM - the database where you get/have the information you are using for this code.

WHERE - the conditions for the things you want to retreve. ex WHERE customer_id = 1. Get the information from the rows where customer_id is 1.

&nbsp; c) Explain the purpose of the LIMIT or OFFSET clause in a SQL query.

LIMIT - shows the amount of rows you ask for counting from the top. Ex LIMIT 4, shows the first 4 rows 

OFFST - takes away the rows you ask forcounting from the top. Ex OFFSET 4, shows all rows except the first 4 rows.

&nbsp; d) What are the primary functions of the Data Definition Language (DDL) in SQL?

The primary functions is to create (tables, indexes, databases), alter ( change the structure of the existing table) and drop (permanently remove a databese object, table ...). 

&nbsp; e) Explain the differences between the Data Manipulation Language (DML) and Data Definition Language (DDL).

The difference between DDL and DML is that DDL is used to create, insert and drop(delete) for example tables or indexes. DML is used to insert, update and delete information/data inside the tables.

&nbsp; f) What makes DuckDB unique compared to other databases?

DuckDB stores the information i columns instead of in rows. 

&nbsp; g) Is DuckDB suitable for real-time data processing?

No.

&nbsp; h) Difference between read_csv and read_csv_auto

With read_csv the data types are put in by duckdb when it reads the file, also detects the column names automatically.

With read_csv_auto you need to manually put in the data type for the columns and specify what the column names are.

## Glossary

Fill in this table either by copying this into your own markdown file or copy it into a spreadsheet if you feel that is easier to work with.

| terminology         | explanation |
| ------------------- | ----------- |
| CRUD                |CREATE, READ, UPDATE, DELETE (creating and managing persistent data elements)            |
| query               |computer programming language. Communicate and manipulate data in databases|
| statement           |instructions (ex. select, )             |
| DDL                 |Data Defenition Language (create, alter, drop)             |
| DML                 |Data Defenition Language (insert, update, delete)             |
| idempotent          |will give the same result everytime, as if it has only done it once (IF NOT EXISTS)             |
| table               |database object composed of columns and rows to show the data            |
| schema              |logicat grouping. like a folder where you have tables inside             |
| row                 |a single group of related data within a table             |
| record              |the rows are called records in database terminology             |
| column              |the chategorries of information in a table             |
| database            |organized collection of data             |
| persistance         |the ways where processes or objects can continue on, or remain, even when systems are shut down             |
| DQL                 |Data Query Language (select)             |
| relational database |organizes data into columns and rows. Linked by common fields (keys)             |
| dot commands        |a special built-in shell command             |
| CLI                 |textbaserat gränssnitt. Interagera med datorn genom kommandon             |
| bash                |used to write scripts and run commands             |
| type inference      |the ability to automatically deduce, either partially or fully, the type of an expression at compile time             |
| clause              |help fetch required records from database table             |
| aliasing            |used to give a table, or a column, a temporary name             |
| SQL statement       |a set of instructions             |
| persistent database |the exact same data can be retrieved by an application when it's opened again             |
| .wal                |Write-Ahead Logging (feature that ensures data integrity and durability.)             |
| IDE                 |Integrated Development Enviroment             |
| csv                 |dtata format fro storing tabular data where values are separated by commas             |
| namespace           |defines a group of tables. Inside, all tables must be uniqley identified           |