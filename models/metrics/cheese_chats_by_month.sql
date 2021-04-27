with 

chats as (
    select * from {{ ref('stg_jafflechats_chats') }}
),

products as (
    select * from {{ ref('stg_jafflechats_products') }}
)

select 
    date_trunc('month', chats.chat_started_at) as month, 
    count(*) as total_chats
from 
    chats
    join products
        on chats.product_id = products.product_id
where 
    products.flavor = 'cheese'

group by 1