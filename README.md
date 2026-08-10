# 🎓 University Course Management System

![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/Language-SQL-blue?style=for-the-badge&logo=postgresql&logoColor=white)
![pgAdmin](https://img.shields.io/badge/Tool-pgAdmin%204-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

---

## 📌 Project Overview

The **University Course Management System** is a PostgreSQL-based database project developed to manage students, courses, instructors, enrollments, and university departments.

This project demonstrates practical SQL concepts through a real-world university database system.

---

## 🎯 Project Objective

The main objective of this project is to design and implement a relational database for managing university academic information.

# 📑 Table of Contents

- [📌 Project Overview](#-project-overview)
- [🎯 Project Objective](#-project-objective)
- [🎥 Video Demonstration](#-video-demonstration)
- [🗂️ Database Tables](#️-database-tables)
- [🔗 Database Relationships](#-database-relationships)
- [🛠️ Technologies Used](#️-technologies-used)
- [🚀 Database Setup](#-database-setup)
- [📊 SQL Queries](#-sql-queries)
  - [1️⃣ CRUD Operations](#1️⃣-query-1--crud-operations-on-all-tables)
  - [2️⃣ Students After 2022](#2️⃣-query-2--students-who-enrolled-after-2022)
  - [3️⃣ Mathematics Courses](#3️⃣-query-3--mathematics-department-courses)
  - [4️⃣ Courses With More Than 5 Students](#4️⃣-query-4--courses-having-more-than-5-students)
  - [5️⃣ Students in Both Courses](#5️⃣-query-5--students-enrolled-in-both-sql-and-data-structures)
  - [6️⃣ Students in SQL OR Data Structures](#6️⃣-query-6--students-enrolled-in-sql-or-data-structures)
  - [7️⃣ Average Course Credits](#7️⃣-query-7--average-course-credits)
  - [8️⃣ Maximum Instructor Salary](#8️⃣-query-8--maximum-instructor-salary)
  - [9️⃣ Students in Each Department](#9️⃣-query-9--students-in-each-department)
  - [🔟 INNER JOIN](#-query-10--inner-join-students-and-courses)
  - [1️⃣1️⃣ LEFT JOIN](#-query-11--left-join-students-and-courses)
  - [1️⃣2️⃣ Subquery](#-query-12--subquery)
  - [1️⃣3️⃣ Extract Year](#-query-13--extract-year-from-enrollment-date)
  - [1️⃣4️⃣ CONCAT Names](#-query-14--concatenate-instructor-names)
  - [1️⃣5️⃣ Running Total](#-query-15--running-total)
  - [1️⃣6️⃣ CASE Expression](#-query-16--senior-or-junior-students)
- [📚 SQL Concepts Demonstrated](#-sql-concepts-demonstrated)
- [✨ Key Features](#-key-features)
- [🎓 Learning Outcomes](#-learning-outcomes)
- [📁 Project Structure](#-project-structure)
- [⚠️ Important Note](#️-important-note)
- [👩‍💻 Author](#-author)
- [📜 License](#-license)

---

# 🎥 Video Demonstration

### ▶️ Project Demo

A complete video demonstration of the **University Course Management System** is available below.

📹 **Watch the Project Demonstration:**

👉 [🎬 Click Here to Watch the Video](YOUR_VIDEO_LINK_HERE)

---

### The system manages:

- 👨‍🎓 Students
- 📚 Courses
- 👩‍🏫 Instructors
- 📝 Enrollments
- 🏢 Departments

---

## 🗂️ Database Tables

| Table | Description |
|---|---|
| `Students` | Stores student information |
| `Courses` | Stores course information |
| `Instructors` | Stores instructor information |
| `Enrollments` | Stores student enrollment information |
| `Departments` | Stores department information |

---

## 🔗 Database Relationships

```text
Departments
     |
     |------ Courses
     |
     |------ Instructors

Students
     |
     |------ Enrollments ------ Courses
```

### Foreign Key Relationships

- `Courses.DepartmentID` → `Departments.DepartmentID`
- `Instructors.DepartmentID` → `Departments.DepartmentID`
- `Enrollments.StudentID` → `Students.StudentID`
- `Enrollments.CourseID` → `Courses.CourseID`

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| PostgreSQL | Database Management System |
| SQL | Query Language |
| pgAdmin 4 | Database Management Tool |

---

# 🚀 Database Setup

## Step 1: Create Database

```sql
CREATE DATABASE university_course_management;
```

## Step 2: Open Query Tool

After creating the database, select:

`Databases → university_course_management → Query Tool`

---

# 📊 SQL Queries

## 1️⃣ Query 1 — CRUD Operations on All Tables

### Students CRUD

```sql
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
```

### Courses CRUD

```sql
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
```

### Instructors CRUD

```sql
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
```

### Enrollments CRUD

```sql
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
```

### Departments CRUD

```sql
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
```

---

## 2️⃣ Query 2 — Students Who Enrolled After 2022

```sql
SELECT *
FROM Students
WHERE EnrollmentDate > '2022-12-31';
```

**Description:** Retrieves students who enrolled after 2022.

---

## 3️⃣ Query 3 — Mathematics Department Courses

```sql
SELECT *
FROM Courses
WHERE DepartmentID = 2
LIMIT 5;
```

**Description:** Retrieves up to 5 courses from the Mathematics department.

---

## 4️⃣ Query 4 — Courses Having More Than 5 Students

```sql
SELECT
    CourseID,
    COUNT(*) AS TotalStudents
FROM Enrollments
GROUP BY CourseID
HAVING COUNT(*) > 5;
```

**Description:** Counts students in each course and displays courses having more than 5 students.

---

## 5️⃣ Query 5 — Students Enrolled in Both SQL and Data Structures

```sql
SELECT s.*
FROM Students s
JOIN Enrollments e1
    ON s.StudentID = e1.StudentID
JOIN Enrollments e2
    ON s.StudentID = e2.StudentID
WHERE e1.CourseID = 101
AND e2.CourseID = 102;
```

**Description:** Finds students enrolled in both Introduction to SQL and Data Structures.

---

## 6️⃣ Query 6 — Students Enrolled in SQL OR Data Structures

```sql
SELECT DISTINCT
    s.StudentID,
    s.FirstName,
    s.LastName,
    s.Email
FROM Students s
JOIN Enrollments e
    ON s.StudentID = e.StudentID
WHERE e.CourseID IN (101, 102);
```

**Description:** Retrieves students enrolled in either SQL or Data Structures.

---

## 7️⃣ Query 7 — Average Course Credits

```sql
SELECT
    AVG(Credits) AS AverageCredits
FROM Courses;
```

**Description:** Calculates the average credits of all courses.

---

## 8️⃣ Query 8 — Maximum Instructor Salary

```sql
SELECT
    MAX(Salary) AS MaximumSalary
FROM Instructors
WHERE DepartmentID = 1;
```

**Description:** Finds the maximum salary of instructors in the Computer Science department.

---

## 9️⃣ Query 9 — Students in Each Department

```sql
SELECT
    d.DepartmentID,
    d.DepartmentName,
    COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM Departments d
LEFT JOIN Courses c
    ON d.DepartmentID = c.DepartmentID
LEFT JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY
    d.DepartmentID,
    d.DepartmentName
ORDER BY d.DepartmentID;
```

**Description:** Counts students enrolled in courses belonging to each department.

---

## 🔟 Query 10 — INNER JOIN Students and Courses

```sql
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
```

**Description:** Displays students and their corresponding courses using INNER JOIN.

---

## 1️⃣1️⃣ Query 11 — LEFT JOIN Students and Courses

```sql
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
```

**Description:** Displays all students and their courses, if available.

---

## 1️⃣2️⃣ Query 12 — Subquery

```sql
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
```

**Description:** Finds students enrolled in courses having more than 10 students.

---

## 1️⃣3️⃣ Query 13 — Extract Year from Enrollment Date

```sql
SELECT
    StudentID,
    EnrollmentDate,
    EXTRACT(YEAR FROM EnrollmentDate) AS EnrollmentYear
FROM Enrollments;
```

**Description:** Extracts the year from the enrollment date.

---

## 1️⃣4️⃣ Query 14 — Concatenate Instructor Names

```sql
SELECT
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Instructors;
```

**Description:** Combines instructor first name and last name into one column.

---

## 1️⃣5️⃣ Query 15 — Running Total

```sql
SELECT
    CourseID,
    COUNT(*) AS TotalStudents,
    SUM(COUNT(*)) OVER (
        ORDER BY CourseID
    ) AS RunningTotal
FROM Enrollments
GROUP BY CourseID
ORDER BY CourseID;
```

**Description:** Calculates the running total of students enrolled in courses using a Window Function.

---

## 1️⃣6️⃣ Query 16 — Senior or Junior Students

```sql
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
```

**Description:** Classifies students as Senior or Junior using a CASE expression.

---

# 📚 SQL Concepts Demonstrated

| Concept | Used In |
|---|---|
| CREATE | Database and Tables |
| INSERT | Data Insertion |
| SELECT | Data Retrieval |
| UPDATE | CRUD |
| DELETE | CRUD |
| PRIMARY KEY | All Main Tables |
| FOREIGN KEY | Related Tables |
| UNIQUE | Students Email |
| CHECK | Course Credits |
| COUNT() | Query 4, Query 9 |
| AVG() | Query 7 |
| MAX() | Query 8 |
| SUM() | Query 15 |
| GROUP BY | Query 4, Query 9, Query 12, Query 15 |
| HAVING | Query 4, Query 12 |
| INNER JOIN | Query 10 |
| LEFT JOIN | Query 9, Query 11 |
| Subquery | Query 12 |
| EXTRACT() | Query 13 |
| CONCAT() | Query 14 |
| Window Function | Query 15 |
| CASE | Query 16 |

---

# 🎓 Learning Outcomes

Through this project, I practiced:

- Database creation and management
- Relational database design
- Primary Keys and Foreign Keys
- CRUD operations
- Data filtering
- Aggregate functions
- GROUP BY and HAVING
- INNER JOIN and LEFT JOIN
- Subqueries
- Date functions
- String functions
- Window functions
- CASE expressions
- Real-world SQL problem solving

---

# 📁 Project Structure

```text
University-Course-Management/
│
├── university_course_management.sql
│
└── README.md
```

---

# 👩‍💻 Author

## Simran Gohel

🎓 **PostgreSQL / SQL Practical Project**

### University Course Management System

---

# ⭐ Project Summary

> A complete PostgreSQL project demonstrating practical SQL knowledge through a real-world University Course Management System.

**Database Design → CRUD Operations → Joins → Aggregate Functions → Subqueries → Date Functions → String Functions → Window Functions → CASE Expression**
