SELECT
    SUM(t.total_amount) AS total_sum,
    z."Borough"
FROM
    green_taxi_trips t
    JOIN zones z ON t."PULocationID" = z."LocationID"
WHERE
    DATE_TRUNC('day', lpep_pickup_datetime) = '2019-09-18'
    AND z."Borough" != 'Unknown'
GROUP BY
    z."Borough"
HAVING
    SUM(t.total_amount) > 50000
ORDER BY
    total_sum DESC
LIMIT
    3