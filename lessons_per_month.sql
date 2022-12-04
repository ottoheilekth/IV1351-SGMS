CREATE VIEW lessons_per_month AS
SELECT DISTINCT EXTRACT(MONTH FROM date_and_time) AS month, COALESCE(private_lessons, 0) AS private_lessons,
COALESCE(group_lessons, 0) AS group_lessons, COALESCE(ensembles, 0) AS ensembles, COALESCE(total_lessons, 0) AS total_lessons
FROM lesson AS l
FULL OUTER JOIN (
    SELECT EXTRACT(MONTH FROM l.date_and_time) AS month, COUNT(*) AS private_lessons
    FROM lesson AS l
    WHERE l.type = 'private_lesson'
    GROUP BY EXTRACT(MONTH FROM l.date_and_time)
) AS p ON EXTRACT(MONTH FROM l.date_and_time) = p.month
FULL OUTER JOIN (
    SELECT EXTRACT(MONTH FROM l.date_and_time) AS month, COUNT(*) AS group_lessons
    FROM lesson AS l
    WHERE l.type = 'group_lesson'
    GROUP BY EXTRACT(MONTH FROM l.date_and_time)
) AS g ON EXTRACT(MONTH FROM l.date_and_time) = g.month
FULL OUTER JOIN (
    SELECT EXTRACT(MONTH FROM l.date_and_time) AS month, COUNT(*) AS ensembles
    FROM lesson AS l
    WHERE l.type = 'ensemble'
    GROUP BY EXTRACT(MONTH FROM l.date_and_time)
) AS e ON EXTRACT(MONTH FROM l.date_and_time) = e.month
FULL OUTER JOIN (
    SELECT EXTRACT(MONTH FROM l.date_and_time) AS month, COUNT(*) AS total_lessons
    FROM lesson AS l
    GROUP BY EXTRACT(MONTH FROM l.date_and_time)
) AS t ON EXTRACT(MONTH FROM l.date_and_time) = t.month
WHERE EXTRACT(YEAR FROM l.date_and_time) = 2023 /*Year*/
ORDER BY month;
