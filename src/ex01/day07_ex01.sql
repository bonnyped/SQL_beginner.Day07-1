SELECT p.name person_name,
       count(*) count_of_visits
FROM person_visits pv,
     person p
WHERE pv.person_id = p.id
GROUP BY 1
ORDER BY 2 DESC, 1 ASC
LIMIT 4;
