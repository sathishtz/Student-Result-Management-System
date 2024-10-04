-- Creating the database
CREATE DATABASE student_result_management_system;

-- Use the created database
USE student_result_management_system;

-- Table for departments
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- Table for student details
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    dob DATE,
    gender ENUM('Male', 'Female', 'Other'),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Table for courses (without teacher association)
-- Dropping the unique constraint on course_code (if it's already there)
-- ALTER TABLE courses DROP INDEX course_code;
CREATE TABLE subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    subject_code VARCHAR(20),-- Removed UNIQUE constraint here
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Table for semesters
CREATE TABLE semesters (
    semester_id INT AUTO_INCREMENT PRIMARY KEY,
    semester_name VARCHAR(50) NOT NULL
);

-- Table for exams
CREATE TABLE exams (
    exam_id INT AUTO_INCREMENT PRIMARY KEY,
    exam_name VARCHAR(50) NOT NULL,
    exam_date DATE,
    semester_id INT,
    subject_id INT,
    FOREIGN KEY (semester_id) REFERENCES semesters(semester_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

-- Table for exam results (marks are assigned to a specific exam)
CREATE TABLE exam_results (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    exam_id INT,
    marks_obtained DECIMAL(5,2),
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (exam_id) REFERENCES exams(exam_id)
);

-- Inserting data into departments table
INSERT INTO departments (department_name) 
VALUES ('Computer Science And Engineering'), ('Civil Engineering'), ('Mechanical Engineering'), ('Electrical And Electronics Engineering'), ('Electrical Communication Engineering');

-- Inserting data into students table
INSERT INTO students (student_name, dob, gender, email, phone_number, department_id)
VALUES 
('Sathish', '2003-06-02', 'Male', 'sathish07@example.com', '1234567890', 1),
('Sanjay', '2002-08-18', 'Male', 'sanjay18@example.com', '0987654321', 2),
('Krishna', '2001-03-22', 'Male', 'krishna26@example.com', '2345678901', 3),
('Priya', '2002-07-09', 'Female', 'priya2002@example.com', '3456789012', 4),
('Sowmiya', '2003-09-26', 'Female', 'sowmiya2003@example.com', '4567890123', 5);

-- Inserting data into courses table
INSERT INTO courses (course_name, course_code, department_id)
VALUES 
('Matrices and calculus', 'MA3151', 1),
('Engineering Physics', 'PH3151', 1), 
('Engineering Chemistry', 'CY3151', 1),
('Heritage Of Tamils', 'GE3152', 1),
('Problem solving and python programming', 'GE3151', 1),
('Professional English-1', 'HS3152', 1),
('Problem solving and python programming laboratory', 'GE3171', 1),
('English Laboratory', 'GE3172', 1),
('Physics and Chemistry Laboratory', 'BS3171', 1),
('Matrices and calculus', 'MA3151', 2),
('Engineering Physics', 'PH3151', 2), 
('Engineering Chemistry', 'CY3151', 2),
('Heritage Of Tamils', 'GE3152', 2),
('Problem solving and python programming', 'GE3151', 2),
('Professional English-1', 'HS3152', 2),
('Problem solving and python programming laboratory', 'GE3171', 2),
('English Laboratory', 'GE3172', 2),
('Physics and Chemistry Laboratory', 'BS3171', 2),
('Matrices and calculus', 'MA3151', 3),
('Engineering Physics', 'PH3151', 3), 
('Engineering Chemistry', 'CY3151', 3),
('Heritage Of Tamils', 'GE3152', 3),
('Problem solving and python programming', 'GE3151', 3),
('Professional English-1', 'HS3152', 3),
('Problem solving and python programming laboratory', 'GE3171', 3),
('English Laboratory', 'GE3172', 3),
('Physics and Chemistry Laboratory', 'BS3171', 3),
('Matrices and calculus', 'MA3151', 4),
('Engineering Physics', 'PH3151', 4), 
('Engineering Chemistry', 'CY3151', 4),
('Heritage Of Tamils', 'GE3152', 4),
('Problem solving and python programming', 'GE3151', 4),
('Professional English-1', 'HS3152', 4),
('Problem solving and python programming laboratory', 'GE3171', 4),
('English Laboratory', 'GE3172', 4),
('Physics and Chemistry Laboratory', 'BS3171', 4),
('Matrices and calculus', 'MA3151', 5),
('Engineering Physics', 'PH3151', 5), 
('Engineering Chemistry', 'CY3151', 5),
('Heritage Of Tamils', 'GE3152', 5),
('Problem solving and python programming', 'GE3151', 5),
('Professional English-1', 'HS3152', 5),
('Problem solving and python programming laboratory', 'GE3171', 5),
('English Laboratory', 'GE3172', 5),
('Physics and Chemistry Laboratory', 'BS3171', 5);

-- Inserting data into semesters table
INSERT INTO semesters (semester_name)
VALUES ('Semester 1');

-- Inserting data into exams table
INSERT INTO exams (exam_name, exam_date, semester_id, course_id)
VALUES 
('Semester Exam', '2024-12-14', 1, 1),
('Semester Exam', '2024-12-16', 1, 2),
('Semester Exam', '2024-12-18', 1, 3),
('Semester Exam', '2024-12-20', 1, 4),
('Semester Exam', '2024-12-22', 1, 5),
('Semester Exam', '2024-12-24', 1, 6),
('Semester Exam', '2024-12-26', 1, 7),
('Semester Exam', '2024-12-28', 1, 8),
('Semester Exam', '2024-12-30', 1, 9),
('Semester Exam', '2024-12-14', 1, 10),
('Semester Exam', '2024-12-16', 1, 11),
('Semester Exam', '2024-12-18', 1, 12),
('Semester Exam', '2024-12-20', 1, 13),
('Semester Exam', '2024-12-22', 1, 14),
('Semester Exam', '2024-12-24', 1, 15),
('Semester Exam', '2024-12-26', 1, 16),
('Semester Exam', '2024-12-28', 1, 17),
('Semester Exam', '2024-12-30', 1, 18),
('Semester Exam', '2024-12-14', 1, 19),
('Semester Exam', '2024-12-16', 1, 20),
('Semester Exam', '2024-12-18', 1, 21),
('Semester Exam', '2024-12-20', 1, 22),
('Semester Exam', '2024-12-22', 1, 23),
('Semester Exam', '2024-12-24', 1, 24),
('Semester Exam', '2024-12-26', 1, 25),
('Semester Exam', '2024-12-28', 1, 26),
('Semester Exam', '2024-12-30', 1, 27),
('Semester Exam', '2024-12-14', 1, 28),
('Semester Exam', '2024-12-16', 1, 29),
('Semester Exam', '2024-12-18', 1, 30),
('Semester Exam', '2024-12-20', 1, 31),
('Semester Exam', '2024-12-22', 1, 32),
('Semester Exam', '2024-12-24', 1, 33),
('Semester Exam', '2024-12-26', 1, 34),
('Semester Exam', '2024-12-28', 1, 35),
('Semester Exam', '2024-12-30', 1, 36),
('Semester Exam', '2024-12-14', 1, 37),
('Semester Exam', '2024-12-16', 1, 38),
('Semester Exam', '2024-12-18', 1, 39),
('Semester Exam', '2024-12-20', 1, 40),
('Semester Exam', '2024-12-22', 1, 41),
('Semester Exam', '2024-12-24', 1, 42),
('Semester Exam', '2024-12-26', 1, 43),
('Semester Exam', '2024-12-28', 1, 44),
('Semester Exam', '2024-12-30', 1, 45);

-- Inserting data into exam_results table
INSERT INTO exam_results (student_id, exam_id, marks_obtained, grade)
VALUES 
(1, 1, 85.50, 'A'),
(1, 2, 53.00, 'B'),
(1, 3, 86.50, 'A'),
(1, 4, 55.00, 'B+'),
(1, 5, 90.50, 'A+'),
(1, 6, 87.50, 'A'),
(1, 7, 58.50, 'B'),
(1, 8, 87.50, 'A'),
(1, 9, 58.00, 'B'),
(2, 10, 86.50, 'A'),
(2, 11, 52.00, 'B'),
(2, 12, 82.50, 'A'),
(2, 13, 57.00, 'B+'),
(2, 14, 92.50, 'A+'),
(2, 15, 86.50, 'A'),
(2, 16, 59.50, 'B'),
(2, 17, 84.50, 'A'),
(2, 18, 55.00, 'B'),
(3, 19, 83.50, 'A'),
(3, 20, 56.00, 'B'),
(3, 21, 81.50, 'A'),
(3, 22, 58.00, 'B+'),
(3, 23, 96.50, 'A+'),
(3, 24, 84.50, 'A'),
(3, 25, 54.50, 'B'),
(3, 26, 87.50, 'A'),
(3, 27, 53.00, 'B'),
(4, 28, 88.50, 'A'),
(4, 29, 58.00, 'B'),
(4, 30, 85.50, 'A'),
(4, 31, 58.00, 'B+'),
(4, 32, 98.50, 'A+'),
(4, 33, 89.50, 'A'),
(4, 34, 75.50, 'B+'),
(4, 35, 85.50, 'A'),
(4, 36, 55.00, 'B'),
(5, 37, 96.50, 'A+'),
(5, 38, 54.00, 'B'),
(5, 39, 87.50, 'A'),
(5, 40, 59.00, 'B+'),
(5, 41, 99.50, 'A+'),
(5, 42, 84.50, 'A'),
(5, 43, 73.50, 'B+'),
(5, 44, 90.50, 'A'),
(5, 45, 52.00, 'B');