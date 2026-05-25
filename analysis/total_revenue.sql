with payments as ( 
    
    select * from {{ ref('stg_payments_v1') }} 
), 

aggregated as ( 
    
    select sum(payment_amount) as total_revenue 
    from payments 
    where payment_status = 'success' 
) 

select * from aggregated