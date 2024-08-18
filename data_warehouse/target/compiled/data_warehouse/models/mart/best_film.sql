

SELECT 
    f.title AS film_title,
    COUNT(r.rental_id) AS rental_count
FROM 
    "data_warehouse"."dbt_dev_raw"."film" f
JOIN 
    "data_warehouse"."dbt_dev_raw"."inventory" i ON f.film_id = i.film_id
JOIN 
    "data_warehouse"."dbt_dev_raw"."rental" r ON i.inventory_id = r.inventory_id
GROUP BY 
    f.title
ORDER BY 
    rental_count DESC
LIMIT 1