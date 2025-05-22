-- Initial query (before optimization)
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_amount,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.property_name,
    p.property_type,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_status,
    pay.payment_date
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
JOIN 
    payments pay ON b.booking_id = pay.booking_id
ORDER BY 
    b.start_date DESC;

-- Performance Analysis with EXPLAIN
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    -- [rest of the original query]
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
JOIN 
    payments pay ON b.booking_id = pay.booking_id
ORDER BY 
    b.start_date DESC;


-- Likely Inefficiencies Identified:

    -- Missing indexes on join columns (user_id, property_id, booking_id)

    -- Full table scans due to unindexed columns in WHERE/ORDER BY

    -- Unnecessary columns being retrieved

    -- No filtering - retrieving all records when maybe only recent ones are needed

    -- Costly sorting operation on the entire dataset

-- Optimized query with proper filtering using AND
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_amount,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.property_name,
    p.property_type,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_status,
    pay.payment_date
FROM 
    bookings b
INNER JOIN 
    users u ON b.user_id = u.user_id
INNER JOIN 
    properties p ON b.property_id = p.property_id
INNER JOIN 
    payments pay ON b.booking_id = pay.booking_id
WHERE 
    b.start_date >= CURRENT_DATE - INTERVAL '6 months'
    AND b.status = 'confirmed'
    AND pay.payment_status = 'completed'
ORDER BY 
    b.start_date DESC
LIMIT 1000;
