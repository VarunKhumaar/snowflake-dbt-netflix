with cte as (
    select * from {{ ref('stg_countries') }} 
)

select * from cte 
where country<>'Australia'