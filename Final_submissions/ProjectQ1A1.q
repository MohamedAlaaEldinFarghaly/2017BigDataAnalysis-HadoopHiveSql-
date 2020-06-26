-- Violation_Time_hour

DROP TABLE IF EXISTS CountingSimilars;
CREATE TABLE IF NOT EXISTS CountingSimilars (Violation_Time_hour String,PA String)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

--LOAD DATA INPATH '/user/cloudera/assignment1/input/Sample_train.csv' OVERWRITE INTO TABLE Project;

INSERT INTO table CountingSimilars 
--INSERT OVERWRITE LOCAL DIRECTORY 'output3' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE 
SELECT substr(Violation_Time,1,2) AS Violation_Time_hour,substr(Violation_Time,5,1) AS PA
FROM Project
WHERE substr(Violation_Time,1,2) < '24' AND substr(Violation_Time,1,2) >= '00';

INSERT OVERWRITE LOCAL DIRECTORY 'outputQuestion1Answer1hour' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE 
SELECT Violation_Time_hour,PA,COUNT(*) AS cnt_Violation_Time_hour
FROM CountingSimilars
GROUP BY Violation_Time_hour,PA
SORT BY cnt_Violation_Time_hour DESC LIMIT 24;


