-- Street_Name

DROP TABLE IF EXISTS CountingSimilars;
CREATE TABLE IF NOT EXISTS CountingSimilars (Street_Name String,cnt_Street_Name bigint)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

--LOAD DATA INPATH '/user/cloudera/assignment1/input/Sample_train.csv' OVERWRITE INTO TABLE Project;

INSERT INTO table CountingSimilars 
--INSERT OVERWRITE LOCAL DIRECTORY 'output2' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE 
SELECT Street_Name,COUNT(*) AS cnt_Street_Name
FROM Project
WHERE Street_Name <> ''
GROUP BY Street_Name;

INSERT OVERWRITE LOCAL DIRECTORY 'outputQuestion2Answer2Street' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE 
SELECT * 
FROM CountingSimilars
SORT BY cnt_Street_Name DESC LIMIT 20;


