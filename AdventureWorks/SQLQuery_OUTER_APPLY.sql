-- Correlated Subquery
SELECT c.CUSTOMERID
       , c.ACCOUNTNUMBER
       , o.ORDERDATE
       , o.SALESORDERID
FROM   sales.CUSTOMER c
       OUTER apply
       /* This expression will get executed once for each row in the outer set (i.e. customer records 29516 & 29913) */
       (
       -- get the last 3 orders for the current customer in the outer set 
       SELECT TOP 3 soh.ORDERDATE
                      , soh.SALESORDERID
        FROM   Sales.SALESORDERHEADER soh
        WHERE  soh.CUSTOMERID = c.CUSTOMERID
        ORDER  BY soh.ORDERDATE DESC) o
WHERE  c.CUSTOMERID IN ( 29516, 29913 )
ORDER  BY c.CUSTOMERID 

SELECT * FROM(
	SELECT c.CUSTOMERID
		   , c.ACCOUNTNUMBER
		   , soh.ORDERDATE
		   , soh.SALESORDERID
		   ,Row_number() OVER (partition BY c.CUSTOMERID ORDER BY soh.ORDERDATE DESC) AS CUSTOMERIDROW
	FROM   sales.CUSTOMER c
		   INNER JOIN Sales.SALESORDERHEADER soh ON c.CUSTOMERID = soh.CUSTOMERID
	WHERE  c.CUSTOMERID IN ( 29516, 29913 )) a
WHERE CUSTOMERIDROW = 1 OR CUSTOMERIDROW = 2 OR CUSTOMERIDROW = 3