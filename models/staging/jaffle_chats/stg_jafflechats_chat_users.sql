with source as (

    select * from {{ source('jaffle_chats', 'chatusers') }}

),

renamed as (

    select
        id,
        customertypeid,
        _profile_id_,
        firstname,
        last_name,
        email,
        ip_address,
        created

    from source

)

select * from renamed