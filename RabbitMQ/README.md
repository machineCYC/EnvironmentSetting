# RabbitMQ

現實生活中有很多情境會一次湧入很多 user 到某個 server，導致 server 承受不住瞬間的流量而掛掉。Ex:演唱會搶票，常常因為這樣導致網站掛掉。

針對上述問題，RabbitMQ 可以將 task 的訊息都儲存在 Queue 中，並逐一將這些 task 發送給 worker (python 來說，比較常用的是 celery) 去執行。白話文的意思是，所有的 task 排隊一個一個慢慢處理。

    - Queue（隊列）是 RabbitMQ 的內部物件，用於儲存訊息

然而這樣的做法，好處就是可以透過提升 worker 數量，將 task 分散同時執行，做到加速，非同步的效果，以程式來說，擴展性比較高，一般開發只要針對單一任務進行開發。

# Celery

Celery 是一個用 python 實作的分散式任務寧列 (Distributed Task Queue) 的 package，一般會搭配 broker (RabbitMQ 或 redis) 來接收訊息。常常用來處理非同步任務、分散是爬蟲、定時任務...等。


- 優點:
    - 簡單：Celery 易於使用和維護，並且它不需要配置文件 ，並且配置和使用還是比較簡單的
    - 高可用：當任務執行失敗或執行過程中發生連接中斷，celery 會自動嘗試重新執行任務
    - 快速：單個 Celery 進程每分鐘可處理數以百萬計的任務
    - 靈活： Celery 幾乎所有部分都可以擴展或單獨使用，各個部分可以自定義。

- 安裝

    ```
    pip3 install celery
    ```

# flower

flower 是一個 celery 的監控工具，它提供了一個圖形使用者介面，可以極大的方便我們監控任務的執行過程， 執行細節及歷史記錄，還提供了統計功能。

## Reference

- [Message Queue 簡介(以 RabbitMQ 為例)](https://godleon.github.io/blog/ChatOps/message-queue-concepts/)

- [Celery介绍和基本使用](https://zhuanlan.zhihu.com/p/64595171)

- [Redis, Kafka or RabbitMQ: Which MicroServices Message Broker To Choose?](https://otonomo.io/redis-kafka-or-rabbitmq-which-microservices-message-broker-to-choose/?fbclid=IwAR2SoY2p5tFSQJITXG_90K4EOL4e7apjBSyOcfgvfYiPNSznD-RfR7Pn1-Q)