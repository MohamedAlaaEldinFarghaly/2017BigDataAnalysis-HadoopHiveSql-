-- Violation_Precinct

DROP TABLE IF EXISTS CountingSimilars;
CREATE TABLE IF NOT EXISTS CountingSimilars (Violation_Precinct String,cnt_Violation_Precinct bigint)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

--LOAD DATA INPATH '/user/cloudera/assignment1/input/Sample_train.csv' OVERWRITE INTO TABLE Project;

INSERT INTO table CountingSimilars 
--INSERT OVERWRITE LOCAL DIRECTORY 'output2' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE 
SELECT Violation_Precinct,COUNT(*) AS cnt_Violation_Precinct
FROM Project
WHERE Violation_Precinct <> ''
GROUP BY Violation_Precinct;

INSERT OVERWRITE LOCAL DIRECTORY 'outputQuestion2Answer1Precinct' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE 
SELECT * 
FROM CountingSimilars
SORT BY cnt_Violation_Precinct DESC LIMIT 20;

