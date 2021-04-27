with 

chats as (
    select * from {{ ref('stg_jafflechats_chats') }}
),

products as (
    select * from {{ ref('stg_jafflechats_products') }}
)

select 
    date_trunc('week', chats.chat_started_at) as week, 
    products.flavor_category,
    count(*) as total_chats
from 
    chats
    join products
        on chats.product_id = products.product_id

group by 1,2