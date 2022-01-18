# Redis

Redis 是一個高效能的 key-value 資料庫

### 連線

透過 docker run  redis server

- up: docker-compose -f docker-compose.redis.yml up -d
- down: docker-compose -f docker-compose.redis.yml down

利用 python 跟 redis 連線

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

## 常見語法

    - redis-cli: 進入 redis command line
    - CONFIG GET *: 獲得所有 redis db config 設定
    - CONFIG GET **parameter name**: 獲得 redis db **parameter name** 設定
    - CONFIG SET **parameter name** **parameter value**: 設定 **parameter name** 為 **parameter value**
        - ex: CONFIG SET requirepass "pass"

## GUI 介面 medis

## Reference

- [Redis Documentation](https://redis.io/documentation)

- [Python操作redis資料庫](https://www.itread01.com/content/1545205270.html)

- [Redis - 資料持久化設定](https://tachingchen.com/tw/blog/redis-data-persistence/)