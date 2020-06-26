-- Vehicle_Body_Type

DROP TABLE IF EXISTS CountingSimilars;
CREATE TABLE IF NOT EXISTS CountingSimilars (Vehicle_Body_Type String,cnt_Vehicle_Body_Type bigint)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

--LOAD DATA INPATH '/user/cloudera/assignment1/input/Sample_train.csv' OVERWRITE INTO TABLE Project;

INSERT INTO table CountingSimilars 
--INSERT OVERWRITE LOCAL DIRECTORY 'output2' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE 
SELECT Vehicle_Body_Type,COUNT(*) AS cnt_Vehicle_Body_Type
FROM Project
WHERE Vehicle_Body_Type <> ''
GROUP BY Vehicle_Body_Type;

INSERT OVERWRITE LOCAL DIRECTORY 'outputQuestion3Vehicle' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE 
SELECT * 
FROM CountingSimilars
SORT BY cnt_Vehicle_Body_Type DESC LIMIT 20;

