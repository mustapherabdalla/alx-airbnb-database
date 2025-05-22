SELECT 
    u.user_id,
    u.user_name,
    COUNT(b.booking_id) AS total_bookings
FROM 
    users u
LEFT JOIN 
    bookings b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.user_name
ORDER BY 
    total_bookings DESC;


SELECT 
    p.property_id,
    p.property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank,
    DENSE_RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS dense_booking_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_num
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.property_name
ORDER BY 
    total_bookings DESC;
