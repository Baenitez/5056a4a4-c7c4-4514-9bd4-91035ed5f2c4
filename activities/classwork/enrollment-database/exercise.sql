/*
 SECTION: Group exercises
 DESCRIPTION: Write a valid SQL query to solve each problem.
 */

/*
SECTION: Group exercises
DESCRIPTION: Write a valid SQL query to solve each problem.
*/


-- A) Get all the unique department names.
SELECT DISTINCT department from course;

-- B) Get the top 10 female students (first_name, last_name, age, gpa) with the best GPA scores and order by age (asc).
SELECT
   first_name,
   last_name,
  age,
   gpa
from
   student
where
   gender = 'female'
Order by
   gpa DESC, Age ASC, first_name ASC, last_name ASC
Limit 10

-- C) Count the number of male/female students that are at least 25 years old.
SELECT
   gender,
   count(gender) AS "Count"
From
   student
where age >= 25
group by gender

-- D) Get the number of male/female students that were accepted
SELECT
   gender,
   count(gender)
From
   student Inner Join enrollment ON student.id = enrollment.student_id
where enrollment.approved = 1
group by
    gender

-- E) Get the min, average, and max GPA of the accepted male students that are less than 20 years old.
Select
    MIN(gpa),
    AVG(gpa),
    MAX(gpa)
from
    student Inner Join enrollment ON student.id = enrollment.student_id
Where
    enrollment.approved = 1
    AND student.gender = 'male'
    AND student.age <= 20

;
SELECT
    *
FROM
    (SELECT
        gender,
        MIN(gpa),
        AVG(gpa),
        MAX(gpa)
     FROM student INNER JOIN enrollment e on student.id = e.student_id
      WHERE student.age >= 20 AND e.approved = 1
      GROUP BY gender
      ) gender_aggregate
WHERE
    gender_aggregate = 'male'

-- F) Get the number of enrollments to courses that take longer than 2 years to finalize.
SELECT
    count(*)
FROM
    course c INNER JOIN enrollment e on c.id = e.course_id
WHERE
    c.years > 2 AND e.approved = 1

-- G) Get the number of male/female student that will take a course from the 'Statistics' department.
SELECT
    count(*)
FROM
    student s
        INNER JOIN enrollment e on s.id = e.student_id
        INNER JOIN course c on e.course_id = c.id
WHERE
    lower(c.department) LIKE 'stat%'

/*
 SECTION: Individual exercises
 DESCRIPTION: Write a valid SQL query to solve each problem.
 */

-- A) Count the number of courses per department
SELECT
    count(*),
    department
FROM
    course
group by department

-- B) How many male/female students were accepted?
SELECT
   gender,
   count(gender)
From
   student Inner Join enrollment ON student.id = enrollment.student_id
where enrollment.approved = 1
group by
    gender

-- C) How many students were accepted per course?
SELECT
    name,
    count(name)
FROM
    course INNER JOIN  enrollment ON enrollment.course_id = course_id
WHERE
    enrollment.approved = 1
GROUP BY
    name
;

-- D) What's the average age and gpa per course?
SELECT
    name,
    avg(gpa),
    avg(age)
FROM
    student INNER JOIN enrollment  on student.id = enrollment.student_id
    INNER JOIN course on course.id = enrollment.course_id
GROUP BY
    course.name
;

-- E) Get the average number of years the enrolled (approved) female student will study.
SELECT
    gender,
    AVG(years)
FROM
    student INNER JOIN enrollment ON student.id = enrollment.student_id
    INNER JOIN course ON course.id = enrollment.course_id
WHERE
    enrollment.approved = 1 AND gender = 'female'
GROUP BY
    student.gender
;
