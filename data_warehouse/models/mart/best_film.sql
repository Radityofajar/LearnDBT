{{ config(
    materialized="table",
    schema="mart"
) }}

SELECT 
    f.title AS film_title,
    COUNT(r.rental_id) AS rental_count
FROM 
    {{ref('film')}} f
JOIN 
    {{ref('inventory')}} i ON f.film_id = i.film_id
JOIN 
    {{ref('rental')}} r ON i.inventory_id = r.inventory_id
GROUP BY 
    f.title
ORDER BY 
    rental_count DESC
LIMIT 1
