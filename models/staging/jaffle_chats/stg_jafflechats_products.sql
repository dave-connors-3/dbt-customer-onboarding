
with source as (

    select * from {{ source('jaffle_chats', 'product') }}

),

renamed as (

    select
        -- ids
        id as product_id,
        
        -- varchars
        kind as flavor,
        case
            when flavor in ('chocolate', 'strawberry')
                then 'Sweet'
            else 'Savory'
        end flavor_category,
        
        --boolean
        active

    from source

)

select * from renamed
