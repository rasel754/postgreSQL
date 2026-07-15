-- Active: 1782894386476@@127.0.0.1@5432@my_database

--rename table student  to user

alter table student rename to users;

create Table student (
    student_id serial primary key,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    age int,
    grade char(2),
    course varchar(100),
    email varchar(100),
    dob date,
    blood_group varchar(5),
    country varchar(100)
);

-- insert 20 data into student table
insert into
    student (
        first_name,
        last_name,
        age,
        grade,
        course,
        email,
        dob,
        blood_group,
        country
    )
values (
        'John',
        'Doe',
        20,
        'A',
        'Math',
        'john.doe@example.com',
        '1993-05-15',
        'O+',
        'USA'
    ),
    (
        'Jane',
        'Smith',
        22,
        'B',
        'Science',
        'jane.smith@example.com',
        '1991-08-20',
        'A-',
        'Canada'
    ),
    (
        'Alice',
        'Johnson',
        19,
        'A',
        'History',
        'alice.johnson@example.com',
        '1994-12-10',
        'B+',
        'UK'
    ),
    (
        'Bob',
        'Brown',
        21,
        'C',
        'Math',
        'bob.brown@example.com',
        '1992-11-25',
        'AB+',
        'USA'
    ),
    (
        'Charlie',
        'Davis',
        23,
        'B',
        'Science',
        'charlie.davis@example.com',
        '1990-03-12',
        'O-',
        'USA'
    ),
    (
        'David',
        'Miller',
        20,
        'A',
        'History',
        'david.miller@example.com',
        '1993-07-18',
        'O+',
        'USA'
    ),
    (
        'Eve',
        'Wilson',
        22,
        'C',
        'Math',
        'eve.wilson@example.com',
        '1991-09-30',
        'A+',
        'USA'
    ),
    (
        'Frank',
        'Moore',
        19,
        'B',
        'Science',
        'frank.moore@example.com',
        '1994-01-22',
        'O-',
        'USA'
    ),
    (
        'Grace',
        'Taylor',
        21,
        'A',
        'History',
        'grace.taylor@example.com',
        '1993-04-15',
        'O+',
        'USA'
    ),
    (
        'Heidi',
        'Anderson',
        23,
        'C',
        'Math',
        'heidi.anderson@example.com',
        '1990-11-05',
        'AB+',
        'USA'
    ),
    (
        'Ivan',
        'Thomas',
        20,
        'B',
        'Science',
        'ivan.thomas@example.com',
        '1993-06-20',
        'O-',
        'USA'
    ),
    (
        'Judy',
        'Jackson',
        22,
        'A',
        'History',
        'judy.jackson@example.com',
        '1991-10-10',
        'O+',
        'USA'
    );

insert into
    student (
        first_name,
        last_name,
        age,
        grade,
        course,
        email,
        dob,
        blood_group,
        country
    )
values (
        'Kevin',
        'White',
        19,
        'C',
        'Math',
        'NULL',
        '1994-02-14',
        'O+',
        'USA'
    ),
    (
        'Laura',
        'Harris',
        21,
        'B',
        'Science',
        'NULL',
        '1993-05-10',
        'A+',
        'USA'
    ),
    (
        'Mallory',
        'Martin',
        23,
        'A',
        'History',
        'NULL',
        '1990-08-25',
        'O-',
        'USA'
    ),
    (
        'Niaj',
        'Thompson',
        20,
        'C',
        'Math',
        'NULL',
        '1993-12-05',
        'O+',
        'USA'
    ),
    (
        'Olivia',
        'Garcia',
        22,
        'B',
        'Science',
        'NULL',
        '1991-07-20',
        'A-',
        'USA'
    ),
    (
        'Peggy',
        'Martinez',
        19,
        'A',
        'History',
        'peggy.martinez@example.com',
        '1994-09-12',
        'O+',
        'USA'
    ),
    (
        'Quentin',
        'Robinson',
        21,
        'C',
        'Math',
        'quentin.robinson@example.com',
        '1993-03-15',
        'O-',
        'USA'
    ),
    (
        'Rupert',
        'Clark',
        23,
        'B',
        'Science',
        'rupert.clark@example.com',
        '1990-06-25',
        'A+',
        'USA'
    );

select * from student;

select * from student where age > 21;

select age, email from student;

select email as student_email from student;

select * from student order by first_name desc;

select * from student order by age asc;

