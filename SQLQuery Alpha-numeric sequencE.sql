WITH seq AS
(
    SELECT 
        ROW_NUMBER() OVER (ORDER BY x.alpha + y.number + z.number) AS Id,
        CONVERT(nchar(3), x.alpha + y.number + z.number) AS Result
    FROM 
        (
            VALUES 
            ('0'), ('1'), ('2'), ('3'), ('4'), ('5'), ('6'), ('7'), ('8'), ('9'),
            ('A'), ('B'), ('C'), ('D'), ('E'), ('F'), ('G'), ('H'), ('I'), ('J'), 
            ('K'), ('L'), ('M'), ('N'), ('O'), ('P'), ('Q'), ('R'), ('S'), ('T'), 
            ('U'), ('V'), ('W'), ('X'), ('Y'), ('Z')
        ) x(alpha),
        (
            VALUES 
            ('0'), ('1'), ('2'), ('3'), ('4'), ('5'), ('6'), ('7'), ('8'), ('9')
        ) y(number),
        (
            VALUES 
            ('0'), ('1'), ('2'), ('3'), ('4'), ('5'), ('6'), ('7'), ('8'), ('9')
        ) z(number)
    WHERE
       NOT (NOT x.alpha BETWEEN '1' AND '9' AND y.number = '0' AND z.number = '0')
)
-- Uncomment to see all results
SELECT * FROM seq

--SELECT Result FROM seq WHERE Id = (SELECT Id + 1 FROM seq WHERE Result = 'Z01')