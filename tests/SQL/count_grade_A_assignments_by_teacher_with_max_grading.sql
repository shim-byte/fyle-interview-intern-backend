-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
WITH teacher_grades AS (
    SELECT teacher_id, COUNT(id) AS graded_assignments
    FROM assignments
    WHERE grade IS NOT NULL
    GROUP BY teacher_id
    ORDER BY graded_assignments DESC
    LIMIT 1
)
SELECT COUNT(*)
FROM assignments
WHERE teacher_id = (SELECT teacher_id FROM teacher_grades)
  AND grade = 'A';
