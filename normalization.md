# Normalization Steps Explained

    Normalization Steps Explained: How I verified 3NF in my Airbnb Database Schema 
    
    To ensure my database adheres to Third Normal Form (3NF), I systematically checked each table against the rules of 1NF, 2NF, and 3NF. Here’s a detailed breakdown of the process:
    
    First Normal Form (1NF): Eliminate Repeating Groups and Ensure Atomicity  
    Each column must hold atomic (indivisible) values, and there should be no repeating groups. 
    
    Checks Applied to my Schema
    
    All columns are atomic 
    No arrays, JSON blobs, or comma-separated lists (e.g., `phone_number` is a single string, not a list).  
    Example: `User.email` is a single `VARCHAR`, not a collection.  
    
    No repeating groups
    Each attribute appears once per table (e.g., `Property` doesn’t store multiple `amenities` in one field).  
    
    Second Normal Form (2NF): Remove Partial Dependencies 
    Ensure non-key attributes depend on the entire primary key (not just part of it).  
    
    Checks Applied to my Schema
    
    All tables use a single-column primary key (`UUID`)
    No composite keys, so no risk of partial dependencies.  
    
    Non-key attributes depend on the full PK
    Example: In `Booking`, `start_date` and `end_date` depend on `booking_id` (not just `property_id` or `user_id`).  
    
    
        3.	Third Normal Form (3NF): Eliminate Transitive Dependencies
    Ensure non-key attributes depend only on the primary key, not on other non-key  attributes.  
    
    Checks Applied to my Schema  
    
    We looked for transitive dependencies where:  
    > `Primary Key → Non-Key Attribute A → Non-Key Attribute B`  
    
    A. `Booking.total_price` 
    - Potential Issue  
      - If `total_price = pricepernight * (end_date - start_date)`, it’s **derived from `Property.pricepernight`** (a transitive dependency). 
    
     
    - **3NF Compliance?**  
      - If stored statically (fixed at booking time): ✅ Compliant (treated as immutable data).  
      - If dynamically calculated: ❌ Violates 3NF (redundant).  
    
    B. `Property.location` 
    - If `location` is a simple string (e.g., "Paris, France"), ✅ Compliant.   
    
    C. `User.role`
    - Since `role` is an `ENUM`, ✅ Compliant.  
    - If roles had metadata (e.g., permissions), a `Roles` table would be needed.  

