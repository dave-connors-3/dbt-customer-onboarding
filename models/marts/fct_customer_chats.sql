with 

chats as (
    select * from {{ ref('stg_jafflechats_chats') }}
),

chat_users as (
    select * from {{ ref('stg_jafflechats_chat_users') }}
),

products as (
    select * from {{ ref('stg_jafflechats_products') }}
),

joined as (
    
    select 
        chats.chat_id, 
        chats.chat_user_id, 
        chats.product_id, 
        chat_users.email,
        chat_users.first_name,
        chat_users.last_name,
        chats.issue_category,
        products.flavor,
        products.flavor_category,
        chats.chat_started_at,
        chats.chat_ended_at
    
    from chats 
    left join chat_users 
        on chats.chat_user_id = chat_users.chat_user_id
    left join products 
        on chats.product_id = products.product_id

)

select * from joined