SELECT
    zpu."Zone",
    zdo."Zone",
    MAX(t.tip_amount) AS max_tip
FROM
    green_taxi_trips t
    JOIN zones zpu ON t."PULocationID" = zpu."LocationID"
    JOIN zones zdo ON t."DOLocationID" = zdo."LocationID"
WHERE
    DATE_TRUNC('month', lpep_pickup_datetime) = '2019-09-01'
    AND zpu."Zone" = 'Astoria'
GROUP BY
    zpu."Zone",
    zdo."Zone"
ORDER BY
    max_tip DESC