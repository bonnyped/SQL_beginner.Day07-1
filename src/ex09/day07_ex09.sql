WITH counting_formulas AS (SELECT address,
                                  (max(age) - (min(age)::numeric / max(age)))::numeric(10, 2) formula,
                                  round(AVG(age)::numeric, 2)                                 avarage
                           FROM person
                           GROUP BY address
                           ORDER BY 1)
SELECT *,
       formula > avarage comparison
FROM counting_formulas;