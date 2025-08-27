with cte as (
    select * from {{ ref('stg_directors') }} 
)

select * from cte 