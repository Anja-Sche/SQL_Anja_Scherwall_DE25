## 2. Theory questions

These study questions are good to get an overview of how SQL and relational databases work.

&nbsp; a) What are the main categories of SQL commands?

DDL, DML, DQL, DCL and TCL

&nbsp; b) Explain the difference between HAVING and WHERE clauses?

The WHERE clause filters individual rows before any grouping occurs.

The HAVING clause filters groups after they have been created by the GROUP BY clause.

&nbsp; c) How to make sure you delete the correct rows?

You use the SELECT statement first to see that you get the result/correct rows before you use DELETE.

&nbsp; d) How do you retrieve unique values in a column?

You use the DISTINCT keyword.

&nbsp; e) What does data transformation mean?

You change the data, ex change all 'S' to 'Small' in a column.

&nbsp; f) How do you create a new row in a table?

You use INSERT INTO, type what table you want to put it in and what columns.
Then you put in VALUES, the value should have the same position in the order as the column names.

&nbsp; g) What happens if you omit the WHERE clause in an UPDATE statement?

Every row in that column will change.

&nbsp; h) What happens if you omit the WHERE clause in a DELETE statement?

All the rows will be deleted.

&nbsp; i) What is a conditional statement in SQL, and can it be used with SELECT?

A conditional statement is when you give a condition that the data/value needs to fulfil for it to be used. 
You can use it with a SELECT statement. Ex. SELECT , FROM , WHERE 

## Glossary

Fill in this table either by copying this into your own markdown file or copy it into a spreadsheet if you feel that is easier to work with.

| terminology         | explanation |
| ------------------- | ----------- |
| CRUD                |CREATE, READ, UPDATE, DELETE (creating and managing persistent data elements)             |
| query               |computer programming language. Communicate and manipulate data in databases             |
| statement           |instructions (ex. select, )             |
| schema              |logicat grouping. like a folder where you have tables inside             |
| aliasing            |used to give a table, or a column, a temporary name             |
| projection          |taking a vertical subset from the columns of a single table that retains the unique rows             |
| selection           |returns a result set of rows, from one or more tables           |
| namespace           |defines a group of tables. Inside, all tables must be uniqley identified             |
| SELECT clause       |specifies the columns from which data values are to be retrieved by the query             |
| WHERE clause        |specifies the criteria that a value must meet, in the record that contains the value, for it to be used             |
| condition           |specifies a combination of one or more expressions and logical operators and returns a value of TRUE , FALSE , or unknown             |
| BETWEEN             |tests if an expression is within a specific range of values             |
| aggregate functions |performs a calculation on a set of values, and returns a single value             |
| range filtering     |filters values within a specific range, ex BETWEEN              |
| pattern matching    |enables you to use _ to match any single character and % to match an arbitrary number of characters             |
| list filtering      |Choose specific rows from a table based on filters             |