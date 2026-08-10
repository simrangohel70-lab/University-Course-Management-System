-- =========================================================
         UNIVERSITY COURSE MANAGEMENT SYSTEM
-- =========================================================



-- =========================================================
-- 1. DEPARTMENTS TABLE
-- =========================================================

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(1, 'Computer Science'),
(2, 'Mathematics');

SELECT * FROM Departments;


-- =========================================================
-- 2. STUDENTS TABLE
-- =========================================================

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    BirthDate DATE,
    EnrollmentDate DATE NOT NULL
);

INSERT INTO Students
(StudentID, FirstName, LastName, Email, BirthDate, EnrollmentDate)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2000-01-15', '2022-08-01'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '1999-05-25', '2021-08-01'),
(3, 'Simran', 'Gohel', 'simran.gohel@email.com', '2004-03-10', '2023-08-01'),
(4, 'Maahi', 'Patel', 'maahi.patel@email.com', '2003-07-15', '2022-08-01'),
(5, 'Manan', 'Shah', 'manan.shah@email.com', '2002-04-20', '2021-08-01'),
(6, 'Sarth', 'Mehta', 'sarth.mehta@email.com', '2004-01-12', '2023-08-01'),
(7, 'Hiral', 'Joshi', 'hiral.joshi@email.com', '2003-11-05', '2022-08-01'),
(8, 'Priya', 'Patel', 'priya.patel@email.com', '2002-09-18', '2021-08-01'),
(9, 'Krish', 'Desai', 'krish.desai@email.com', '2004-06-22', '2023-08-01'),
(10, 'Priyanshu', 'Verma', 'priyanshu.verma@email.com', '2003-02-14', '2022-08-01'),
(11, 'Riya', 'Shah', 'riya.shah@email.com', '2002-12-10', '2021-08-01'),
(12, 'Rahul', 'Patel', 'rahul.patel@email.com', '2003-05-17', '2023-08-01');

SELECT * FROM Students;


-- =========================================================
-- 3. COURSES TABLE
-- =========================================================

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    Credits INT CHECK (Credits > 0),
    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);

INSERT INTO Courses
(CourseID, CourseName, DepartmentID, Credits)
VALUES
(101, 'Introduction to SQL', 1, 3),
(102, 'Data Structures', 2, 4),
(103, 'Database Management', 1, 3),
(104, 'Operating Systems', 1, 4),
(105, 'Computer Networks', 1, 3),
(106, 'Web Development', 1, 3),
(107, 'Calculus', 2, 4),
(108, 'Statistics', 2, 3);

SELECT * FROM Courses;


-- =========================================================
-- 4. INSTRUCTORS TABLE
-- =========================================================

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    DepartmentID INT NOT NULL,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);

INSERT INTO Instructors
(InstructorID, FirstName, LastName, Email, DepartmentID, Salary)
VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@univ.com', 1, 75000),
(2, 'Bob', 'Lee', 'bob.lee@univ.com', 2, 68000),
(3, 'David', 'Brown', 'david.brown@univ.com', 1, 82000),
(4, 'Emma', 'Wilson', 'emma.wilson@univ.com', 2, 70000);

SELECT * FROM Instructors;


-- =========================================================
-- 5. ENROLLMENTS TABLE
-- =========================================================

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,

    FOREIGN KEY (StudentID)
        REFERENCES Students(StudentID),

    FOREIGN KEY (CourseID)
        REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments
(EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES
(1, 1, 101, '2022-08-01'),
(2, 2, 102, '2021-08-01'),
(3, 3, 101, '2023-08-01'),
(4, 4, 101, '2022-08-01'),
(5, 5, 101, '2021-08-01'),
(6, 6, 101, '2023-08-01'),
(7, 7, 101, '2022-08-01'),
(8, 8, 101, '2021-08-01'),
(9, 9, 101, '2023-08-01'),
(10, 10, 101, '2022-08-01'),
(11, 11, 101, '2021-08-01'),
(12, 12, 101, '2023-08-01'),
(13, 3, 102, '2023-08-05'),
(14, 4, 102, '2022-08-05'),
(15, 5, 102, '2021-08-05'),
(16, 6, 103, '2023-08-05'),
(17, 7, 104, '2022-08-05'),
(18, 8, 105, '2021-08-05'),
(19, 9, 106, '2023-08-05'),
(20, 10, 107, '2022-08-05');

SELECT * FROM Enrollments;


-- =========================================================
-- QUERY 1
-- PERFORM CRUD OPERATIONS ON ALL TABLES
-- =========================================================


-- -------------------------
-- Students CRUD
-- -------------------------

-- CREATE
INSERT INTO Students
VALUES
(13, 'Mark', 'Taylor', 'mark.taylor@email.com',
 '2001-02-20', '2024-08-01');

-- READ
SELECT * FROM Students;

-- UPDATE
UPDATE Students
SET Email = 'mark.new@email.com'
WHERE StudentID = 13;

-- DELETE
DELETE FROM Students
WHERE StudentID = 13;


-- -------------------------
-- Courses CRUD
-- -------------------------

-- CREATE
INSERT INTO Courses
VALUES
(109, 'Artificial Intelligence', 1, 4);

-- READ
SELECT * FROM Courses;

-- UPDATE
UPDATE Courses
SET Credits = 3
WHERE CourseID = 109;

-- DELETE
DELETE FROM Courses
WHERE CourseID = 109;


-- -------------------------
-- Instructors CRUD
-- -------------------------

-- CREATE
INSERT INTO Instructors
VALUES
(5, 'Mark', 'Taylor', 'mark.taylor@univ.com', 1, 72000);

-- READ
SELECT * FROM Instructors;

-- UPDATE
UPDATE Instructors
SET Salary = 76000
WHERE InstructorID = 5;

-- DELETE
DELETE FROM Instructors
WHERE InstructorID = 5;


-- -------------------------
-- Enrollments CRUD
-- -------------------------

-- CREATE
INSERT INTO Enrollments
VALUES
(21, 12, 108, '2024-08-01');

-- READ
SELECT * FROM Enrollments;

-- UPDATE
UPDATE Enrollments
SET CourseID = 107
WHERE EnrollmentID = 21;

-- DELETE
DELETE FROM Enrollments
WHERE EnrollmentID = 21;


-- -------------------------
-- Departments CRUD
-- -------------------------

-- CREATE
INSERT INTO Departments
VALUES
(3, 'Physics');

-- READ
SELECT * FROM Departments;

-- UPDATE
UPDATE Departments
SET DepartmentName = 'Physics and Science'
WHERE DepartmentID = 3;

-- DELETE
DELETE FROM Departments
WHERE DepartmentID = 3;


-- =========================================================
-- QUERY 2
-- RETRIEVE STUDENTS WHO ENROLLED AFTER 2022
-- =========================================================

SELECT *
FROM Students
WHERE EnrollmentDate > '2022-12-31';


-- =========================================================
-- QUERY 3
-- RETRIEVE COURSES OFFERED BY MATHEMATICS DEPARTMENT
-- LIMIT 5 COURSES
-- =========================================================

SELECT *
FROM Courses
WHERE DepartmentID = 2
LIMIT 5;


-- =========================================================
-- QUERY 4
-- NUMBER OF STUDENTS ENROLLED IN EACH COURSE
-- ONLY COURSES WITH MORE THAN 5 STUDENTS
-- =========================================================

SELECT
    CourseID,
    COUNT(*) AS TotalStudents
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(*) > 5;


-- =========================================================
-- QUERY 5
-- STUDENTS ENROLLED IN BOTH
-- INTRODUCTION TO SQL AND DATA STRUCTURES
-- =========================================================

SELECT s.*
FROM Students s
JOIN Enrollments e1
    ON s.StudentID = e1.StudentID
JOIN Enrollments e2
    ON s.StudentID = e2.StudentID
WHERE e1.CourseID = 101
AND e2.CourseID = 102;


-- =========================================================
-- QUERY 6
-- STUDENTS ENROLLED IN
-- INTRODUCTION TO SQL OR DATA STRUCTURES
-- =========================================================

SELECT DISTINCT
    s.StudentID,
    s.FirstName,
    s.LastName,
    s.Email
FROM Students s
JOIN Enrollments e
    ON s.StudentID = e.StudentID
WHERE e.CourseID IN (101, 102);


-- =========================================================
-- QUERY 7
-- AVERAGE NUMBER OF CREDITS FOR ALL COURSES
-- =========================================================

SELECT
    AVG(Credits) AS AverageCredits
FROM Courses;


-- =========================================================
-- QUERY 8
-- MAXIMUM SALARY OF INSTRUCTORS
-- IN COMPUTER SCIENCE DEPARTMENT
-- =========================================================

SELECT
    MAX(Salary) AS MaximumSalary
    FROM Instructors
    WHERE DepartmentID = 1;


-- =========================================================
-- QUERY 9
-- NUMBER OF STUDENTS ENROLLED IN EACH DEPARTMENT
-- =========================================================

SELECT
    d.DepartmentID,
    d.DepartmentName,
    COUNT(DISTINCT e.StudentID) AS TotalStudents
	FROM Departments d
LEFT JOIN Courses c
    ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY  d.DepartmentID, d.DepartmentName
ORDER BY d.DepartmentID;


-- =========================================================
-- QUERY 10
-- INNER JOIN
-- RETRIEVE STUDENTS AND THEIR CORRESPONDING COURSES
-- =========================================================

SELECT
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseName
FROM Students s
INNER JOIN Enrollments e
    ON s.StudentID = e.StudentID
INNER JOIN Courses c
    ON e.CourseID = c.CourseID;


-- =========================================================
-- QUERY 11
-- LEFT JOIN
-- RETRIEVE ALL STUDENTS AND THEIR COURSES, IF ANY
-- =========================================================

SELECT
    s.StudentID,
    s.FirstName,
    s.LastName,
    c.CourseName
FROM Students s
LEFT JOIN Enrollments e
    ON s.StudentID = e.StudentID
LEFT JOIN Courses c
    ON e.CourseID = c.CourseID;


-- =========================================================
-- QUERY 12
-- SUBQUERY
-- STUDENTS ENROLLED IN COURSES
-- THAT HAVE MORE THAN 10 STUDENTS
-- =========================================================

SELECT
    s.StudentID,
    s.FirstName,
    s.LastName,
    s.Email
FROM Students s
WHERE s.StudentID IN
(
    SELECT e.StudentID
    FROM Enrollments e
    WHERE e.CourseID IN
    (
        SELECT CourseID
        FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(DISTINCT StudentID) > 10
    )
);


-- =========================================================
-- QUERY 13
-- EXTRACT THE YEAR FROM ENROLLMENT DATE
-- =========================================================

SELECT
    StudentID,
    EnrollmentDate,
    EXTRACT(YEAR FROM EnrollmentDate) AS EnrollmentYear
FROM Enrollments;


-- =========================================================
-- QUERY 14
-- CONCATENATE INSTRUCTOR'S FIRST AND LAST NAME
-- =========================================================

SELECT
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Instructors;


-- =========================================================
-- QUERY 15
-- CALCULATE RUNNING TOTAL OF STUDENTS
-- ENROLLED IN COURSES
-- =========================================================

SELECT
    CourseID,
    COUNT(*) AS TotalStudents,
    SUM(COUNT(*)) OVER (
        ORDER BY CourseID
    ) AS RunningTotal
FROM Enrollments
GROUP BY CourseID
ORDER BY CourseID;


-- =========================================================
-- QUERY 16
-- LABEL STUDENTS AS SENIOR OR JUNIOR
-- BASED ON 4 YEARS FROM CURRENT DATE
-- =========================================================

SELECT
    StudentID,
    FirstName,
    LastName,
    EnrollmentDate,

    CASE
        WHEN EnrollmentDate <= CURRENT_DATE - INTERVAL '4 years'
        THEN 'Senior'
        ELSE 'Junior'
    END AS StudentLevel

FROM Students;