# Neflix | Snowflake-Dbt-Data-Engg-pipeline
This project demonstrates an end-to-end Netflix data pipeline using AWS S3, Snowflake, dbt, and Tableau.

**Architecture**:
<img width="1399" height="573" alt="image" src="https://github.com/user-attachments/assets/82249546-1de2-4a17-943f-e6d53027dcba" />

**Summary**
- Raw ingestion from S3 to Snowflake
- dbt models for staging, and reporting layers
- Incremental models, snapshots (SCD Type 2), ephemeral, seeds, sources, schema testing, and documentations
- Tableau dashboard built on the curated reporting layer

**Final Dashboard**: https://public.tableau.com/app/profile/varunkhumaar/viz/Netflixsnowflake-dbt/Dashboard

_Note: Minimal transformations are applied while creating the models - just to get an understanding and hands-on experience with dbt and snowflake._

**Ideas/Inspiration**:
- Netflix Data Analysis : [https://www.youtube.com/watch?v=IaA9YNlg5hM](https://www.youtube.com/watch?v=zZVQluYDwYY&t=10427s&ab_channel=DarshilParmar)


