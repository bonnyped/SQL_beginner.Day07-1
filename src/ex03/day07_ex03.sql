WITH top_visits_pizzeria AS (SELECT zz.name          pizzeria_name,
                                    count(person_id) for_count
                             FROM person_visits po,
                                  pizzeria zz
                             WHERE po.pizzeria_id = zz.id
                             GROUP BY zz.name),
     top_orders_pizzeria AS (SELECT zz.name,
                                    count(po.person_id) for_count
                             FROM person_order po,
                                  menu mn,
                                  pizzeria zz
                             WHERE po.menu_id = mn.id
                               AND mn.pizzeria_id = zz.id
                             GROUP BY zz.name),
     top_actions_pizzeria AS (
         SELECT *
         FROM top_visits_pizzeria
         UNION ALL
         SELECT *
         FROM top_orders_pizzeria
     )
SELECT pizzeria_name name,
       sum(tap.for_count) total_count
FROM top_actions_pizzeria tap
     GROUP BY tap.pizzeria_name
ORDER BY 2 DESC, 1;