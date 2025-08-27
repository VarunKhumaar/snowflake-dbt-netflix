{% snapshot snap %}

{{
    config(
        target_schema='snapshots',
        unique_key=['show_id','release_year'],
        strategy='check',
        check_cols=['show_id','titles','rating','release_year'], 
        invalidate_hard_deletes=True
    )
}}

SELECT
{{ dbt_utils.generate_surrogate_key(['show_id','release_year']) }} AS row_key,
    show_id,
    titles,
    rating,
    release_year,
    CAST(date_added AS TIMESTAMP_NTZ) AS date_added
FROM {{ ref('titles') }}

{% endsnapshot %}


-- use below to update a record in titles table and then run dbt snapshot to see the changes reflected in snap table
--update titles set rating='R' where titles = 'Black Panther' and show_id = '80201906';;
