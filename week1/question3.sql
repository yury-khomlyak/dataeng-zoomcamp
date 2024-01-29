SELECT
    COUNT(*) AS trips
FROM
    green_taxi_trips
WHERE
    DATE_TRUNC('day', lpep_pickup_datetime) = '2019-09-18'
    AND DATE_TRUNC('day', lpep_dropoff_datetime) = '2019-09-18'