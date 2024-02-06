from re import sub

from pandas import DataFrame

if "transformer" not in globals():
    from mage_ai.data_preparation.decorators import transformer
if "test" not in globals():
    from mage_ai.data_preparation.decorators import test


KNOWN_VENDOR_ID = [1, 2]


def filter_passengers_and_distance(df: DataFrame) -> DataFrame:
    mask = (df["passenger_count"] > 0) & (df["trip_distance"] > 0)

    return df.loc[mask]


def create_pickup_date(df: DataFrame) -> DataFrame:
    df["lpep_pickup_date"] = df["lpep_pickup_datetime"].dt.date

    return df


def snake_case(s):
    return "_".join(
        sub(
            "([A-Z][a-z]+)", r" \1", sub("([A-Z]+)", r" \1", s.replace("-", " "))
        ).split()
    ).lower()


def rename_columns(df: DataFrame) -> DataFrame:
    original_columns = set(df.columns)
    df.columns = df.columns.map(snake_case)
    renamed_columns = set(df.columns)

    print(len(original_columns.difference(renamed_columns)))

    return df


@transformer
def transform(data, *args, **kwargs):
    return rename_columns(create_pickup_date(filter_passengers_and_distance(data)))


@test
def test_output(output, *args) -> None:
    assert (
        output["vendor_id"].isin(KNOWN_VENDOR_ID).all()
    ), "There are rides with unknown vendor ID"

    assert (
        output["passenger_count"].isin([0]).sum() == 0
    ), "There are rides with zero pax"

    assert (
        output["trip_distance"].isin([0]).sum() == 0
    ), "There are rides with zero distance"
