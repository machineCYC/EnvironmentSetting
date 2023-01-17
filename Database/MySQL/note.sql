-- show databases
SHOW DATABASES;

-- 新增資料庫
CREATE DATABASE db_name;

-- select database
USE db_name;

-- show all tables
SHOW TABLES;

-- create table
CREATE TABLE table_name (
    col1 VARCHAR(20) NOT NULL,
    col2 VARCHAR(10) NOT NULL,
    col3 BIGINT NOT NULL,
    col4 FLOAT NOT NULL,
    col5 INT NOT NULL,
    col6 INT NOT NULL,
    PRIMARY KEY (col1, col2)
);

-- create table with date partition
CREATE TABLE `JobLoadControl` (
    date DATE NOT NULL DEFAULT CURRENT_DATE,
    crawler_name VARCHAR(50),
    parameter TEXT,
    queue VARCHAR(10),
    process_type VARCHAR(15),
    status VARCHAR(10),
    SYS_CREATE_TIME DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (date, crawler_name, SYS_CREATE_TIME)
)
    PARTITION BY RANGE (to_days(date))(
        PARTITION p20221109 VALUES LESS THAN (to_days('2022-11-09')),
        PARTITION p20221110 VALUES LESS THAN (to_days('2022-11-10')),
        PARTITION pMAX VALUES LESS THAN MAXVALUE
    );

-- update the table partition
-- partition by range
ALTER TABLE JobLoadControl
PARTITION BY RANGE (to_days(date))(
    PARTITION p20221109 VALUES LESS THAN (to_days('2022-11-09')),
    PARTITION p20221110 VALUES LESS THAN (to_days('2022-11-10')),
    PARTITION pMAX VALUES LESS THAN MAXVALUE
);


-- 刪除資料表
DROP TABLE table_name;

-- Import the CSV data into the MySQL table
LOAD DATA INFILE 'file path'
INTO TABLE table_name
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (col1, col2, col3, col4, col5, col6)
;

-- 新增欄位
alter table "Your table name" add "Column name" "Data type"

-- 新增 defalut timestamp 欄位(常用如 sys_update_time 欄位)
ALTER TABLE `employee` ADD `COLUMN` TIMESTAMP on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP

-- 更新資料
UPDATE 'table name' SET `column name` = 'column value' WHERE XXXX

-- 設定時區
SET time_zone = 'Asia/Taipei'

-- get table partition
SELECT * FROM information_schema.partitions WHERE TABLE_SCHEMA='Monitor' AND TABLE_NAME = 'JobLoadControl' AND PARTITION_NAME IS NOT NULL
