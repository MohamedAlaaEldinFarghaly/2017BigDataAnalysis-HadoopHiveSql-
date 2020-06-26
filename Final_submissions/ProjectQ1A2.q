-- Issue_Date_month

DROP TABLE IF EXISTS CountingSimilars;
CREATE TABLE IF NOT EXISTS CountingSimilars (Issue_Date_month String)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

--LOAD DATA INPATH '/user/cloudera/assignment1/input/Sample_train.csv' OVERWRITE INTO TABLE Project;

INSERT INTO table CountingSimilars 
--INSERT OVERWRITE LOCAL DIRECTORY 'output3' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE 
SELECT substr(Issue_Date,1,2) AS Issue_Date_month
FROM Project
WHERE substr(Issue_Date,1,2) < '24' AND substr(Issue_Date,1,2) >= '00';

INSERT OVERWRITE LOCAL DIRECTORY 'outputQuestion1Answer2Month' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE 
SELECT Issue_Date_month,COUNT(*) AS cnt_Issue_Date_month
FROM CountingSimilars
GROUP BY Issue_Date_month
SORT BY cnt_Issue_Date_month DESC LIMIT 24;


