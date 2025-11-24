## 3. Theory questions

These study questions are good to get an overview of how SQL and relational databases work.

&nbsp; a) What is the difference between INNER JOIN and INTERSECT?

&nbsp; b) When are the purposes of set operations?

&nbsp; c) What are the main difference between joins and set operations?

&nbsp; d) When is set operators used contra logical operators?

&nbsp; e) How to achieve this using set operations in SQL, where A and B are result sets.

<img src ="https://github.com/kokchun/assets/blob/main/sql/set_question_1.png?raw=true" width = 200>

&nbsp; f) How to achieve this using set operations in SQL, where A and B are result sets.

<img src ="https://github.com/kokchun/assets/blob/main/sql/set_question_2.png?raw=true" width = 200>

&nbsp; g) Does joining order matter for three or more tables?

## Glossary

Fill in this table either by copying this into your own markdown file or copy it into a spreadsheet if you feel that is easier to work with.

| terminology    | explanation |
| -------------- | ----------- |
| temporal       |a type of table that keeps a full history of data changes.             |
| interval       |used to perform date and time arithmetic (sum of all values in a data set divided by the total number of values)|
| synthetic      |artificial data that is generated from original data and a model that is trained to reproduce the characteristics and structure of the original data             |
| VALUES         |DML statement which returns a set of one or more rows as a table             |
| subquery       |a query nested within another SQL query, to perform operations that require multiple steps or complex logic  |
| compound query |allow you to execute multiple SQL commands as a single block             |
| set operations |a type of operations which allow the results of multiple queries to be combined into a single result set    |
| EXCEPT         |used to return distinct rows from the first query that are not present in the results of the second query     |
| result set     |a SQL data type that points to the result set of a query             |
| UNION          |a set operation that combines the result sets of two or more SELECT queries into a single result set (eliminates duplicates)             |
| UNION ALL      |used to combine the results of two or more SELECT statements into a single result set (include all duplicates)|
| operator       |a symbol specifying an action that is performed on one or more expressions             |
| INTERSECT      |combines two select statements and returns only the dataset that is common in both the statements             |
| venn diagram   |a visual tool used to understand how different SQL joins and set operations combine data from tables by showing the relationships between them             |
| LEFT JOIN      |SQL join that returns all records from the left table and the matched records from the right table           |
| INNER JOIN     |a method used to combine rows from two or more tables based on a related column between them             |
| RIGHT JOIN     |JOIN operation that retrieves all records from the right table and the matching from the left table          |
| LIKE           |used in a WHERE clause to search for a specified pattern in a column             |
| ILIKE          |a case-insensitive version of the LIKE operator, used for pattern matching (upper or lower case don't matter)|
| regexp         |a sequence of characters that defines a search pattern for text             |