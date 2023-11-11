WITH counting_formulas AS (SELECT address,
                                  (max(age) - (min(age)::numeric / max(age)))::numeric(10, 2) formula,
                                  AVG(age)                                                    avarage
                           FROM person
                           GROUP BY address
                           ORDER BY 1)
SELECT *,
       formula > avarage comparison
FROM counting_formulas;