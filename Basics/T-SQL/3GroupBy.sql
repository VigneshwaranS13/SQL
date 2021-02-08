-- Returns selected set of rows as summary rows
-- The returned group is based on one or more columns
-- Aggregate functions in the select list is determine the grouped information that is passed
--(SUM,AVG,COUNT,MAX,MIN)
--when we use the group by clause on col/cols ,rem columns should return only row for each record on group by column

use AdventureWorksLT2012;

SELECT * FROM SalesLT.SalesOrderDetail;

SELECT ProductID,OrderQty FROM SalesLT.SalesOrderDetail;

SELECT ProductID,OrderQty FROM SalesLT.SalesOrderDetail ORDER BY ProductID;

SELECT ProductID,OrderQty FROM SalesLT.SalesOrderDetail  GROUP BY ProductID;
--Column 'SalesLT.SalesOrderDetail.OrderQty' is invalid in the select list
--because it is not contained in either an aggregate function or the GROUP BY clause. 
SELECT ProductID,OrderQty FROM SalesLT.SalesOrderDetail GROUP BY ProductID,OrderQty ;
----While all aggregate functions could be used without the GROUP BY clause
SELECT SUM(OrderQty) FROM SalesLT.SalesOrderDetail;
SELECT ProductID,SUM(OrderQty) TotalOrderQty FROM SalesLT.SalesOrderDetail  GROUP BY ProductID;

SELECT ProductID,OrderQty FROM SalesLT.SalesOrderDetail where ProductID = 707;
SELECT ProductID,OrderQty FROM SalesLT.SalesOrderDetail where ProductID = 707 GROUP BY ProductID,OrderQty ;

SELECT ProductID,SUM(OrderQty) as TotalOrderQty ,COUNT(ProductID) as Orders   FROM SalesLT.SalesOrderDetail  GROUP BY ProductID;

SELECT ProductID,SUM(OrderQty) as TotalOrderQty ,COUNT(ProductID) as Orders,AVG(OrderQty) as AvgOrder   FROM SalesLT.SalesOrderDetail  GROUP BY ProductID;

-------------------------------------------------------Having Clause----------------------------------------------


SELECT * from SalesLT.SalesOrderDetail;

SELECT ProductID,OrderQty from SalesLT.SalesOrderDetail;
SELECT ProductID,OrderQty from SalesLT.SalesOrderDetail ORDER by ProductID;
SELECT ProductID,SUM(OrderQty) from SalesLT.SalesOrderDetail GROUP BY ProductID ORDER by ProductID;


--where
--apply the filter before the grouping occur
SELECT ProductID,OrderQty from SalesLT.SalesOrderDetail where OrderQty >6 ORDER by ProductID;
SELECT ProductID,SUM(OrderQty) from SalesLT.SalesOrderDetail where OrderQty >6 GROUP BY ProductID ORDER by ProductID;
--having
--apply the filter aftet the grouping occured
SELECT ProductID,SUM(OrderQty)  from SalesLT.SalesOrderDetail  GROUP BY ProductID HAVING SUM(OrderQty) >20 ORDER by ProductID;
--we can't use alias in having clause
SELECT ProductID,SUM(OrderQty) as TotalQty from SalesLT.SalesOrderDetail  GROUP BY ProductID HAVING TotalQty >20 ORDER by ProductID;

--theory for execution
/**
The HAVING clause is evaluated before the SELECT - so the server doesn't yet know about that alias.

1.First, the product of all tables in the FROM clause is formed.

2.The WHERE clause is then evaluated to eliminate rows that do not satisfy the search_condition.

3.Next, the rows are grouped using the columns in the GROUP BY clause.

4.Then, groups that do not satisfy the search_condition in the HAVING clause are eliminated.

5.Next, the expressions in the SELECT statement target list are evaluated.

6.If the DISTINCT keyword in present in the select clause, duplicate rows are now eliminated.

7.The UNION is taken after each sub-select is evaluated.

8.Finally, the resulting rows are sorted according to the columns specified in the ORDER BY clause.

9.TOP clause is executed.


**/




