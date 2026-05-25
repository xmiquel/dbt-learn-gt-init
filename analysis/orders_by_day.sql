with orders as (

    select * from {{ ref('stg_orders_v1') }}

),

daily as (

    select 
        order_date,
        count(*) as order_num,
        {% for order_status in ['returned','completed','return_pending'] %}
            sum(
                case
                    when order_status = '{{ order_status }}'
                    then 1
                    else 0
                end
            ) as {{ order_status }}_total {{ ',' if not loop.last }}
        {% endfor %}
    from orders
    group by order_date

),

compared as (

    select *, lag(order_num) over (order by order_date) as prev_day_orders
    from daily
)

select * from compared
