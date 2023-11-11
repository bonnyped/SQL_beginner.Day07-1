SELECT pv.person_id, 
       count(*) count_of_visits
FROM person_visits pv
WHERE pv.person_id = pv.person_id
GROUP BY 1
ORDER BY 2 DESC, 1 ASC;