with orders as (
    select
        order_id,
        customer_id 
    FROM {{ ref('stg_jaffle_shop__orders') }}
),

payment as (
    select
        orderid as order_id,
        amount 
    FROM {{ ref('stg_stripe__payments') }}
),

final as (
    select 
        o.*,
        p.amount
    FROM orders o
    LEFT JOIN payment p
        ON o.order_id = p.order_id
)

select * from final
