SELECT
    DISTINCT(PULocationID)
FROM
    `data-eng-zoomcamp-412717.nytaxi.green_tripdata`
WHERE
    lpep_pickup_datetime >= "2022-06-01"
    AND lpep_pickup_datetime <= "2022-06-30";