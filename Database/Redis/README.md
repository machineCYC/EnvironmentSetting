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
    - module list: 列出所有 redis module
    - HGET **key** **field**: 獲得 **key** 中的 **field** 值

## 常用 Module

    - RediSearch: highly available full text search
        - 支持 redis 中 HASH 文件搜尋
        - define redis secondary index before using redis search
            -  FT.CREATE {index}
                    [ON {data_type}]
                    [PREFIX {count} {prefix} [{prefix} ..]
                    [FILTER {filter}]
                    [LANGUAGE {default_lang}]
                    [LANGUAGE_FIELD {lang_attribute}]
                    [SCORE {default_score}]
                    [SCORE_FIELD {score_attribute}]
                    [PAYLOAD_FIELD {payload_attribute}]
                    [MAXTEXTFIELDS] [TEMPORARY {seconds}] [NOOFFSETS] [NOHL] [NOFIELDS] [NOFREQS] [SKIPINITIALSCAN]
                    [STOPWORDS {num} {stopword} ...]
                    SCHEMA {identifier} [AS {attribute}]
                        [TEXT [NOSTEM] [WEIGHT {weight}] [PHONETIC {matcher}] | NUMERIC | GEO | TAG [SEPARATOR {sep}] [CASESENSITIVE]
                        [SORTABLE [UNF]] [NOINDEX]] ...
            - ex: FT.CREATE **index name** ON HASH PREFIX 1 "prefix string" SCHEMA SORTABLE **column1** TEXT NOSTEM SORTABLE Timestamp NUMERIC SORTABLE
        - use redis srarch with secondary index
            - ex: FT.SEARCH **index name** "@column1:XXX" SORTBY Timestamp LIMIT 0 10


## GUI 介面 medis

## Reference

- [Redis Documentation](https://redis.io/documentation)

- [Python操作redis資料庫](https://www.itread01.com/content/1545205270.html)

- [Redis - 資料持久化設定](https://tachingchen.com/tw/blog/redis-data-persistence/)

- [RedisSearch doc](https://oss.redis.com/redisearch/Commands/)