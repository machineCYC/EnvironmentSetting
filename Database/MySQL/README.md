# MySQL

## 安裝

- [安裝文件](https://github.com/machineCYC/EnvironmentSetting/blob/master/Database/MySQL/INSTALL.md)

## 指令

- terminal 登入 mysql server, 然後在輸入密碼
    ```
    mysql -u user_name -p
    ```

## DB schema-設計原則

- 不同的型態存在資料庫的容量大小會不同，因此在設計上需要先估算此張表寫入的資料量大小，再決定使用什麼型態，而不是一昧的使用最大型態。
- CREATE TABLE 時就應該設定 COLLATE=utf8mb4_unicode_ci(或者是其他編碼)，不需要再針對 column 做 COLLATE 的設定。
    - 主要原因是當未來 DBA 需要協助調整 COLLATE 設定時，還要再進 column 改一次，會增加調整的成本。
- 欄位如果非必填，建議都是以預設空字串或 0 為主，盡量不要 DEFAULT NULL。
    - 原因是 InnoDB 會把需要的空間畫進去 data page (16K) 裡面，但是 Null 只是一個 flag ，當 NULL 被寫入值的時候，需要把整筆記錄搬一個新的位置，會造成 Data fragmentation。
- 建立索引 (Index)
    - MySQL 中，索引都是以 B+Tree 的方式儲存，這種結構可以在查詢時針對鍵值快速找出資料。因此，如果 Table 中會被拿來當搜尋依據的特定欄位，都需要加上索引（Index）

### type

- 字串的設計: char 或 varchar
    - char 通常確定長度，長度不足還是會用空白填滿
    - varchar 不確定長度
    - VARCHAR 超過 255 的話, 標識字串長度需要用到 2 bytes
    - 儲存大小會根據編碼決定，utf8 編碼要 * 3，utf8mb4 要 * 4


## Reference

- [mysql-db-schema-設計原則](https://blog.johnsonlu.org/mysql-db-schema-%E8%A8%AD%E8%A8%88%E5%8E%9F%E5%89%87/)

- [mysql 官方文件](https://dev.mysql.com/doc/)

- [MySQL Partitioning 優化之路](https://medium.com/17live-tech/mysql-partitioning-%E5%84%AA%E5%8C%96%E4%B9%8B%E8%B7%AF-fd8e8480789b)

- [RDB Query Optimization-postgres-sql](https://blog.douenergy.com/what-is-the-postgres-sql-game-plan-i/)