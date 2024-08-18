{{ config(
    materialized="table",
    schema="mart"
) }}


SELECT 
    a.first_name, 
    a.last_name, 
    COUNT(fa.film_id) AS roles_count
FROM 
    {{ref('actor')}} a
JOIN 
    {{ref('film_actor')}} fa ON a.actor_id = fa.actor_id
GROUP BY 
    a.actor_id, a.first_name, a.last_name
ORDER BY 
    roles_count DESC
LIMIT 1
