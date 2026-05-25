------------------------------------------------------------------------------
-- Compare row counts
------------------------------------------------------------------------------

{% set old_relation = adapter.get_relation(
      database = "analytics",
      schema = "dbt_bhipple",
      identifier = "customer_orders_legacy_v1"
) %}

{% set dbt_relation = ref('fct_customer_orders_v1') %}

{% if execute %}

{{ audit_helper.compare_row_counts(
    a_relation = old_relation,
    b_relation = dbt_relation
) }}

{% endif %}


------------------------------------------------------------------------------
-- Compare column values
------------------------------------------------------------------------------

{% set old_relation = adapter.get_relation(
      database = "analytics",
      schema = "dbt_bhipple",
      identifier = "customer_orders_legacy_v1"
) -%}

{% set dbt_relation = ref('fct_customer_orders_v1') %}

{% if execute %}

{{ audit_helper.compare_all_columns(
    a_relation = old_relation,
    b_relation = dbt_relation,
    primary_key = "order_id"
) }}

{% endif %}