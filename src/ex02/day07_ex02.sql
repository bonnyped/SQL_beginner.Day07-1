WITH top_visits_pizzeria AS (SELECT zz.name    pizzeria_name,
                                    count(person_id),
                                    'visit' AS action_type
                             FROM person_visits po,
                                  pizzeria zz
                             WHERE po.pizzeria_id = zz.id
                             GROUP BY zz.name
                             ORDER BY 2 DESC
                             LIMIT 3),
     top_orders_pizzeria AS (SELECT zz.name,
                                    count(po.person_id),
                                    'order'  AS action_type
                             FROM person_order po,
                                  menu mn,
                                  pizzeria zz
                             WHERE po.menu_id = mn.id
                               AND mn.pizzeria_id = zz.id
                             GROUP BY zz.name
                             ORDER BY 2 DESC
                             LIMIT 3)
SELECT *
FROM top_orders_pizzeria
UNION ALL
SELECT *
FROM top_visits_pizzeria
ORDER BY 3, 2 DESC;