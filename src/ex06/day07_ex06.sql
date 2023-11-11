SELECT zz.name,
       count(po.id) count_of_orders,
       round((sum(mn.price) / count(*))::numeric, 2) average_price,
       max(mn.price) max_price,
       min(mn.price) min_price
FROM person_order po,
     menu mn,
     pizzeria zz
WHERE po.menu_id = mn.id AND mn.pizzeria_id = zz.id
GROUP BY zz.name
ORDER BY 1;