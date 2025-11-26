SELECT * FROM synthetic.sales_jan
UNION
SELECT * FROM synthetic.sales_feb;
-- when choose all, monitor is unique due to the date



SELECT product_name, amount FROM synthetic.sales_jan
UNION
SELECT product_name, amount FROM synthetic.sales_feb;
-- when choosing spec columns monitor is duplicate, only one will show


SELECT product_name, amount FROM synthetic.sales_jan
UNION ALL
SELECT product_name, amount FROM synthetic.sales_feb;
-- both monitor will show due to UNION ALL, don't take away duplicates



SELECT * FROM synthetic.sales_jan
INTERSECT
SELECT * FROM synthetic.sales_feb;
-- only the same res gets returned, nothing here due to the unique date

SELECT product_name, amount FROM synthetic.sales_jan
INTERSECT
SELECT product_name, amount FROM synthetic.sales_feb;
-- only monitor will show cause it is duplicate

SELECT product_name, amount FROM synthetic.sales_jan
EXCEPT
SELECT product_name, amount FROM synthetic.sales_feb;
-- take everything from jan, remove monitor cause it is also in feb