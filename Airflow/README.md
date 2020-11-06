# Airflow

## 安裝

- python 直接透過 pip 安裝

    ```
    pip3 install apache-airflow
    ```

## 設定

- 設定 AIRFLOW_HOME: 啟動 Airflow 所需要的所有設定檔都會在這資料夾下, 之後所有 job 的 dag 也都必須在這目錄下面
    ```
    export AIRFLOW_HOME="$(pwd)"
    ```
- 初始化 Database: Airflow 在運行需要 Database 紀錄每一次跑過的 Task 的結果
    ```
    airflow initdb
    ```
    - Airflow 預設會使用 SQLite

- 啟動 webserver
    ```
    airflow webserver -p 8080
    ```
    - web url: http://localhost:8080
    - web 界面只是一個操作界面, job 主要是靠 scheduler 來執行

- 啟動 Scheduler
    ```
    airflow scheduler
    ```

## Note:

- dag default_args (dict) 不會即時更新, 所以要透過 dag 中設定, 才能即時更新
    - ex: 如下 **schedule_interval** 如果設定在 default_args 啟動 airflow 之後在修改是沒有效的, 但是設定在下面 DAG 中就會即時更改

    ```
    default_args = {
        'owner': 'someone', # DAG 擁有者的名稱，如上一篇說明的，通常是負責實作這個 DAG 的人員名稱
        'depends_on_past': False, # 每一次執行的 Task 是否會依賴於上次執行的 Task，如果是 False 的話，代表上次的 Task 如果執行失敗，這次的 Task 就不會繼續執行
        'start_date': datetime(2020, 11, 1).replace(tzinfo=pendulum.timezone('Asia/Taipei')), # Task 從哪個日期後開始可以被 Scheduler 排入排程
        'email': ['airflow@example.com'], # 如果 Task 執行失敗的話，要寄信給哪些人的 email
        'email_on_failure': False, # 如果 Task 執行失敗的話，是否寄信
        'email_on_retry': False, # 如果 Task 重試的話，是否寄信
        'retries': 0, # 最多重試的次數
        'retry_delay': timedelta(minutes=10), # 每次重試中間的間隔
        # 'end_date': datetime(2020, 2, 29), # Task 從哪個日期後，開始不被 Scheduler 放入排程
        # 'execution_timeout': timedelta(seconds=300), # Task 執行時間的上限
        # 'on_failure_callback': some_function, # Task 執行失敗時，呼叫的 function
        # 'on_success_callback': some_other_function, # Task 執行成功時，呼叫的 function
        # 'on_retry_callback': another_function, # Task 重試時，呼叫的 function
    }

    with DAG(
        'PeakDetection_etl', default_args=default_args schedule_interval='0 6 * * *') as dag:
    ```

## Refernece

- [Airflow 動手玩系列文介紹](https://www.coderbridge.com/series/c012cc1c8f9846359bb9b8940d4c10a8/posts/39013797c3d54e339dec3635c2f0d84c)

- [一段 Airflow 與資料工程的故事：談如何用 Python 追漫畫連載](https://leemeng.tw/a-story-about-airflow-and-data-engineering-using-how-to-use-python-to-catch-up-with-latest-comics-as-an-example.html)

- [利用-crontab-來做-Linux-固定排程](https://code.kpman.cc/2015/02/11/%E5%88%A9%E7%94%A8-crontab-%E4%BE%86%E5%81%9A-Linux-%E5%9B%BA%E5%AE%9A%E6%8E%92%E7%A8%8B/)