with cte as (
    select * from {{ source('netflix','r_category') }} where show_id is not null
)

select * from cte where show_id is not null