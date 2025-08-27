# Neflix | Snowflake-Dbt-Data-Engg-pipeline

**Architecture**:

**Summary**
- Using Azure Data Factory performed data ingestion for Airbnb dataset to load the raw data into Data Lake Gen 2 container
- Performed data transformations on the raw dataset using Azure Databricks
- Loaded the transformed data back to Data Lake Gen 2
- Loaded the dataset to Azure Synapse to perform analysis using SQL
- Finally, connected the table in Azure Synapse to Tableau

**Final Dashboard**: https://public.tableau.com/app/profile/varunkhumaar/viz/Netflixsnowflake-dbt/Dashboard

_Note: The entire pipeline can be built in one of the Azure services itself, but different services have been used here just to get an understanding and hands-on experience with popular Azure products._

**Ideas/Inspiration**:
- Netflix Data Analysis : [https://www.youtube.com/watch?v=IaA9YNlg5hM](https://www.youtube.com/watch?v=zZVQluYDwYY&t=10427s&ab_channel=DarshilParmar)

**Data Source**: http://insideairbnb.com/get-the-data/

