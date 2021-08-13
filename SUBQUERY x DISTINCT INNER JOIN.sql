-- Subconsulta correlacionada com cl�usula WHERE
SELECT   CUSTOMERID
FROM     CUSTOMERS
WHERE    (SELECT Count(*)
          FROM   ORDERS
          WHERE  CUSTOMERS.CUSTOMERID=ORDERS.CUSTOMERID)
ORDER BY CUSTOMERS.CUSTOMERNAME

-- Consulta com DISTINCT e INNER JOIN
SELECT DISTINCT CUSTOMERS.CUSTOMERNAME
FROM            CUSTOMERS
INNER JOIN      ORDERS
ON              CUSTOMERS.CUSTOMERID=ORDERS.CUSTOMERID
ORDER BY        CUSTOMERS.CUSTOMERNAME;

-- Ambas retornam o mesmo resultado e sem os valores nulos que o LEFT JOIN apresentaria, mas qual � a consulta mais r�pida?