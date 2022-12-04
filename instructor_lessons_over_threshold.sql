CREATE VIEW instructor_lessons_over_threshold AS
SELECT COUNT(*) AS lessons_given, id AS instructor_id
FROM (
    SELECT i.id
    FROM instructor AS i
    INNER JOIN lesson AS l
    ON i.id = l.instructor_id
    WHERE EXTRACT(MONTH FROM l.date_and_time) = EXTRACT(MONTH FROM current_date)
          AND EXTRACT(YEAR FROM l.date_and_time) = EXTRACT(YEAR FROM current_date)
) AS foo
GROUP BY id
HAVING COUNT(*) > 0 /*Threshold*/
ORDER BY lessons_given DESC;
