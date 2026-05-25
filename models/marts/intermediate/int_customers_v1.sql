-- Import CTEs -- los pillamos del linaje

with customers as (
    select * from {{ ref("stg_customers_v1") }}
), 

orders as (
    select * from {{ ref("int_orders_v1") }}
),

customer_orders as (

    select 
        orders.*,
        customers.full_name,
        customers.surname,
        customers.givenname,
        
        -- customer level aggregations
        min(orders.order_date) over (
            partition by orders.customer_id
        ) as customer_first_order_date,

        min(valid_order_date) over (
            partition by orders.customer_id
        ) as customer_first_non_returned_order_date,

        max(valid_order_date) over (
            partition by orders.customer_id
        ) as customer_most_recent_non_returned_order_date,

        count(*) over (
            partition by orders.customer_id
        ) as customer_order_count,

        sum(
            nvl2(orders.valid_order_date, 1, 0)
        ) over (
            partition by orders.customer_id
        ) as customer_non_returned_order_count,

        sum(
            nvl2(orders.valid_order_date, orders.order_value_dollars, 0)
        )  over (
            partition by orders.customer_id
        ) as customer_total_lifetime_value,

        array_agg(orders.order_id) over (
            partition by orders.customer_id
        )  as customer_order_ids

    from orders
    inner join customers on orders.customer_id= customers.customer_id


),

customer_average_order_values as ( 
    select 
        *,
        {{ function('safe_divide')}} (
            customer_total_lifetime_value, 
            customer_non_returned_order_count
        ) as avg_non_returned_value -- safe divide by zero

    from customer_orders

)

select * from customer_average_order_values