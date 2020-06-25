-- графік кількості самогубств за роком

SELECT s_year AS year, COUNT(suicide_id) AS num_suicide FROM suicide
GROUP BY s_year
ORDER BY s_year;

-- кількість самогубств за віковою категорією 

SELECT * FROM (
    SELECT human.age AS age_group, COUNT(suicide.suicide_id) AS num_suicide FROM suicide
        JOIN human ON suicide.human_id = human.human_id
    GROUP BY human.age
    ORDER BY num_suicide DESC
) 

-- топ 10 причин самогубств 

SELECT * FROM (
    SELECT cause.cause_name, COUNT(suicide.suicide_id) AS num_suicide FROM suicide
        JOIN cause ON suicide.cause_name = cause.cause_name
    GROUP BY cause.cause_name
    ORDER BY num_suicide DESC
) WHERE ROWNUM <= 10