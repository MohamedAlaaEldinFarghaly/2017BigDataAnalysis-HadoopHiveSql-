----------------------------------
DROP TABLE IF EXISTS tempor;
CREATE EXTERNAL TABLE IF NOT EXISTS tempor (Summons_Number STRING,Plate_ID STRING,Registration_State STRING,Plate_Type STRING,Issue_Date STRING,Violation_Code STRING,Vehicle_Body_Type STRING,Vehicle_Make STRING,Issuing_Agency STRING,Street_Code1 STRING,Street_Code2 STRING, Street_Code3 STRING,Vehicle_Expiration_Date STRING,Violation_Location STRING,Violation_Precinct STRING,Issuer_Precinct STRING,Issuer_Code STRING,Issuer_Command STRING,Issuer_Squad STRING, Violation_Time STRING,Time_First_Observed STRING,Violation_County STRING,Violation_In_Front_Of_Or_Opposite STRING,House_Number STRING,Street_Name STRING,Intersecting_Street STRING,Date_First_Observed STRING, Law_Section STRING,Sub_Division STRING,Violation_Legal_Code STRING,Days_Parking_In_Effect STRING,From_Hours_In_Effect STRING,To_Hours_In_Effect STRING,Vehicle_Color STRING,Unregistered_Vehicle STRING, Vehicle_Year STRING,Meter_Number STRING,Feet_From_Curb STRING,Violation_Post_Code STRING,Violation_Description STRING,No_Standing_or_Stopping_Violation STRING,Hydrant_Violation STRING, Double_Parking_Violation STRING,Latitude STRING,Longitude STRING,Community_Board STRING,Community_Council STRING,Census_Tract STRING,BIN STRING,BBL STRING,NTA STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

--LOAD DATA INPATH '/user/cloudera/input/complete2015.csv' OVERWRITE INTO TABLE tempor;
LOAD DATA INPATH '/user/cloudera/input/complete2016.csv' OVERWRITE INTO TABLE tempor;

--DROP TABLE IF EXISTS Project;
CREATE TABLE IF NOT EXISTS Project (Summons_Number STRING,Plate_ID STRING,Registration_State STRING,Plate_Type STRING,Issue_Date STRING,Violation_Code STRING,Vehicle_Body_Type STRING,Vehicle_Make STRING,Issuing_Agency STRING,Street_Code1 STRING,Street_Code2 STRING, Street_Code3 STRING,Vehicle_Expiration_Date STRING,Violation_Location STRING,Violation_Precinct STRING,Issuer_Precinct STRING,Issuer_Code STRING,Issuer_Command STRING,Issuer_Squad STRING, Violation_Time STRING,Time_First_Observed STRING,Violation_County STRING,Violation_In_Front_Of_Or_Opposite STRING,House_Number STRING,Street_Name STRING,Intersecting_Street STRING,Date_First_Observed STRING, Law_Section STRING,Sub_Division STRING,Violation_Legal_Code STRING,Days_Parking_In_Effect STRING,From_Hours_In_Effect STRING,To_Hours_In_Effect STRING,Vehicle_Color STRING,Unregistered_Vehicle STRING, Vehicle_Year STRING,Meter_Number STRING,Feet_From_Curb STRING,Violation_Post_Code STRING,Violation_Description STRING,No_Standing_or_Stopping_Violation STRING,Hydrant_Violation STRING, Double_Parking_Violation STRING,Latitude STRING,Longitude STRING,Community_Board STRING,Community_Council STRING,Census_Tract STRING,BIN STRING,BBL STRING,NTA STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

INSERT INTO table Project 
SELECT *
FROM tempor;
---------------------------------- 
--TESTING ALGO--
--INSERT OVERWRITE LOCAL DIRECTORY 'output3' ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE 
--SELECT *
--FROM Project
--WHERE Summons_Number='7307948242';

