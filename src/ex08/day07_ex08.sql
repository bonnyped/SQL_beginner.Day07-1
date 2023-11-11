SELECT p.address,
       zz.name,
       count(*)
FROM person_order po,
     person p,
     menu mn,
     pizzeria zz
WHERE po.person_id = p.id AND po.menu_id = mn.id AND mn.pizzeria_id = zz.id
GROUP BY 1, 2
ORDER BY 1, 2;