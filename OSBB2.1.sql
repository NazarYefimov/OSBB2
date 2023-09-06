INSERT INTO OSBBMembers (full_name, roles_list)
SELECT CONCAT('Власник ', i), '1'
FROM (
    SELECT (a.N + b.N * 10 + 1) AS i
    FROM (
        SELECT 0 AS N
        UNION SELECT 1
        UNION SELECT 2
        UNION SELECT 3
    ) a
    CROSS JOIN (
        SELECT 0 AS N
        UNION SELECT 1
        UNION SELECT 2
        UNION SELECT 3
    ) b
) numbers;