Optimization Techniques Applied:

    Added date filtering to only retrieve recent bookings

    Added LIMIT clause to prevent excessive data retrieval

    Used INNER JOIN explicitly (since we want only bookings with complete data)

    Recommended indexes on all join columns and the sort column

    Reduced result set size with time-based filtering

Expected Performance Improvements:

    Faster joins due to indexed columns

    Reduced I/O from smaller result sets

    More efficient sorting with indexed date column

    Lower memory usage from limited result size

    Better query planning with explicit INNER JOINs
