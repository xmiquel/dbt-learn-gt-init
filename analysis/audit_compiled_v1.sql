
------------------------------------------------------------------------------
-- Compare column values
------------------------------------------------------------------------------

    /*  Create a query combining results from all columns so that the user, or the 
    test suite, can examine all at once.
    */
    
    

    /*  Create a CTE that wraps all the unioned subqueries that are created
        in this for loop
    */
      with main as ( 

    

    /*  There will be one audit_query subquery for each column
    */
    ( with a_query as (
          
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`customer_orders_legacy_v1`
  
),

b_query as (
    
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`fct_customer_orders_v1`
  
)
    select
        coalesce(a_query.dbt_audit_helper_pk, b_query.dbt_audit_helper_pk) as primary_key,

        
            'order_id' as column_name,
        

        coalesce(
            a_query.order_id = b_query.order_id and 
                a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null,
            (a_query.order_id is null and b_query.order_id is null),
            false
        ) as perfect_match,
        a_query.order_id is null and a_query.dbt_audit_helper_pk is not null as null_in_a,
        b_query.order_id is null and b_query.dbt_audit_helper_pk is not null as null_in_b,
        a_query.dbt_audit_helper_pk is null as missing_from_a,
        b_query.dbt_audit_helper_pk is null as missing_from_b,
        coalesce(
            a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null and 
            -- ensure that neither value is missing before considering it a conflict
            (
                a_query.order_id != b_query.order_id or -- two not-null values that do not match
                (a_query.order_id is not null and b_query.order_id is null) or -- null in b and not null in a
                (a_query.order_id is null and b_query.order_id is not null) -- null in a and not null in b
            ), 
            false
        ) as conflicting_values
        -- considered a conflict if the values do not match AND at least one of the values is not null.

    from a_query

    full outer join b_query on (a_query.dbt_audit_helper_pk = b_query.dbt_audit_helper_pk)



 )

    

      union all

    

  

    

    /*  Create a query combining results from all columns so that the user, or the 
    test suite, can examine all at once.
    */
    
    

    /*  There will be one audit_query subquery for each column
    */
    ( with a_query as (
          
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`customer_orders_legacy_v1`
  
),

b_query as (
    
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`fct_customer_orders_v1`
  
)
    select
        coalesce(a_query.dbt_audit_helper_pk, b_query.dbt_audit_helper_pk) as primary_key,

        
            'customer_id' as column_name,
        

        coalesce(
            a_query.customer_id = b_query.customer_id and 
                a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null,
            (a_query.customer_id is null and b_query.customer_id is null),
            false
        ) as perfect_match,
        a_query.customer_id is null and a_query.dbt_audit_helper_pk is not null as null_in_a,
        b_query.customer_id is null and b_query.dbt_audit_helper_pk is not null as null_in_b,
        a_query.dbt_audit_helper_pk is null as missing_from_a,
        b_query.dbt_audit_helper_pk is null as missing_from_b,
        coalesce(
            a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null and 
            -- ensure that neither value is missing before considering it a conflict
            (
                a_query.customer_id != b_query.customer_id or -- two not-null values that do not match
                (a_query.customer_id is not null and b_query.customer_id is null) or -- null in b and not null in a
                (a_query.customer_id is null and b_query.customer_id is not null) -- null in a and not null in b
            ), 
            false
        ) as conflicting_values
        -- considered a conflict if the values do not match AND at least one of the values is not null.

    from a_query

    full outer join b_query on (a_query.dbt_audit_helper_pk = b_query.dbt_audit_helper_pk)



 )

    

      union all

    

  

    

    /*  Create a query combining results from all columns so that the user, or the 
    test suite, can examine all at once.
    */
    
    

    /*  There will be one audit_query subquery for each column
    */
    ( with a_query as (
          
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`customer_orders_legacy_v1`
  
),

b_query as (
    
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`fct_customer_orders_v1`
  
)
    select
        coalesce(a_query.dbt_audit_helper_pk, b_query.dbt_audit_helper_pk) as primary_key,

        
            'surname' as column_name,
        

        coalesce(
            a_query.surname = b_query.surname and 
                a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null,
            (a_query.surname is null and b_query.surname is null),
            false
        ) as perfect_match,
        a_query.surname is null and a_query.dbt_audit_helper_pk is not null as null_in_a,
        b_query.surname is null and b_query.dbt_audit_helper_pk is not null as null_in_b,
        a_query.dbt_audit_helper_pk is null as missing_from_a,
        b_query.dbt_audit_helper_pk is null as missing_from_b,
        coalesce(
            a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null and 
            -- ensure that neither value is missing before considering it a conflict
            (
                a_query.surname != b_query.surname or -- two not-null values that do not match
                (a_query.surname is not null and b_query.surname is null) or -- null in b and not null in a
                (a_query.surname is null and b_query.surname is not null) -- null in a and not null in b
            ), 
            false
        ) as conflicting_values
        -- considered a conflict if the values do not match AND at least one of the values is not null.

    from a_query

    full outer join b_query on (a_query.dbt_audit_helper_pk = b_query.dbt_audit_helper_pk)



 )

    

      union all

    

  

    

    /*  Create a query combining results from all columns so that the user, or the 
    test suite, can examine all at once.
    */
    
    

    /*  There will be one audit_query subquery for each column
    */
    ( with a_query as (
          
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`customer_orders_legacy_v1`
  
),

b_query as (
    
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`fct_customer_orders_v1`
  
)
    select
        coalesce(a_query.dbt_audit_helper_pk, b_query.dbt_audit_helper_pk) as primary_key,

        
            'givenname' as column_name,
        

        coalesce(
            a_query.givenname = b_query.givenname and 
                a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null,
            (a_query.givenname is null and b_query.givenname is null),
            false
        ) as perfect_match,
        a_query.givenname is null and a_query.dbt_audit_helper_pk is not null as null_in_a,
        b_query.givenname is null and b_query.dbt_audit_helper_pk is not null as null_in_b,
        a_query.dbt_audit_helper_pk is null as missing_from_a,
        b_query.dbt_audit_helper_pk is null as missing_from_b,
        coalesce(
            a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null and 
            -- ensure that neither value is missing before considering it a conflict
            (
                a_query.givenname != b_query.givenname or -- two not-null values that do not match
                (a_query.givenname is not null and b_query.givenname is null) or -- null in b and not null in a
                (a_query.givenname is null and b_query.givenname is not null) -- null in a and not null in b
            ), 
            false
        ) as conflicting_values
        -- considered a conflict if the values do not match AND at least one of the values is not null.

    from a_query

    full outer join b_query on (a_query.dbt_audit_helper_pk = b_query.dbt_audit_helper_pk)



 )

    

      union all

    

  

    

    /*  Create a query combining results from all columns so that the user, or the 
    test suite, can examine all at once.
    */
    
    

    /*  There will be one audit_query subquery for each column
    */
    ( with a_query as (
          
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`customer_orders_legacy_v1`
  
),

b_query as (
    
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`fct_customer_orders_v1`
  
)
    select
        coalesce(a_query.dbt_audit_helper_pk, b_query.dbt_audit_helper_pk) as primary_key,

        
            'first_order_date' as column_name,
        

        coalesce(
            a_query.first_order_date = b_query.first_order_date and 
                a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null,
            (a_query.first_order_date is null and b_query.first_order_date is null),
            false
        ) as perfect_match,
        a_query.first_order_date is null and a_query.dbt_audit_helper_pk is not null as null_in_a,
        b_query.first_order_date is null and b_query.dbt_audit_helper_pk is not null as null_in_b,
        a_query.dbt_audit_helper_pk is null as missing_from_a,
        b_query.dbt_audit_helper_pk is null as missing_from_b,
        coalesce(
            a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null and 
            -- ensure that neither value is missing before considering it a conflict
            (
                a_query.first_order_date != b_query.first_order_date or -- two not-null values that do not match
                (a_query.first_order_date is not null and b_query.first_order_date is null) or -- null in b and not null in a
                (a_query.first_order_date is null and b_query.first_order_date is not null) -- null in a and not null in b
            ), 
            false
        ) as conflicting_values
        -- considered a conflict if the values do not match AND at least one of the values is not null.

    from a_query

    full outer join b_query on (a_query.dbt_audit_helper_pk = b_query.dbt_audit_helper_pk)



 )

    

      union all

    

  

    

    /*  Create a query combining results from all columns so that the user, or the 
    test suite, can examine all at once.
    */
    
    

    /*  There will be one audit_query subquery for each column
    */
    ( with a_query as (
          
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`customer_orders_legacy_v1`
  
),

b_query as (
    
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`fct_customer_orders_v1`
  
)
    select
        coalesce(a_query.dbt_audit_helper_pk, b_query.dbt_audit_helper_pk) as primary_key,

        
            'order_count' as column_name,
        

        coalesce(
            a_query.order_count = b_query.order_count and 
                a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null,
            (a_query.order_count is null and b_query.order_count is null),
            false
        ) as perfect_match,
        a_query.order_count is null and a_query.dbt_audit_helper_pk is not null as null_in_a,
        b_query.order_count is null and b_query.dbt_audit_helper_pk is not null as null_in_b,
        a_query.dbt_audit_helper_pk is null as missing_from_a,
        b_query.dbt_audit_helper_pk is null as missing_from_b,
        coalesce(
            a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null and 
            -- ensure that neither value is missing before considering it a conflict
            (
                a_query.order_count != b_query.order_count or -- two not-null values that do not match
                (a_query.order_count is not null and b_query.order_count is null) or -- null in b and not null in a
                (a_query.order_count is null and b_query.order_count is not null) -- null in a and not null in b
            ), 
            false
        ) as conflicting_values
        -- considered a conflict if the values do not match AND at least one of the values is not null.

    from a_query

    full outer join b_query on (a_query.dbt_audit_helper_pk = b_query.dbt_audit_helper_pk)



 )

    

      union all

    

  

    

    /*  Create a query combining results from all columns so that the user, or the 
    test suite, can examine all at once.
    */
    
    

    /*  There will be one audit_query subquery for each column
    */
    ( with a_query as (
          
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`customer_orders_legacy_v1`
  
),

b_query as (
    
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`fct_customer_orders_v1`
  
)
    select
        coalesce(a_query.dbt_audit_helper_pk, b_query.dbt_audit_helper_pk) as primary_key,

        
            'total_lifetime_value' as column_name,
        

        coalesce(
            a_query.total_lifetime_value = b_query.total_lifetime_value and 
                a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null,
            (a_query.total_lifetime_value is null and b_query.total_lifetime_value is null),
            false
        ) as perfect_match,
        a_query.total_lifetime_value is null and a_query.dbt_audit_helper_pk is not null as null_in_a,
        b_query.total_lifetime_value is null and b_query.dbt_audit_helper_pk is not null as null_in_b,
        a_query.dbt_audit_helper_pk is null as missing_from_a,
        b_query.dbt_audit_helper_pk is null as missing_from_b,
        coalesce(
            a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null and 
            -- ensure that neither value is missing before considering it a conflict
            (
                a_query.total_lifetime_value != b_query.total_lifetime_value or -- two not-null values that do not match
                (a_query.total_lifetime_value is not null and b_query.total_lifetime_value is null) or -- null in b and not null in a
                (a_query.total_lifetime_value is null and b_query.total_lifetime_value is not null) -- null in a and not null in b
            ), 
            false
        ) as conflicting_values
        -- considered a conflict if the values do not match AND at least one of the values is not null.

    from a_query

    full outer join b_query on (a_query.dbt_audit_helper_pk = b_query.dbt_audit_helper_pk)



 )

    

      union all

    

  

    

    /*  Create a query combining results from all columns so that the user, or the 
    test suite, can examine all at once.
    */
    
    

    /*  There will be one audit_query subquery for each column
    */
    ( with a_query as (
          
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`customer_orders_legacy_v1`
  
),

b_query as (
    
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`fct_customer_orders_v1`
  
)
    select
        coalesce(a_query.dbt_audit_helper_pk, b_query.dbt_audit_helper_pk) as primary_key,

        
            'order_value_dollars' as column_name,
        

        coalesce(
            a_query.order_value_dollars = b_query.order_value_dollars and 
                a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null,
            (a_query.order_value_dollars is null and b_query.order_value_dollars is null),
            false
        ) as perfect_match,
        a_query.order_value_dollars is null and a_query.dbt_audit_helper_pk is not null as null_in_a,
        b_query.order_value_dollars is null and b_query.dbt_audit_helper_pk is not null as null_in_b,
        a_query.dbt_audit_helper_pk is null as missing_from_a,
        b_query.dbt_audit_helper_pk is null as missing_from_b,
        coalesce(
            a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null and 
            -- ensure that neither value is missing before considering it a conflict
            (
                a_query.order_value_dollars != b_query.order_value_dollars or -- two not-null values that do not match
                (a_query.order_value_dollars is not null and b_query.order_value_dollars is null) or -- null in b and not null in a
                (a_query.order_value_dollars is null and b_query.order_value_dollars is not null) -- null in a and not null in b
            ), 
            false
        ) as conflicting_values
        -- considered a conflict if the values do not match AND at least one of the values is not null.

    from a_query

    full outer join b_query on (a_query.dbt_audit_helper_pk = b_query.dbt_audit_helper_pk)



 )

    

      union all

    

  

    

    /*  Create a query combining results from all columns so that the user, or the 
    test suite, can examine all at once.
    */
    
    

    /*  There will be one audit_query subquery for each column
    */
    ( with a_query as (
          
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`customer_orders_legacy_v1`
  
),

b_query as (
    
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`fct_customer_orders_v1`
  
)
    select
        coalesce(a_query.dbt_audit_helper_pk, b_query.dbt_audit_helper_pk) as primary_key,

        
            'order_status' as column_name,
        

        coalesce(
            a_query.order_status = b_query.order_status and 
                a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null,
            (a_query.order_status is null and b_query.order_status is null),
            false
        ) as perfect_match,
        a_query.order_status is null and a_query.dbt_audit_helper_pk is not null as null_in_a,
        b_query.order_status is null and b_query.dbt_audit_helper_pk is not null as null_in_b,
        a_query.dbt_audit_helper_pk is null as missing_from_a,
        b_query.dbt_audit_helper_pk is null as missing_from_b,
        coalesce(
            a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null and 
            -- ensure that neither value is missing before considering it a conflict
            (
                a_query.order_status != b_query.order_status or -- two not-null values that do not match
                (a_query.order_status is not null and b_query.order_status is null) or -- null in b and not null in a
                (a_query.order_status is null and b_query.order_status is not null) -- null in a and not null in b
            ), 
            false
        ) as conflicting_values
        -- considered a conflict if the values do not match AND at least one of the values is not null.

    from a_query

    full outer join b_query on (a_query.dbt_audit_helper_pk = b_query.dbt_audit_helper_pk)



 )

    

      union all

    

  

    

    /*  Create a query combining results from all columns so that the user, or the 
    test suite, can examine all at once.
    */
    
    

    /*  There will be one audit_query subquery for each column
    */
    ( with a_query as (
          
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`customer_orders_legacy_v1`
  
),

b_query as (
    
    select
      *,
      order_id as dbt_audit_helper_pk
    from `analytics`.`dbt_bhipple`.`fct_customer_orders_v1`
  
)
    select
        coalesce(a_query.dbt_audit_helper_pk, b_query.dbt_audit_helper_pk) as primary_key,

        
            'payment_status' as column_name,
        

        coalesce(
            a_query.payment_status = b_query.payment_status and 
                a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null,
            (a_query.payment_status is null and b_query.payment_status is null),
            false
        ) as perfect_match,
        a_query.payment_status is null and a_query.dbt_audit_helper_pk is not null as null_in_a,
        b_query.payment_status is null and b_query.dbt_audit_helper_pk is not null as null_in_b,
        a_query.dbt_audit_helper_pk is null as missing_from_a,
        b_query.dbt_audit_helper_pk is null as missing_from_b,
        coalesce(
            a_query.dbt_audit_helper_pk is not null and b_query.dbt_audit_helper_pk is not null and 
            -- ensure that neither value is missing before considering it a conflict
            (
                a_query.payment_status != b_query.payment_status or -- two not-null values that do not match
                (a_query.payment_status is not null and b_query.payment_status is null) or -- null in b and not null in a
                (a_query.payment_status is null and b_query.payment_status is not null) -- null in a and not null in b
            ), 
            false
        ) as conflicting_values
        -- considered a conflict if the values do not match AND at least one of the values is not null.

    from a_query

    full outer join b_query on (a_query.dbt_audit_helper_pk = b_query.dbt_audit_helper_pk)



 )

    

    ),

        final as (
          select
            upper(column_name) as column_name,
            sum(case when perfect_match then 1 else 0 end) as perfect_match,
            sum(case when null_in_a then 1 else 0 end) as null_in_a,
            sum(case when null_in_b then 1 else 0 end) as null_in_b,
            sum(case when missing_from_a then 1 else 0 end) as missing_from_a,
            sum(case when missing_from_b then 1 else 0 end) as missing_from_b,
            sum(case when conflicting_values then 1 else 0 end) as conflicting_values
          from main
          group by 1
          order by column_name
        )

      --select * from final

      select * from main
      where column_name='order_value_dollars'
      and perfect_match = false
order by 1    
    

  
    
with legacy as (
    select order_id,
    order_value_dollars
    from {{ ref('customer_orders_legacy_v1') }}
),

refactored as (
    select order_id, 
    order_value_dollars
    from {{ ref('fct_customer_orders_v1') }}
)

select coalesce(l.order_id, r.order_id) as order_id, 
       coalesce(l.order_value_dollars, r.order_value_dollars) as order_value_dollars,
       coalesce(r.order_value_dollars, l.order_value_dollars) as order_value_dollars,
       (l.order_id is not null) as in_legacy,
       (r.order_id is not null) as in_refactored       
  from legacy l full outer join refactored r on l.order_id=r.order_id
   and l.order_value_dollars=r.order_value_dollars
where (l.order_id is not null) != (r.order_id is not null)
order by coalesce(l.order_id, r.order_id), (l.order_id is not null) 

