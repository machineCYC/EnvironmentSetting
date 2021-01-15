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

-- Import the CSV data into the MySQL table
LOAD DATA LOCAL INFILE 'file path' 
INTO TABLE table_name 
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (col1, col2, col3, col4, col5, col6)
;