select DISTINCT country from student;

select DISTINCT age from student;

SELECT * FROM student WHERE age > 20 AND grade = 'A';

select * from student age where country = 'USA';

select *
from student age
where
    country = 'USA'
    and blood_group = 'O+';

select * from student where country <> 'USA' and blood_group = 'O+';

-- jara usa na tader dekhabe
select * from student where country <> 'USA';

select upper(first_name) as upper_first_name from student;

select upper(first_name) from student;

select concat(first_name, ' ', last_name) as full_name from student;

-- ============================================
-- AGGREGATE FUNCTIONS PRACTICE
-- ============================================

-- 1. COUNT: Get total number of students
SELECT COUNT(*) AS total_students FROM student;

-- 2. COUNT with condition: Number of students from USA
SELECT COUNT(*) AS usa_students FROM student WHERE country = 'USA';

-- 3. AVG: Calculate average age of students
SELECT AVG(age) AS average_age FROM student;

-- 4. SUM: Total sum of all students' ages (for practice purpose)
SELECT SUM(age) AS total_age FROM student;

-- 5. MAX: Find maximum age
SELECT MAX(age) AS max_age FROM student;

-- 6. MIN: Find minimum age
SELECT MIN(age) AS min_age FROM student;

-- ============================================
-- GROUP BY (very important)
-- ============================================

-- 7. Count number of students in each course
SELECT course, COUNT(*) AS total_students
FROM student
GROUP BY
    course;

-- 8. Average age for each grade
SELECT grade, AVG(age) AS avg_age FROM student GROUP BY grade;

-- 9. Count students by country
SELECT country, COUNT(*) AS total_students
FROM student
GROUP BY
    country;

-- ============================================
-- GROUP BY + HAVING
-- ============================================

-- 10. Show courses having more than 3 students
SELECT course, COUNT(*) AS total_students
FROM student
GROUP BY
    course
HAVING
    COUNT(*) > 3;

-- 11. Show grades where average age is greater than 21
SELECT grade, AVG(age) AS avg_age
FROM student
GROUP BY
    grade
HAVING
    AVG(age) > 21;

-- ============================================
-- COMBINED AGGREGATE QUERY
-- ============================================

-- 12. Multiple aggregate functions in a single query
SELECT
    COUNT(*) AS total_students,
    AVG(age) AS avg_age,
    MAX(age) AS max_age,
    MIN(age) AS min_age
FROM student;

-- ============================================
-- BONUS (Real-world scenarios)
-- ============================================

-- 13. Count 'A' grade students in each course
SELECT course, COUNT(*) AS a_grade_students
FROM student
WHERE
    grade = 'A'
GROUP BY
    course;

-- 14. Student count grouped by country (USA vs others)
SELECT country, COUNT(*) AS total_students
FROM student
GROUP BY
    country;

select max(length(first_name)) as max_length_first_name from student;

select * from student where email is not NULL;

select COALESCE(email, 'No Email') as email_status from student;

-- ============================================
-- WHERE CLAUSE PRACTICE
-- ============================================

-- 1. Get all students whose age is greater than 20
SELECT * FROM student WHERE age > 20;

-- 2. Get students from USA
SELECT * FROM student WHERE country = 'USA';

-- 3. Get students with grade 'A'
SELECT * FROM student WHERE grade = 'A';

-- ============================================
-- BETWEEN CLAUSE PRACTICE
-- ============================================

-- 4. Get students whose age is between 20 and 22
SELECT * FROM student WHERE age BETWEEN 20 AND 22;

-- 5. Get students born between 1991 and 1993
SELECT *
FROM student
WHERE
    dob BETWEEN '1991-01-01' AND '1993-12-31';

-- ============================================
-- IN CLAUSE PRACTICE
-- ============================================

-- 6. Get students from USA, Canada, or UK
SELECT * FROM student WHERE country IN ('USA', 'Canada', 'UK');

-- 7. Get students with grade A or B
SELECT * FROM student WHERE grade IN ('A', 'B');

-- ============================================
-- ILIKE (case-insensitive search) PRACTICE
-- ============================================

-- 8. Find students whose first name starts with 'j' (case-insensitive)
SELECT * FROM student WHERE first_name ILIKE 'j%';

-- 9. Find students whose email contains 'example'
SELECT * FROM student WHERE email ILIKE '%example%';

