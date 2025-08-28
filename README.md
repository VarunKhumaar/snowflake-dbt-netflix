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
<img width="2716" height="1518" alt="image" src="https://github.com/user-attachments/assets/dc8d870c-21c1-4779-9653-df86a6fb8639" />

_Note: Minimal transformations were applied when creating the models, as the focus was on gaining hands-on experience with dbt and Snowflake._

**Ideas/Inspiration**:
- Netflix Data Analysis : [https://www.youtube.com/watch?v=IaA9YNlg5hM](https://www.youtube.com/watch?v=zZVQluYDwYY&t=10427s&ab_channel=DarshilParmar)
- Data source : https://github.com/VarunKhumaar/snowflake-dbt-netflix/blob/main/netflix_titles.xlsx

