CREATE VIEW list_ensembles_next_week AS
SELECT EXTRACT(DOW FROM l.date_and_time) AS weekday, e.genre,
CASE
    WHEN e.max_persons - COUNT(*) = 0 THEN 'full booked'
    WHEN e.max_persons - COUNT(*) = 1 OR e.max_persons - COUNT(*) = 2 THEN '1-2 seats left'
    ELSE 'many seats left'
END as seats_left, e.id AS ensemble_id
FROM ensemble AS e
INNER JOIN lesson AS l
ON l.id = e.id
FULL OUTER JOIN student_lesson AS sl
ON sl.lesson_id = e.id
WHERE EXTRACT(WEEK FROM l.date_and_time) = EXTRACT(WEEK FROM current_date) + 1
GROUP BY e.id, l.date_and_time, e.genre
ORDER BY weekday, e.genre;
