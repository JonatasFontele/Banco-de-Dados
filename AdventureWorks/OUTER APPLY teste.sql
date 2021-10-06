WITH last_3_orders AS
(
       SELECT TOP 3 soh.ORDERDATE
                      , soh.SALESORDERID
        FROM   Sales.SALESORDERHEADER soh
        WHERE  soh.CUSTOMERID = c.CUSTOMERID
        ORDER  BY soh.ORDERDATE DESC
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