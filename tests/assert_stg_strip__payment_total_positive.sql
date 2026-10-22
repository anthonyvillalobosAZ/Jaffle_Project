select
    order_id,
    sum(payment_amount) as total_amount
FROM {{ ref('stg_stripe__payments') }}
GROUP BY order_id
HAVING sum(payment_amount) < 0