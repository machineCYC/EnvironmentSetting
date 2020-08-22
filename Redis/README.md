# Redis

Redis 是一個高效能的 key-value 資料庫

### 連線

```
import redis
rs = redis.StrictRedis(
    host="localhost",
    port=6379,
    password="12345789",
    db=0,
)
```

### hash 的主要操作

    - redis 中的 Hash 在記憶體中類似於一個 name 對應一個 dic 來儲存
    - hset、hget、hdel、hgetall 用於操作寫入，讀取，刪除，讀取全部 name 全部資料

## GUI 介面 medis

## Reference

- [Python操作redis資料庫](https://www.itread01.com/content/1545205270.html)