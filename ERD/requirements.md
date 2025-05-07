# Entities and Attributes
    
    User
    user_id: Primary Key, UUID, Indexed
    first_name: VARCHAR, NOT NULL
    last_name: VARCHAR, NOT NULL
    email: VARCHAR, UNIQUE, NOT NULL
    password_hash: VARCHAR, NOT NULL
    phone_number: VARCHAR, NULL
    role: ENUM (guest, host, admin), NOT NULL
    created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
    
    Property
    property_id: Primary Key, UUID, Indexed
    host_id: Foreign Key, references User(user_id)
    name: VARCHAR, NOT NULL
    description: TEXT, NOT NULL
    location: VARCHAR, NOT NULL
    pricepernight: DECIMAL, NOT NULL
    created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
    updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP
    
    Booking
    booking_id: Primary Key, UUID, Indexed
    property_id: Foreign Key, references Property(property_id)
    user_id: Foreign Key, references User(user_id)
    start_date: DATE, NOT NULL
    end_date: DATE, NOT NULL
    total_price: DECIMAL, NOT NULL
    status: ENUM (pending, confirmed, canceled), NOT NULL
    created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
    
    Payment
    payment_id: Primary Key, UUID, Indexed
    booking_id: Foreign Key, references Booking(booking_id)
    amount: DECIMAL, NOT NULL
    payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
    payment_method: ENUM (credit_card, paypal, stripe), NOT NULL
    
    Review
    review_id: Primary Key, UUID, Indexed
    property_id: Foreign Key, references Property(property_id)
    user_id: Foreign Key, references User(user_id)
    rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
    comment: TEXT, NOT NULL
    created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
    
    Message
    message_id: Primary Key, UUID, Indexed
    sender_id: Foreign Key, references User(user_id)
    recipient_id: Foreign Key, references User(user_id)
    message_body: TEXT, NOT NULL
    sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP


# Relationships between Entities
    Users
        A user can own multiple properties (if a host).
        A user can make multiple bookings (if a guest).
        A user can write multiple reviews.
    
    Properties
        A property belongs to one user (the host).
        A property can have multiple bookings.
        A property can have multiple reviews.
    
    Bookings
        A booking belongs to one user (the guest).
        A booking belongs to one property.
        A booking can have one payment associated.
    
    Payments
        A payment is associated with one booking.
        Multiple payments can be made by a user(if a user has multiple bookings).
        A payment is associated to a specific property.
    
    Reviews
        A review belongs to one user (the reviewer).
        A review belongs to one property.
        A review references a single booking.

    Messages
        A message is associated with one sender.
        A user can send multiple messages.
        A recipient can receive multiple messages.

# ER Diagram

        ![ALX-AirBnb-Database drawio](https://github.com/user-attachments/assets/7cfddce0-1de8-43c9-b8f8-8898e464e054)

