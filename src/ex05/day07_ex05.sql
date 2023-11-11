SELECT DISTINCT p.name
FROM person_order po,
     person p
WHERE po.person_id = p.id
ORDER BY 1;