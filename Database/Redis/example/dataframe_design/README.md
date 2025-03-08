# Optimizing DataFrame Performance with Redis

In modern applications, Redis is often leveraged to improve API response times by caching frequently accessed data. In this document, we explore various methods to store and retrieve Pandas DataFrames in Redis for improved performance.

Example Data
For this example, let's assume we have a CSV file that contains roughly 11MB of data. The file includes 112,434 rows and 6 columns. The data looks like the table below:

| industry_category | stock_id | stock_name | type | date | create_time |
|----------|----------|----------|----------|----------|----------|
|  封閉式基金  | 0001   | 鴻運   |  twse | 2024-12-05 | 2022-05-29 13:03:37 |

## Methods for Storing Data in Redis

We will compare different methods for saving this data in Redis, with the goal of understanding how each method affects read performance when retrieving the DataFrame from Redis.

## Methods Summary

In this example we use a csv file with roughly 11mb,  112434 rows and 6 columns as our data, the example as the below table

The summary for the read performance

| Method | Compression | Description | read secs |
|----------|----------|---------|---------|
|  parquet + zstd compression  | Zstd | Parquet file format with Zstd compression for better space efficiency and faster reads. | 0.93secs  |
| msgpack   | None (Binary format) | A compact binary format that is easy to serialize and deserialize. | 7secs |
| pandas parquet | None (Binary format) | Parquet format without compression; compact but less efficient than Parquet with compression | 1.37secs |

## Note

- Redis has internal limits for certain data types (e.g., the maximum size for a string is around 512 MB), but it's typically better to keep objects under 10 MB for best performance.