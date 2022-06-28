SELECT * FROM classes;

SELECT name, credits FROM classes WHERE credits > 3;

SELECT * FROM classes WHERE credits % 2 = 0;

SELECT *
FROM enrollments 
INNER JOIN students
ON students.id = enrollments.student_id 
WHERE grade IS NULL AND students.first_name = 'Tianna';

SELECT enrollments.student_id, enrollments.grade,
students.first_name, students.last_name, classes.name
FROM enrollments
INNER JOIN students
ON students.id = enrollments.student_id
INNER JOIN classes
ON enrollments.class_id = classes.id
WHERE grade IS NULL AND students.first_name = 'Tianna';

select * from students;
SELECT * FROM students WHERE EXTRACT(YEAR FROM birthdate) <= 1986
AND (LOWER(first_name) LIKE '%t%' OR LOWER(last_name) LIKE '%t%');

SELECT AVG(EXTRACT(YEAR FROM (AGE(NOW(), birthdate)))) FROM students;

SELECT * FROM addresses WHERE city LIKE '% %';

SELECT s.first_name, s.last_name,
a.line_1, a.city, a.state, a.zipcode
FROM students AS s
INNER JOIN addresses AS a
ON s.address_id = a.id
WHERE city LIKE '% %';

SELECT AVG(credits) FROM classes;

SELECT s.first_name, s.last_name, e.grade
FROM students AS s
INNER JOIN enrollments AS e
ON s.id = e.student_id
WHERE grade = 'A';

-- Each student's first name and the total credits they've enrolled in
-- Need to use "GROUP BY s.first_name" to tell SQL what field to calculate sums for
SELECT s.first_name, SUM(c.credits) as total_credits_enrolled
FROM classes as c
FULL JOIN enrollments AS e
ON c.id = e.class_id
FULL JOIN students as s
ON s.id = e.student_id
GROUP BY s.first_name
ORDER BY s.first_name;

-- The total number of credits each student has received a grade for (DOES NOT INCLUDE STUDENTS WITH NO GRADE. SHOULD IT?)
SELECT s.first_name, SUM(c.credits) as graded_credits
FROM classes as c
FULL JOIN enrollments AS e
ON c.id = e.class_id
FULL JOIN students as s
ON s.id = e.student_id
WHERE e.grade BETWEEN 'A' AND 'Z'
GROUP BY s.first_name
ORDER BY s.first_name;

-- All enrollments, including the class name
SELECT s.first_name, c.name
FROM classes as c
FULL JOIN enrollments AS e
ON c.id = e.class_id
FULL JOIN students as s
ON s.id = e.student_id
ORDER BY s.first_name;

-- Students born between 1982-1985 (inclusive)
SELECT * FROM students
WHERE EXTRACT(YEAR FROM birthdate) BETWEEN '1982' AND '1985';

-- Insert a new enrollment recording that Andre Rohan took PHYS 218 and got an A
SELECT * FROM students as s
FULL JOIN enrollments as e
ON s.id = e.student_id
FULL JOIN classes as c
ON e.class_id = c.id;

SELECT * FROM enrollments WHERE student_id = 5;

INSERT INTO
(SELECT * FROM students as s
FULL JOIN enrollments as e
ON s.id = e.student_id
FULL JOIN classes as c
ON e.class_id = c.id)
VALUES ('Andre', 'Rohan', '1989-09-01', 4, 5, 4, 'A');

SELECT * FROM enrollments WHERE student_id = 5;


