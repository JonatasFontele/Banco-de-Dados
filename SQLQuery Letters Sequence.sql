WITH letters
     AS (SELECT TOP 26 Char(Ascii('A')
                            + Row_number() OVER (ORDER BY (SELECT NULL)) - 1) AS
                       letter
         FROM   master..SPT_VALUES) SELECT l1.LETTER AS seq
FROM   letters l1
UNION ALL
SELECT l1.LETTER + l2.LETTER
FROM   letters l1
       CROSS JOIN letters l2
UNION ALL
SELECT l1.LETTER + l2.LETTER + l3.LETTER
FROM   letters l1
       CROSS JOIN letters l2
       CROSS JOIN letters l3