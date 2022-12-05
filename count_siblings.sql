CREATE VIEW count_siblings AS
SELECT number_of_siblings, COUNT(*) AS number_of_students
FROM (
    SELECT SUM(
        CASE
            WHEN id = student_id OR id = sibling_student_id
            THEN 1
            ELSE 0
        END
    ) AS number_of_siblings
    FROM (
        SELECT s.id, ss.student_id, ss.sibling_student_id
        FROM student AS s
        LEFT OUTER JOIN student_sibling AS ss
        ON s.id = ss.student_id OR s.id = ss.sibling_student_id
        ORDER BY s.id
    ) AS foo
    GROUP BY id
) AS foo
GROUP BY number_of_siblings;
