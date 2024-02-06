import pandas as pd


if "data_loader" not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if "test" not in globals():
    from mage_ai.data_preparation.decorators import test

URLS = [
    "https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2020-10.csv.gz",
    "https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2020-11.csv.gz",
    "https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2020-12.csv.gz",
]


def read_csv(url: str) -> pd.DataFrame:
    types = {
        "VendorID": pd.Int64Dtype(),
        "passenger_count": pd.Int64Dtype(),
        "trip_distance": float,
        "RatecodeID": pd.Int64Dtype(),
        "store_and_fwd_flag": str,
        "PULocationID": pd.Int64Dtype(),
        "DOLocationID": pd.Int64Dtype(),
        "payment_type": pd.Int64Dtype(),
        "fare_amount": float,
        "extra": float,
        "mta_tax": float,
        "tip_amount": float,
        "tolls_amount": float,
        "improvement_surcharge": float,
        "total_amount": float,
        "Trip_type": pd.Int64Dtype(),
    }

    parse_dates = ["lpep_pickup_datetime", "lpep_dropoff_datetime"]

    return pd.read_csv(
        url, sep=",", compression="gzip", dtype=types, parse_dates=parse_dates
    )


@data_loader
def load_data_from_api(*args, **kwargs):
    df = pd.DataFrame()

    for url in URLS:
        df = pd.concat([df, read_csv(url)])

    return df


@test
def test_output(output, *args) -> None:
    assert output is not None, "The output is undefined"
