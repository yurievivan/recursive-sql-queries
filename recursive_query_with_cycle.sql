WITH RECURSIVE R AS (
--  Initial Subquery
SELECT 1 AS n
UNION
-- Recursive Subquery
SELECT n + 1 AS n 
FROM R
WHERE n < 10
)
-- Result Query
SELECT * FROM R