
with source as (

    select * from {{ source('jaffle_chats', 'product') }}

),

renamed as (

    select
        id,
        kind,
        active

    from source

)

select * from renamed
