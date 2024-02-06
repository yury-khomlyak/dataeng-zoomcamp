import os

import pyarrow as pa
import pyarrow.parquet as pq
from pandas import DataFrame

if "data_exporter" not in globals():
    from mage_ai.data_preparation.decorators import data_exporter


os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "/home/src/personal-gcp.json"

bucket_name = "mage-zoomcamp-yk"
project_id = "data-eng-zoomcamp-412717"

table_name = "green_taxi"

root_path = f"{bucket_name}/{table_name}"


@data_exporter
def export_data_to_google_cloud_storage(df: DataFrame, **kwargs) -> None:
    table = pa.Table.from_pandas(df)

    gcs = pa.fs.GcsFileSystem()

    pq.write_to_dataset(
        table=table,
        root_path=root_path,
        partition_cols=["lpep_pickup_date"],
        filesystem=gcs,
    )
