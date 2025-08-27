{{
  config(
    materialized = 'incremental'
  )
}}


with cte as (
    select * from {{ ref('stg_titles') }} where rating is not null
)
select *
from cte  

{% if is_incremental() %}
  where date_added > (SELECT MAX(date_added) FROM {{ this }})
{% endif %}