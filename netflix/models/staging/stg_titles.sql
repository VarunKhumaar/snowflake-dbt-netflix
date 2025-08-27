{{ config(materialized = 'table') }}

with cte as (
    select * from {{ source('netflix','r_titles') }} where show_id is not null
)

select * from cte where show_id is not null or date_added is not null

