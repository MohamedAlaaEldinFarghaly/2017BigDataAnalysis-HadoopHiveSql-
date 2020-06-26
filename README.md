# BigDataAnalysis-HadoopHiveSql-

## rief problem description
The NYC Department of Finance collects data on every parking ticket issued in NYC (~10M
per year!). This data is made publicly available to aid in ticket resolution and to guide
policymakers.
There are two files, covering 2015 and 2016. The files are roughly organized by fiscal year
(July 1 - June 30) with the exception of the initial dataset.

## The main problem is to answer these question:
1. When are tickets most likely to be issued? Any seasonality?
2. Where are tickets most commonly issued?
3. What are the most common years and types of cars to be ticketed?2. How you made your analysis

## We decided to answer the questions using HIVE as it is optimized and integrated with tools that
can answer our question. the task is divided into parts:
1. The data is not combined in one file and combining them using copy and paste is
impossible as each file is about 2.5 GB. As a result, we need a way to combine them to
import them as a one file into a table inside HIVE.
2. To answer the first question  “When are tickets most likely to be issued? Any
seasonality?”, we need to define which column is responsible for reclaiming time and
date. Then, we sum up among the data for each month and for each hour and take the
maximum number for each of them.
3. To answer the first question  “Where are tickets most commonly issued?”, we need to
define which column is responsible for reclaiming street names and precinct. Then, we
sum up among the data for each street names and for each precinct and take the
maximum number for each of them.
4. To answer the first question  “What are the most common years and types of cars to be
ticketed?”, we need to define which column is responsible for reclaiming types of cars.
Then, we sum up among the data for each types of cars and take the maximum number.
