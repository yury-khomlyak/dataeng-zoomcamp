SELECT
    DATE_TRUNC('day', lpep_pickup_datetime) AS pickup,
    MAX(trip_distance) AS max_distance
FROM
    green_taxi_trips
GROUP BY
    pickup
ORDER BY
    max_distance DESC
LIMIT
    1