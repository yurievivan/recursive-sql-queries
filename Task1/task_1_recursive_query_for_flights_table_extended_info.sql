WITH RECURSIVE REACHABLE AS (
    -- Base case: direct flights from New York
    SELECT f.start_date, 
           f.end_date, 
           f.start_port, 
           f.end_port, 
           (EXTRACT(EPOCH FROM (f.end_date - f.start_date)) / 60)::int AS diff_in_minutes,
           CONCAT(f.start_port, '->', f.end_port) AS route,
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
            (EXTRACT(EPOCH FROM (outt.end_date - outt.start_date)) / 60)::int) AS diff_in_minutes,
           CONCAT(inn.route, ' | ', outt.start_port, '->', outt.end_port) AS route,
           inn.num_stops + 1 AS num_stops  -- Increase the number of stops by 1
    FROM REACHABLE inn
    JOIN flights outt ON inn.end_port = outt.start_port 
)

SELECT r.* 
FROM REACHABLE r
INNER JOIN airport a ON r.end_port = a.port_code
WHERE a.city = 'Tokyo' AND r.num_stops < 3
ORDER BY diff_in_minutes;  -- Sorting by flight time