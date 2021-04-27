with source as (

    select * from {{ source('jaffle_chats', 'chatusers') }}

),

renamed as (

    select
        -- ids
        id as chat_user_id,
        customertypeid as customer_type_id,
        _profile_id_ as profile_id,
        
        -- varchar
        firstname as first_name,
        last_name,
        email,
        ip_address,

        -- timestamps
        created::timestamp_ntz as created_at

    from source

)

select * from renamed