-- Create partitioned table structure
CREATE TABLE bookings_partitioned (
    booking_id BIGSERIAL,
    user_id BIGINT NOT NULL,
    property_id BIGINT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_amount DECIMAL(12,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

-- Create monthly partitions for current and future data
CREATE TABLE bookings_y2023m01 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2023-02-01');

CREATE TABLE bookings_y2023m02 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-02-01') TO ('2023-03-01');
    
-- [Continue creating partitions for each month...]

CREATE TABLE bookings_y2024m01 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');

-- Create default partition for future dates
CREATE TABLE bookings_future PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-02-01') TO (MAXVALUE);

-- Migrate data from original table (run during maintenance window)
INSERT INTO bookings_partitioned 
SELECT * FROM bookings;

-- Create indexes on each partition
CREATE INDEX idx_bookings_partitioned_user_id ON bookings_partitioned(user_id);
CREATE INDEX idx_bookings_partitioned_property_id ON bookings_partitioned(property_id);
CREATE INDEX idx_bookings_partitioned_status ON bookings_partitioned(status);


-- Test query on original table
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';

-- Test query on partitioned table
EXPLAIN ANALYZE
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';
