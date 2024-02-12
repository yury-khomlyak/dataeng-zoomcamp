CREATE
OR REPLACE TABLE `data-eng-zoomcamp-412717.nytaxi.green_tripdata_partitioned_clustered` PARTITION BY DATE(lpep_pickup_datetime) CLUSTER BY PULocationID AS
SELECT
    *
FROM
    `data-eng-zoomcamp-412717.nytaxi.green_tripdata`;