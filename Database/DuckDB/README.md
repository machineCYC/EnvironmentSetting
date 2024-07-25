# DuckDB

## Install

    - install duckdb cli in linux
        ```
        wget https://github.com/duckdb/duckdb/releases/download/v1.0.0/duckdb_cli-linux-amd64.zip

        unzip duckdb_cli-linux-amd64.zip

        # validate install the duckdb cli successfully
        ./duckdb --version
        ```

## 指令

    - 執行 duckdb
        ```
        ./duckdb
        ```

    - create table from a file
        ```
        CREATE TABLE tmp AS
        FROM read_csv('netflix_daily_top_10.csv');
        ```

    - export database, and it will generate a memory folder to save all the data and schema, memory is the default database name
        ```
        EXPORT DATABASE 'memory';
        ```

    - import the exist database
        ```
        IMPORT DATABASE 'memory'
        ```

    - open persistent database
        ```
        ./duckdb my_database.duckdb
        ```

    - exit the duckdb cli
        ```
        .exit
        ```

## Reference

 - [DuckDB Document](https://duckdb.org/docs/installation/?version=stable&environment=cli&platform=linux&download_method=package_manager)