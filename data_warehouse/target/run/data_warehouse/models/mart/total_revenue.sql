
  
    

  create  table "data_warehouse"."dbt_dev_mart"."total_revenue__dbt_tmp"
  
  
    as
  
  (
    

SELECT
    sum(amount) as total_revenue,
    payment_date
FROM
    "data_warehouse"."dbt_dev_intermediate"."fact_payment"
GROUP BY
    payment_date
  );
  