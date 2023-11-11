WITH all_persons_visits AS (SELECT person_id,
                                   count(pv.visit_date) count_of_visits
                            FROM person_visits pv
                            group by person_id),
     sum_of_visits AS (SELECT p.name,
                              person_id,
                              apv.count_of_visits
                       FROM all_persons_visits apv
                                JOIN person p ON apv.person_id = p.id)
SELECT s.name,
       s.count_of_visits
FROM sum_of_visits s
         JOIN sum_of_visits sv ON s.count_of_visits > 3 AND sv.person_id = s.person_id;
