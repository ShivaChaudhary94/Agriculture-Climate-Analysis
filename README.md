# Agricultural Climate & Yield Analysis 🌾📊

## Project Overview
This project demonstrates an end-to-end cloud-based data analytics pipeline using AWS S3, Snowflake, and Power BI. 
The objective is to analyze rainfall, temperature, humidity, and crop yield data across years, seasons, crops, and locations.

## Architecture
Dataset → AWS S3 → Snowflake → Power BI

## Tools & Technologies
- AWS S3
- AWS IAM
- Snowflake
- SQL
- Power BI

## Implementation Steps
1. Uploaded raw dataset to AWS S3.
2. Created IAM role and integrated Snowflake with S3.
3. Loaded data into Snowflake and performed SQL-based data transformations.
4. Connected Power BI to Snowflake for visualization.
5. Built interactive dashboards for:
   - Rainfall Analysis
   - Temperature Analysis
   - Humidity Analysis
   - Yield Analysis

## Dashboards
Screenshots of dashboards are available in the `powerbi/dashboard_screenshots` folder.

## Key Learnings
- Cloud data pipeline design
- Secure data access using IAM roles
- SQL analytics in Snowflake
- Data visualization with Power BI
