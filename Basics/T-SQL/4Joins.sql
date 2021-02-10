-- Joins results from more than one table
-- Due to normalizing data is spread acrosse multiple tables ,by using joins we can get the required data
--The join operation is used to combine related rows from two tables into a result set
--More than two tables can be combined using multiple join operations.



--INNER JOIN
--SYNTAX
/**
select t1.col1,t1.col2,t2.col1,tbl2.col2
from table1 as t1
inner join
table2 as t2
on
join_predicate
**/
---- most of the time we will apply the on conditon on one of the table primary key and the foregin key of the other table
--It included joined data from both tables

use AdventureWorksLT2012;

SELECT * FROM SalesLT.Customer;
SELECT * FROM SalesLT.CustomerAddress;

SELECT  CustomerID,FirstName,LastName,CompanyName,AddressType 
FROM SalesLT.Customer
JOIN
SalesLT.CustomerAddress 
ON SalesLT.Customer.CustomerID=SalesLT.CustomerAddress.CustomerID;
--it will throw error
--Ambiguous column name 'CustomerID'. 

--Most of the cases we will use Table aliasing in joins
SELECT C.CustomerID,FirstName,LastName,CompanyName,AddressType 
FROM SalesLT.Customer  AS C
 JOIN
SalesLT.CustomerAddress AS CA
ON C.CustomerID=CA.CustomerID;
--Its better to mention the table name in joins even when the cols are present in only one table
--Inner keyword is optional,by default it will take inner join

--Most of the cases we will use Table aliasing in joins
SELECT C.CustomerID,C.FirstName,C.LastName,C.CompanyName,CA.AddressType 
FROM SalesLT.Customer  AS C
JOIN
SalesLT.CustomerAddress AS CA
ON C.CustomerID=CA.CustomerID;


--Outer Joins

SELECT * FROM SalesLT.Customer;
SELECT * FROM SalesLT.SalesOrderHeader;

--Inner join returns list of customers who placed orders
SELECT C.CustomerID,C.FirstName,C.LastName,C.CompanyName,SAH.TotalDue 
FROM SalesLT.Customer  AS C
INNER JOIN
SalesLT.SalesOrderHeader AS SAH
ON C.CustomerID=SAH.CustomerID
ORDER BY TotalDue DESC;

select TotalDue from SalesOrderHeader

-- Left outer join returns all the records from the left side of the table and  the records on the  matches from the right side table
-- if there is no match then it will return null
--outer keyword is optional
SELECT C.CustomerID,C.FirstName,C.LastName,C.CompanyName,SAH.TotalDue 
FROM SalesLT.Customer  AS C
LEFT  OUTER JOIN
SalesLT.SalesOrderHeader AS SAH
ON C.CustomerID=SAH.CustomerID
ORDER BY TotalDue DESC;

-- right outer join returns all the records from the right side table and records on the matches of the left side table
-- if there is no match then it will return null
SELECT C.CustomerID,C.FirstName,C.LastName,C.CompanyName,SAH.TotalDue 
FROM SalesLT.Customer  AS C
RIGHT OUTER JOIN
SalesLT.SalesOrderHeader AS SAH
ON C.CustomerID=SAH.CustomerID
ORDER BY TotalDue DESC;


--Full Outer Joins

/**
The FULL OUTER JOIN returns a result set that includes rows from both left and right tables.
When no matching rows exist for the row in  the left table, the columns of the right table
will have nulls. Similarly, when no matching rows exist for the row in the right table, 
the column of the left table will have nulls.
**/
--syntax
/**
SELECT 
    select_list
FROM 
    T1
FULL OUTER JOIN T2 ON join_predicate;
**/
--outer keyword is optional

SELECT C.CustomerID,C.FirstName,C.LastName,C.CompanyName,SAH.TotalDue 
FROM SalesLT.Customer  AS C
FULL OUTER JOIN
SalesLT.SalesOrderHeader AS SAH
ON C.CustomerID=SAH.CustomerID
ORDER BY TotalDue DESC;


--cross join
-- cross join returns a Cartesian product of rows from both tables.
--The CROSS JOIN gets a row from the first table (T1) and then creates a new row for every row in the second table (T2). 
--It then does the same for the next row for in the first table (T1) and so on.


--syntax
/**
SELECT
	select_list
FROM
	T1
CROSS JOIN T2;
**/


SELECT distinct color from SalesLT.Product;

SELECT distinct Name  FROM SalesLT.ProductModel;

SELECT distinct P.Color ,PM.NAME FROM
SalesLT.Product P CROSS JOIN SalesLT.ProductModel PM;

--without Null
SELECT distinct P.Color ,PM.NAME FROM
SalesLT.Product P CROSS JOIN SalesLT.ProductModel PM
WHERE P.Color IS NOT NULL;

--self join

--A self join allows you to join a table to itself. It is useful for querying hierarchical data or comparing rows within the same table.
--we can do any type of join using self join
SELECT distinct P.Color FROM SalesLT.Product P;
--inner
SELECT distinct P.Color ,PM.Color FROM
SalesLT.Product P Inner JOIN SalesLT.Product PM on P.ProductID=PM.ProductID;
--LEFT OUTER
SELECT distinct P.Color ,PM.Color FROM
SalesLT.Product P LEFT JOIN SalesLT.Product PM on P.ProductID=PM.ProductID;
--RIGHT OUTER
SELECT distinct P.Color ,PM.Color FROM
SalesLT.Product P RIGHT JOIN SalesLT.Product PM on P.ProductID=PM.ProductID;
--cross
SELECT distinct P.Color ,PM.Color FROM
SalesLT.Product P CROSS JOIN SalesLT.Product PM;