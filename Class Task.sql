create database Task;

use Task;

CREATE TABLE Employees (
    EmployeeID INT not null unique identity,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2)
	foreign key (DepartmentID) references Departments(DepartmentID)
);

--2. Insert five employees into the Employees table.
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary)
VALUES

--4. Assign each employee to a department in the Employees table.
    ('John', 'Doe', 1, 60000.00),
    ('Jane', 'Smith', 2, 55000.00),
    ('Mike', 'Johnson', 1, 65000.00),
    ('Emily', 'Williams', 3, 70000.00),
    ('David', 'Brown', 2, 50000.00),
    ('Sarah', 'Miller', 1, 62000.00),
    ('Chris', 'Wilson', 3, 75000.00),
    ('Anna', 'Jones', 2, 53000.00),
    ('Brian', 'Taylor', 1, 58000.00),
    ('Laura', 'Anderson', 3, 72000.00);


-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT not null unique identity,
    DepartmentName VARCHAR(50)

);

--3. Insert three departments into the Departments table.

INSERT INTO Departments (DepartmentName)
VALUES
    ( 'HR'),
    ( 'IT'),
    ( 'Finance');

	--1. Create a new table named Projects with columns ProjectID, ProjectName, and StartDate.
	CREATE TABLE Projects (
    ProjectID INT not null unique identity,
    ProjectName VARCHAR(50),
	EmployeesID int,
	StartDate int
	foreign key (EmployeesID) references Employees(EmployeeID)

);

INSERT INTO Projects (ProjectName ,EmployeesID , StartDate)
VALUES
    ( 'Database' , 3, 2-1-2024),
    ( 'Web Designing', 2 , 4-1-2024),
    ( 'Destop Application',1, 5-1-2024),
	( 'Database' , 4, 2-1-2024),
    ( 'Web Designing', 5 , 4-1-2024),
    ( 'Destop Application',6, 5-1-2024),
	( 'Database' , 7, 2-1-2024),
    ( 'Web Designing', 8 , 4-1-2024),
    ( 'Destop Application',9, 5-1-2024);

-- 5. Retrieve the details of employees whose salary is above 50000.
	select * from Employees as E Join Departments as D on E.DepartmentID = D.DepartmentID join Projects as p on E.EmployeeID = P.EmployeesID where E.Salary > 50000;

-- 6. Fetch a list of all employees along with the department they belong to.
	select * from Employees as E Join Departments as D on E.DepartmentID = D.DepartmentID;

-- 7. Retrieve the employees whose last name starts with 'S'.
	select * from Employees as E where e.LastName like 'S%';

-- 8. Retrieve the projects with names containing the word 'Database'.
	select * from Projects Where ProjectName = 'Database';

-- 9. Calculate the total salary of all employees.
	select sum(salary) from Employees ;

-- 10.Find the department with the highest average salary.
	SELECT DepartmentID , AVG(Salary) AS AverageSalary FROM Employees GROUP BY DepartmentID ORDER BY AverageSalary DESC;



			-----	Another schema	-----	

-- Students Table
CREATE TABLE Students (
    StudentID INT not null unique identity,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
	CourseID int ,
    Age INT,
    GPA DECIMAL(3, 2)
	foreign key (CourseID) references Courses(CourseID)
);

INSERT INTO Students (FirstName, LastName, CourseID, Age, GPA)
VALUES
    ('Alice', 'Johnson',2 , 20, 3.75),
    ('Bob', 'Smith', 3, 22, 3.50),
    ('Charlie', 'Davis',4, 21, 3.80),
    ('Diana', 'Brown', 5,23, 3.90),
    ('Eva', 'Miller', 6,20, 3.65),
    ('Frank', 'Jones',2, 22, 3.70),
    ('Grace', 'Wilson',2, 21, 3.85),
    ('Henry', 'Anderson',2, 23, 3.95),
    ('Ivy', 'Taylor', 7,20, 3.60),
    ('Jack', 'Clark', 2,22, 3.75);

-- Courses Table
CREATE TABLE Courses (
    CourseID INT not null unique identity,
    CourseName VARCHAR(50)
);

-- Inserting 10 sample records into Courses table
INSERT INTO Courses (CourseName)
VALUES
    ('Introduction to Programming'),
    ('Web Development Basics'),
    ('Database Management'),
    ('Data Structures and Algorithms'),
    ('JavaScript Fundamentals'),
    ('Mobile App Development'),
    ('Software Engineering Principles'),
    ('Networking Essentials'),
    ('Artificial Intelligence Basics'),
    ('Cybersecurity Fundamentals');

--1.Retrieve a list of all students and the courses they are enrolled in, including those who are not enrolled in any course.
	select * from Students as S join Courses as C on S.CourseID = C.CourseID;

--2.Display the details of students who are enrolled in the course 'Web Development Basics'.
    select * from Students as S join Courses as C on S.CourseID = C.CourseID where c.CourseName = 'Web Development Basics';

--3.Find out which courses have no enrolled students.
    SELECT CourseID, CourseName FROM Courses WHERE CourseID NOT IN (SELECT DISTINCT CourseID FROM Students);

--4. List the students who are enrolled in any course, along with the course names.
   SELECT s.StudentID, s.FirstName, s.CourseID, c.CourseName FROM Students as s JOIN Courses c ON s.CourseID = c.CourseID;

--5. Retrieve a list of all courses along with the number of students enrolled in each course, even if the count is zero.
   SELECT c.CourseID, c.CourseName, COUNT(s.StudentID) AS EnrolledStudents FROM Courses c LEFT JOIN Students as s ON c.CourseID = s.CourseID GROUP BY c.CourseID, c.CourseName;