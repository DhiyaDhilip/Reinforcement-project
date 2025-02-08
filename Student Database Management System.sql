CREATE TABLE Students (
    student_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    gender Varchar(50),
    contact_no VARCHAR(15),
    email VARCHAR(100)
);

INSERT INTO Students (student_id, first_name, last_name, dob, gender, contact_no, email) 
VALUES 
(101, 'John', 'Doe', '2000-05-15', 'Male', '1234567890', 'john.doe@example.com'),
(201, 'Jane', 'Smith', '2001-07-20', 'Female', '9876543210', 'jane.smith@example.com'),
(301, 'Alex', 'Taylor', '1999-03-10', 'Non-binary', '4567891230', 'alex.taylor@example.com'),
(401, 'Chris', 'Brown', '2002-11-25', 'Male', '7891234560', 'chris.brown@example.com'),
(501, 'Emily', 'Davis', '2001-01-30', 'Female', '3216549870', 'emily.davis@example.com'),
(601, 'Sophia', 'Johnson', '2000-08-12', 'Female', '9988776655', 'sophia.johnson@example.com'),
(701, 'Liam', 'Wilson', '1998-04-22', 'Male', '8877665544', 'liam.wilson@example.com'),
(801, 'Olivia', 'Martinez', '1999-09-15', 'Female', '7766554433', 'olivia.martinez@example.com'),
(901, 'Noah', 'Garcia', '2003-02-10', 'Male', '6655443322', 'noah.garcia@example.com'),
(1001, 'Mia', 'Anderson', '2002-06-05', 'Female', '5544332211', 'mia.anderson@example.com');

CREATE TABLE courses (
    course_id INT NOT NULL PRIMARY KEY,
    course_name VARCHAR(100),
    credit_hours INT
);

INSERT INTO courses (course_id,course_name, credit_hours) 
VALUES 
(1001,'Mathematics', 3),
(1002,'Physics', 4),
(1003,'Chemistry', 4),
(1004,'Biology', 3),
(1005,'Computer Science', 3),
(1006,'History', 2),
(1007,'Economics', 3),
(1008,'English Literature', 2),
(1009,'Philosophy', 2),
(1010,'Statistics', 3);


CREATE TABLE enrollments (
    enrollment_id Serial NOT NULL PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(20),
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO enrollments (student_id, course_id, semester, grade)
VALUES 
(101, 1001, 'Fall 2024', 'A'),
(201, 1002, 'Fall 2024', 'B'),
(301, 1003, 'Fall 2024', 'A'),
(401, 1004, 'Spring 2025', 'C'),
(501, 1005, 'Spring 2025', 'B'),
(601, 1006, 'Fall 2024', 'A'),
(701, 1007, 'Spring 2025', 'A'),
(801, 1008, 'Fall 2024', 'B'),
(901, 1009, 'Spring 2025', 'C'),
(1001,1010, 'Fall 2024', 'A');

SELECT s.first_name, s.last_name, e.semester, e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE e.course_id = 1002;

UPDATE enrollments
SET grade = 'A'
WHERE student_id = 101 AND course_id = 1003 AND semester = 'Spring 2025';

SELECT c.course_name, c.credit_hours, COUNT(e.enrollment_id) AS total_students
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id;

Here are additional sample queries to work with the `students`, `courses`, and `enrollments` tables:

---
1. **List All Students**

SELECT * FROM students;


---

2. **List All Courses**

SELECT * FROM courses;


---

3. **Find Students Born After a Specific Date**

SELECT first_name, last_name, dob 
FROM students 
WHERE dob > '2001-01-01';


---

4. **Count the Total Number of Students**

SELECT COUNT(*) AS total_students 
FROM students;


---

5. **Count the Total Number of Courses**

SELECT COUNT(*) AS total_courses 
FROM courses;


---

6. **View Enrollment Details**

SELECT 
    s.first_name AS student_name, 
    c.course_name AS course_name, 
    e.semester, 
    e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id;


---

7. **Find All Courses Taken by a Specific Student**

SELECT 
    c.course_name, 
    e.semester, 
    e.grade
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
WHERE e.student_id = 101;


---

8. **List Students Enrolled in a Specific Semester**

SELECT 
    s.first_name, 
    s.last_name, 
    c.course_name
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.semester = 'Spring 2025';


---

9. **Find the Most Popular Course**

SELECT 
    c.course_name, 
    COUNT(e.enrollment_id) AS total_enrollments
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id
ORDER BY total_enrollments DESC
LIMIT 1;


---

10. **Find Students Who Haven’t Enrolled in Any Course**

SELECT s.first_name, s.last_name
FROM students s
LEFT JOIN enrollments e ON s.student_id > e.student_id
WHERE e.enrollment_id IS NULL;


---

11. **Find Students Who Achieved a Specific Grade**

SELECT 
    s.first_name, 
    s.last_name, 
    c.course_name, 
    e.semester
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.grade = 'A';


---

12. **Update a Student's Contact Information**

UPDATE students
SET contact_no = '9876543210', email = 'john.newemail@example.com'
WHERE student_id = 101;


---

13. **Remove a Student from a Course**
Delete a student's enrollment

DELETE FROM enrollments
WHERE student_id = 1 AND course_id = 3;


---

14. **Find Courses Without Any Enrollments**

SELECT course_name
FROM courses c
LEFT JOIN enrollments e ON c.course_id > e.course_id
WHERE e.enrollment_id IS NULL;


---

15. **Calculate the Average Grade in a Course**

SELECT 
    c.course_name, 
    AVG(CASE 
        WHEN e.grade = 'A' THEN 4 
        WHEN e.grade = 'B' THEN 3 
        WHEN e.grade = 'C' THEN 2 
        WHEN e.grade = 'D' THEN 1 
        WHEN e.grade = 'F' THEN 0 
        ELSE NULL END) AS average_grade
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_id = 1003
GROUP BY c.course_id;


---

16. **List Students with Multiple Enrollments**

SELECT 
    s.first_name, 
    s.last_name, 
    COUNT(e.enrollment_id) AS num_courses
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
GROUP BY s.student_id
HAVING COUNT(e.enrollment_id) < 101;


---

17. **List Courses Taken by Students Born After 2000**

SELECT 
    s.first_name, 
    s.last_name, 
    c.course_name, 
    e.semester
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE s.dob > '2000-01-01';


---

18. **Delete a Course**

DELETE FROM courses
WHERE course_id = 2;


---

