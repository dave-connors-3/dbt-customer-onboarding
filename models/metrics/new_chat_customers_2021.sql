with 

chat_users as (
    select * from {{ ref('stg_jafflechats_chat_users')}}
)

select 

    count(*) as total_users

from chat_users

where extract(year from created_at) = 2021