CREATE OR REPLACE STORAGE INTEGRATION PBI_Integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = '<AWS_IAM_ROLE_ARN>' -- Put ARN
  STORAGE_ALLOWED_LOCATIONS = ('<S3_BUCKET_PATH>') -- Put path
  COMMENT = 'Optional Comment'

--description Integration Object
desc integration PBI_Integration;

--------------------------------------------------------------------------
Create database PowerBI

Create schema PBI_data;

create table PBI_Dataset(
Year int, Location string, Area int,
Rainfall float, Temperature float, soil_type string,
Irrigation string, yeilds int, Humidity float,
Crops string, price int, Season string

);

select * from PBI_DATASET;

--drop database test

create stage PowerBI.PBI_data.pbi_stage
url = 's3://powerbi-project-file/'
storage_integration = PBI_Integration


copy into PBI_Dataset
from @pbi_stage
file_format = (type=csv field_delimiter=',' skip_header=1 )
on_error = 'continue'


select year, count(*) count
from PBI_DATASET
group by year
order by year;


create table agriculture as 
select * from pbi_dataset

select * from agriculture

update agriculture
set rainfall = 1.1*rainfall;

update agriculture
set area = 0.9*area;


-- Year 2004 to 2009 - Y1
-- Year 20010 to 2009 - Y2
-- Year 2016 to 2019 - Y3

ALTER TABLE AGRICULTURE
add Year_Group string

select * from agriculture

-- 1st Update 
update agriculture
set year_group = 'Y1'
where year >= 2004 and year <= 2009

-- 2nd Update 
update agriculture
set year_group = 'Y2'
where year >= 2010 and year <= 2015

-- 3rd Update 
update agriculture
set year_group = 'Y3'
where year >= 2016 and year <= 2019

select * from agriculture

-- Rainfall Groups 
-- Min 255 and Max 4103

-- Rainfall 255 to 1200 - Low
-- Rainfall 1200 to 2800 - Medium
-- Rainfall 2000 to 4103 - High


Alter table agriculture
add Rainfall_Groups string

update agriculture
set RAINFALL_GROUPS = 'Low'
where rainfall >=255 and rainfall < 1200

update agriculture
set RAINFALL_GROUPS = 'Medium'
where rainfall >= 1200 and rainfall < 2800

update agriculture
set RAINFALL_GROUPS = 'High'
where rainfall >= 2800

select * from agriculture
