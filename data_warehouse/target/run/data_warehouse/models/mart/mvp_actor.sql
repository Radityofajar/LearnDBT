
  
    

  create  table "data_warehouse"."dbt_dev_mart"."mvp_actor__dbt_tmp"
  
  
    as
  
  (
    


SELECT 
    a.first_name, 
    a.last_name, 
    COUNT(fa.film_id) AS roles_count
FROM 
    "data_warehouse"."dbt_dev_raw"."actor" a
JOIN 
    "data_warehouse"."dbt_dev_raw"."film_actor" fa ON a.actor_id = fa.actor_id
GROUP BY 
    a.actor_id, a.first_name, a.last_name
ORDER BY 
    roles_count DESC
LIMIT 1
  );
  