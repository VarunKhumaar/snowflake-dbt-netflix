with cte as (
    select * from {{ ref('stg_cast') }} 
)

select * from cte 