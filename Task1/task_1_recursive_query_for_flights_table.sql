WITH RECURSIVE REACHABLE AS (
    -- Base case: direct flights from New York
    SELECT f.start_date, 
           f.end_date, 
           f.start_port, 
           f.end_port, 
           (EXTRACT(EPOCH FROM (f.end_date - f.start_date)) / 60)::int AS diff_in_minutes,
           1 AS num_stops -- Start with 1 stop (the first direct flight)
    FROM flights f
    INNER JOIN airport a ON f.start_port = a.port_code
    WHERE a.city = 'New York'
    
    UNION ALL

    -- Recursive part: layovers
    SELECT inn.start_date, 
           outt.end_date, 
           inn.start_port, 
           outt.end_port, 
           (inn.diff_in_minutes + 
           (EXTRACT(EPOCH FROM (outt.start_date - inn.end_date)) / 60)::int +
           (EXTRACT(EPOCH FROM (outt.end_date - outt.start_date)) / 60)::int) AS diff_in_minutes,
           inn.num_stops + 1 AS num_stops  -- Increase the number of stops by 1
    FROM REACHABLE inn
    JOIN flights outt ON inn.end_port = outt.start_port 
	WHERE inn.end_date <= outt.start_date
)

SELECT MIN(r.diff_in_minutes) AS min_flight_duration
FROM REACHABLE r
INNER JOIN airport a ON r.end_port = a.port_code
WHERE a.city = 'Tokyo' AND r.num_stops < 3
