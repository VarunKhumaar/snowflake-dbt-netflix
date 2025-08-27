-- Snowflake user creation
-- Step 1: Use an admin role
USE ROLE ACCOUNTADMIN;

-- Step 2: Create the `transform` role and assign it to ACCOUNTADMIN
CREATE ROLE IF NOT EXISTS TRANSFORM;
GRANT ROLE TRANSFORM TO ROLE ACCOUNTADMIN;

-- Step 3: Create a default warehouse
CREATE WAREHOUSE IF NOT EXISTS COMPUTE_WH;
GRANT OPERATE ON WAREHOUSE COMPUTE_WH TO ROLE TRANSFORM;

-- Step 4: Create the `dbt` user and assign to the transform role
CREATE USER IF NOT EXISTS dbt
  PASSWORD='****************'
  LOGIN_NAME='dbt'
  MUST_CHANGE_PASSWORD=FALSE
  DEFAULT_WAREHOUSE='COMPUTE_WH'
  DEFAULT_ROLE=TRANSFORM
  DEFAULT_NAMESPACE='NETFLIX.RAW'
  COMMENT='DBT user used for data transformation';
ALTER USER dbt SET TYPE = LEGACY_SERVICE;
GRANT ROLE TRANSFORM TO USER dbt;

-- Step 5: Create a database and schema for the netflix project
CREATE DATABASE IF NOT EXISTS NETFLIX;
CREATE SCHEMA IF NOT EXISTS NETFLIX.RAW;



-- Step 6: Grant permissions to the `transform` role
GRANT ALL ON WAREHOUSE COMPUTE_WH TO ROLE TRANSFORM;
GRANT ALL ON DATABASE NETFLIX TO ROLE TRANSFORM;
GRANT ALL ON ALL SCHEMAS IN DATABASE NETFLIX TO ROLE TRANSFORM;
GRANT ALL ON FUTURE SCHEMAS IN DATABASE NETFLIX TO ROLE TRANSFORM;
GRANT ALL ON ALL TABLES IN SCHEMA NETFLIX.RAW TO ROLE TRANSFORM;
GRANT ALL ON FUTURE TABLES IN SCHEMA NETFLIX.RAW TO ROLE TRANSFORM;


-- Step 7: Create a stage to load data from S3
CREATE STAGE netflixstage
  URL='*****************************'
  CREDENTIALS=(AWS_KEY_ID='*****************' AWS_SECRET_KEY='************************************');

-- Step 8: Load data into raw tables
-- Load raw_titles
CREATE OR REPLACE TABLE raw_titles (
   duration_minutes     INTEGER
  ,duration_seasons     INTEGER
  ,type                 STRING
  ,titles               STRING
  ,date_added           date
  ,release_year         INTEGER
  ,rating               STRING
  ,description          STRING
  ,show_id              INTEGER
);
COPY INTO raw_titles
FROM '@netflixstage/titles.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"' DATE_FORMAT = 'DD/MM/YYYY');


-- Load raw_cast
CREATE OR REPLACE TABLE raw_cast (
   cast                 STRING
  ,show_id              INTEGER
);
COPY INTO raw_cast
FROM '@netflixstage/cast.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');


-- Load raw_category
CREATE OR REPLACE TABLE raw_category (
   listed_in            STRING
  ,show_id              INTEGER
);
COPY INTO raw_category
FROM '@netflixstage/category.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');


-- Load raw_countries
CREATE OR REPLACE TABLE raw_countries (
   country              STRING
  ,show_id              INTEGER
);
COPY INTO raw_countries
FROM '@netflixstage/countries.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');


-- Load raw_directors
CREATE OR REPLACE TABLE raw_directors (
   director             STRING
  ,show_id              INTEGER
);
COPY INTO raw_directors
FROM '@netflixstage/directors.csv'
FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1 FIELD_OPTIONALLY_ENCLOSED_BY = '"');



--  dbt setup commands
-- install virtual env
python3 -m pip install virtualenv
-- create virtual env
python3 -m venv venv
-- activate and enter venv
source venv/bin/activate
-- install dbt and snowflake connector
pip install dbt-snowflake==1.9.0

-- create dbt profile
-- mac
mkdir ~/.dbt
--initiate dbt project 
dbt init netflix