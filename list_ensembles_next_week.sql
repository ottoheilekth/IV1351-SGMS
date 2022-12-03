SELECT EXTRACT(DOW FROM l.date_and_time) AS weekday, e.genre, e.max_persons - COUNT(*) AS seats_left, e.id AS ensemble_id
FROM ensemble AS e
INNER JOIN lesson AS l
ON l.id = e.id
FULL OUTER JOIN student_lesson AS sl
ON sl.lesson_id = e.id
WHERE EXTRACT(WEEK FROM l.date_and_time) = EXTRACT(WEEK FROM current_date) + 1
GROUP BY e.id, l.date_and_time, e.genre
ORDER BY weekday, e.genre;