-- 10. Find students whose last name ends with 'son'
SELECT * FROM student WHERE last_name ILIKE '%son';

-- ============================================
-- COMBINED PRACTICE (Real-world queries)
-- ============================================

-- 11. Students from USA with age between 20 and 23
SELECT *
FROM student
WHERE
    country = 'USA'
    AND age BETWEEN 20 AND 23;

-- 12. Students with grade A or B and age greater than 20
SELECT * FROM student WHERE grade IN ('A', 'B') AND age > 20;

-- 13. Students whose name starts with 'a' and are from UK or USA
SELECT *
FROM student
WHERE
    first_name ILIKE 'a%'
    AND country IN ('UK', 'USA');

-- 14. Students not from USA and age between 19 and 22
SELECT *
FROM student
WHERE
    country <> 'USA'
    AND age BETWEEN 19 AND 22;

-- ============================================
-- LIMIT PRACTICE
-- ============================================

-- 1. Get first 5 students
SELECT * FROM student LIMIT 5;

-- 2. Get first 3 students sorted by age (youngest first)
SELECT * FROM student ORDER BY age ASC LIMIT 3;

-- 3. Get top 5 oldest students
SELECT * FROM student ORDER BY age DESC LIMIT 5;

-- ============================================
-- OFFSET PRACTICE
-- ============================================

-- 4. Skip first 5 students and get next 5
SELECT * FROM student LIMIT 5 OFFSET 5;

-- 5. Skip first 10 students and get next 5
SELECT * FROM student LIMIT 5 OFFSET 10;

-- ============================================
-- LIMIT + OFFSET (Pagination concept)
-- ============================================

-- 6. Page 1 (first 5 students)
SELECT * FROM student ORDER BY student_id LIMIT 5 OFFSET 0;

-- 7. Page 2 (next 5 students)
SELECT * FROM student ORDER BY student_id LIMIT 5 OFFSET 5;

-- 8. Page 3 (next 5 students)
SELECT * FROM student ORDER BY student_id LIMIT 5 OFFSET 10;

-- ============================================
-- REAL-WORLD EXAMPLES
-- ============================================

-- 9. Get 5 students from USA (pagination style)
SELECT *
FROM student
WHERE
    country = 'USA'
ORDER BY student_id
LIMIT 5
OFFSET
    0;

-- 10. Get next 5 students from USA
SELECT *
FROM student
WHERE
    country = 'USA'
ORDER BY student_id
LIMIT 5
OFFSET
    5;

-- 11. Get top 3 students with grade 'A' (oldest first)
SELECT * FROM student WHERE grade = 'A' ORDER BY age DESC LIMIT 3;



-- ============================================
-- UPDATE QUERY PRACTICE
-- ============================================

-- 1. Update a student's age by student_id
UPDATE student
SET age = 25
WHERE student_id = 1;

-- 2. Update multiple columns for a specific student
UPDATE student
SET first_name = 'Michael',
    last_name = 'Jordan',
    grade = 'A'
WHERE student_id = 2;

-- 3. Update all students' country to 'Bangladesh' (be careful ⚠️ no WHERE)
UPDATE student
SET country = 'Bangladesh';

-- 4. Update students who are from USA → change to 'United States'
UPDATE student
SET country = 'United States'
WHERE country = 'USA';

-- 5. Increase age by 1 for all students (bulk update)
UPDATE student
SET age = age + 1;

-- 6. Update grade to 'B' where age is greater than 22
UPDATE student
SET grade = 'B'
WHERE age > 22;

-- ============================================
-- DELETE QUERY PRACTICE
-- ============================================

-- 7. Delete a student by student_id
DELETE FROM student
WHERE student_id = 3;

-- 8. Delete students who are younger than 20
DELETE FROM student
WHERE age < 20;

-- 9. Delete students from a specific country
DELETE FROM student
WHERE country = 'Canada';

-- 10. Delete all students (⚠️ dangerous)
DELETE FROM student;

-- ============================================
-- SAFE PRACTICE (IMPORTANT)
-- ============================================

-- 11. Always check before DELETE or UPDATE
SELECT *
FROM student
WHERE age < 20;

-- 12. Use RETURNING to see affected rows (PostgreSQL feature 🔥)
DELETE FROM student
WHERE age < 20
RETURNING *;

-- 13. Update with RETURNING to verify changes
UPDATE student
SET grade = 'A'
WHERE student_id = 5
RETURNING *;