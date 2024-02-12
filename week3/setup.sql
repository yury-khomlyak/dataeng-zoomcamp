CREATE SCHEMA IF NOT EXISTS `data-eng-zoomcamp-412717.nytaxi`;

CREATE
OR REPLACE EXTERNAL TABLE `data-eng-zoomcamp-412717.nytaxi.external_green_tripdata` OPTIONS (
    format = 'PARQUET',
    uris = [
    'gs://mage-zoomcamp-yk/green_taxi_2022/green_tripdata_2022-01.parquet',
    'gs://mage-zoomcamp-yk/green_taxi_2022/green_tripdata_2022-02.parquet',
    'gs://mage-zoomcamp-yk/green_taxi_2022/green_tripdata_2022-03.parquet',
    'gs://mage-zoomcamp-yk/green_taxi_2022/green_tripdata_2022-04.parquet',
    'gs://mage-zoomcamp-yk/green_taxi_2022/green_tripdata_2022-05.parquet',
    'gs://mage-zoomcamp-yk/green_taxi_2022/green_tripdata_2022-06.parquet',
    'gs://mage-zoomcamp-yk/green_taxi_2022/green_tripdata_2022-07.parquet',
    'gs://mage-zoomcamp-yk/green_taxi_2022/green_tripdata_2022-08.parquet',
    'gs://mage-zoomcamp-yk/green_taxi_2022/green_tripdata_2022-09.parquet',
    'gs://mage-zoomcamp-yk/green_taxi_2022/green_tripdata_2022-10.parquet',
    'gs://mage-zoomcamp-yk/green_taxi_2022/green_tripdata_2022-11.parquet',
    'gs://mage-zoomcamp-yk/green_taxi_2022/green_tripdata_2022-12.parquet'
    ]
);

CREATE
OR REPLACE TABLE `data-eng-zoomcamp-412717.nytaxi.green_tripdata` AS
SELECT
    *
FROM
    `data-eng-zoomcamp-412717.nytaxi.external_green_tripdata`;