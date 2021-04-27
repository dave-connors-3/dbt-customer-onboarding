
with source as (

    select * from {{ source('jaffle_chats', 'chats') }}

),

renamed as (

    select
        -- ids 
        id as chat_id,
        customerid as chat_user_id,
        productid as product_id,

        -- varchar
        category as issue_category,
        
        -- variant
        parse_json(users::variant) as users,
        
        -- timestamps
        started::timestamp_ntz as chat_started_at,
        ended::timestamp_ntz as chat_ended_at,
        created_timestamp::timestamp_ntz as chat_created_at

    from source

)

select * from renamed
