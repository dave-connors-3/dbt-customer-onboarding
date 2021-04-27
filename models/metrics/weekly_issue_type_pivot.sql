{% set issues = dbt_utils.get_column_values(table=ref('stg_jafflechats_chats'), column='issue_category') %}

with 

chats as (
    select * from {{ ref('stg_jafflechats_chats') }}
)

select 
    date_trunc('week', chats.chat_started_at) as month, 
    {% for issue in issues %}
    sum(case when issue_category = '{{ issue }}' then 1 else 0 end) as total_{{issue}}_chats,
    {% endfor %}
    count(*) as total_chats

from chats 

group by 1
