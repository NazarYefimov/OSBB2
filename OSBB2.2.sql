SELECT
    OM.full_name,
    OM.email, 
    B.building_number,
    A.apartment_number,
    A.area
FROM
    OSBBMembers OM
JOIN
    Ownership O ON OM.member_id = O.member_id
JOIN
    Apartments A ON O.apartment_id = A.apartment_id
JOIN
    Buildings B ON A.building_id = B.building_id
LEFT JOIN
    Residents R ON OM.member_id = R.member_id
WHERE
    R.car_access = 0
GROUP BY
    OM.member_id
HAVING
    COUNT(O.apartment_id) < 2;