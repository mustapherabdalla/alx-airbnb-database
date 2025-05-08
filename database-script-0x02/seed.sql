-- Insert sample users
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    ('11111111-1111-1111-1111-111111111111', 'John', 'Smith', 'john.smith@example.com', '$2a$10$examplehash', '+1234567890', 'guest', '2023-01-15 09:30:00'),
    ('22222222-2222-2222-2222-222222222222', 'Emily', 'Johnson', 'emily.j@example.com', '$2a$10$examplehash', '+1987654321', 'host', '2023-02-20 14:15:00'),
    ('33333333-3333-3333-3333-333333333333', 'Michael', 'Williams', 'michael.w@example.com', '$2a$10$examplehash', '+1122334455', 'host', '2023-03-10 11:20:00'),
    ('44444444-4444-4444-4444-444444444444', 'Sarah', 'Brown', 'sarah.b@example.com', '$2a$10$examplehash', '+1555666777', 'guest', '2023-04-05 16:45:00'),
    ('55555555-5555-5555-5555-555555555555', 'David', 'Jones', 'admin@example.com', '$2a$10$examplehash', '+1888999000', 'admin', '2023-01-01 00:00:00');

-- Insert sample properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Cozy Downtown Apartment', 'Modern 1-bedroom apartment in city center', 'New York, NY', 120.00, '2023-02-25 10:00:00', '2023-06-15 09:30:00'),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222', 'Lakeside Cottage', 'Charming 2-bedroom cottage with lake view', 'Lake Tahoe, CA', 195.50, '2023-03-05 14:30:00', '2023-07-20 16:45:00'),
    ('cccccccc-cccc-cccc-cccc-cccccccccccc', '33333333-3333-3333-3333-333333333333', 'Beachfront Villa', 'Luxury 3-bedroom villa with private beach', 'Miami, FL', 350.00, '2023-03-15 12:00:00', '2023-08-10 11:20:00'),
    ('dddddddd-dddd-dddd-dddd-dddddddddddd', '33333333-3333-3333-3333-333333333333', 'Mountain Cabin', 'Rustic cabin with stunning mountain views', 'Aspen, CO', 175.75, '2023-04-01 09:15:00', '2023-09-05 14:30:00');

-- Insert sample bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2023-06-01', '2023-06-05', 480.00, 'confirmed', '2023-05-10 15:20:00'),
    ('ffffffff-ffff-ffff-ffff-ffffffffffff', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', '2023-07-15', '2023-07-20', 977.50, 'confirmed', '2023-06-01 10:45:00'),
    ('gggggggg-gggg-gggg-gggg-gggggggggggg', 'cccccccc-cccc-cccc-cccc-cccccccccccc', '44444444-4444-4444-4444-444444444444', '2023-08-05', '2023-08-12', 2450.00, 'confirmed', '2023-07-15 14:30:00'),
    ('hhhhhhhh-hhhh-hhhh-hhhh-hhhhhhhhhhhh', 'dddddddd-dddd-dddd-dddd-dddddddddddd', '44444444-4444-4444-4444-444444444444', '2023-09-10', '2023-09-15', 878.75, 'pending', '2023-08-20 11:15:00'),
    ('iiiiiiii-iiii-iiii-iiii-iiiiiiiiiiii', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '44444444-4444-4444-4444-444444444444', '2023-10-01', '2023-10-03', 240.00, 'canceled', '2023-09-10 16:20:00');

-- Insert sample payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    ('jjjjjjjj-jjjj-jjjj-jjjj-jjjjjjjjjjjj', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 480.00, '2023-05-10 15:25:00', 'credit_card'),
    ('kkkkkkkk-kkkk-kkkk-kkkk-kkkkkkkkkkkk', 'ffffffff-ffff-ffff-ffff-ffffffffffff', 977.50, '2023-06-01 10:50:00', 'paypal'),
    ('llllllll-llll-llll-llll-llllllllllll', 'gggggggg-gggg-gggg-gggg-gggggggggggg', 2450.00, '2023-07-15 14:35:00', 'credit_card'),
    ('mmmmmmmm-mmmm-mmmm-mmmm-mmmmmmmmmmmm', 'hhhhhhhh-hhhh-hhhh-hhhh-hhhhhhhhhhhh', 200.00, '2023-08-20 11:20:00', 'stripe');

-- Insert sample reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('nnnnnnnn-nnnn-nnnn-nnnn-nnnnnnnnnnnn', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 5, 'Perfect location and very clean apartment!', '2023-06-06 10:30:00'),
    ('oooooooo-oooo-oooo-oooo-oooooooooooo', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', 4, 'Beautiful views, but the wifi was spotty', '2023-07-21 09:15:00'),
    ('pppppppp-pppp-pppp-pppp-pppppppppppp', 'cccccccc-cccc-cccc-cccc-cccccccccccc', '44444444-4444-4444-4444-444444444444', 5, 'Absolutely stunning villa, worth every penny!', '2023-08-13 16:45:00');

-- Insert sample messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    ('qqqqqqqq-qqqq-qqqq-qqqq-qqqqqqqqqqqq', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi, is the apartment available for early check-in?', '2023-05-09 14:20:00'),
    ('rrrrrrrr-rrrr-rrrr-rrrr-rrrrrrrrrrrr', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Yes, we can arrange a 1pm check-in for you.', '2023-05-09 15:05:00'),
    ('ssssssss-ssss-ssss-ssss-ssssssssssss', '44444444-4444-4444-4444-444444444444', '33333333-3333-3333-3333-333333333333', 'Does the cabin have heating for winter?', '2023-08-19 11:30:00'),
    ('tttttttt-tttt-tttt-tttt-tttttttttttt', '33333333-3333-3333-3333-333333333333', '44444444-4444-4444-4444-444444444444', 'Yes, it has a modern heating system and a fireplace.', '2023-08-19 12:45:00');
