import pandas as pd
import redis
import msgpack
import time
from io import BytesIO
import pandas as pd
import redis
import pyarrow.parquet as pq
import pyarrow as pa

df = pd.read_csv("xxx")
for col in [
    "date",
    "listing_date",
    "update_date",
    "InitialDateOfConversion",
    "DueDateOfConversion",
    "period_start",
    "period_end",
]:
    if col in df.columns:
        df[col] = df[col].astype(str)
print(df.head())

r = redis.Redis(host="xxx", port=6379, db=0, password='xxx')
CACHE_KEY = "tmp1"

#########################################################
### case1, parquet + zstd compression solution
def save_parquet_zstd(df):
    """Serialize DataFrame to compressed Parquet and store in Redis."""
    table = pa.Table.from_pandas(df)
    sink = pa.BufferOutputStream()
    pq.write_table(table, sink, compression="zstd")
    compressed_parquet = sink.getvalue().to_pybytes()
    r.set(CACHE_KEY, compressed_parquet)  # Save to Redis

def load_parquet_zstd():
    """Retrieve and deserialize DataFrame from Redis."""
    compressed_parquet = r.get(CACHE_KEY)
    if not compressed_parquet:
        return None
    table = pq.read_table(pa.BufferReader(compressed_parquet))
    return table.to_pandas()


save_parquet_zstd(df)  # Store in Redis

st_time = time.time()
df_loaded = load_parquet_zstd()  # Fetch and deserialize
ed_time = time.time()
print(f"case1 use {ed_time - st_time} secs")

#########################################################
### case2, msgpack solution
df_dict = df.to_dict("records")
r.set("tmp2", msgpack.dumps(df_dict))

st_time = time.time()
data = msgpack.loads(r.get("tmp2"))
data_df = pd.DataFrame(data)
ed_time = time.time()
print(data_df.shape)
print(f"case2 use {ed_time - st_time} secs")

#########################################################
### case3, parquet solution
r.set("tmp3", df.to_parquet())

st_time = time.time()
data_df = pd.read_parquet(BytesIO(r.get("tmp3")))
ed_time = time.time()
print(data_df.shape)
print(f"case3 use {ed_time - st_time} secs")