with cte as (
    select * from {{ ref('stg_category') }} 
)

select * from cte 