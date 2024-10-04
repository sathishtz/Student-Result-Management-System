-- Query to get results using roll number
SELECT 
    ROW_NUMBER() OVER (ORDER BY subjects.subject_name) AS S_No,
    students.roll_number, 
    students.student_name, 
    subjects.subject_name, 
    exams.exam_name, 
    exam_results.marks_obtained, 
    exam_results.grade
FROM 
    exam_results
JOIN 
    students ON exam_results.student_id = students.student_id
JOIN 
    exams ON exam_results.exam_id = exams.exam_id
JOIN 
    subjects ON exams.subject_id = subjects.subject_id
WHERE 
    students.roll_number = '1';  -- Replace 'Roll_No' with actual roll number

    
-- Query to view all results for a specific semester and subject
SELECT 
    ROW_NUMBER() OVER (ORDER BY students.student_name) AS S_No,
    students.student_name, 
    subjects.subject_name, 
    exams.exam_name, 
    exam_results.marks_obtained, 
    exam_results.grade
FROM 
    exam_results
JOIN 
    students ON exam_results.student_id = students.student_id
JOIN 
    exams ON exam_results.exam_id = exams.exam_id
JOIN 
    subjects ON exams.subject_id = subjects.subject_id
JOIN 
    semesters ON exams.semester_id = semesters.semester_id
WHERE 
    semesters.semester_name = 'Semester 1';

    
-- Query to get all results of all students
SELECT 
    ROW_NUMBER() OVER (ORDER BY students.student_name) AS S_No,
    students.student_name, 
    subjects.subject_name, 
    exams.exam_name, 
    exam_results.marks_obtained, 
    exam_results.grade
FROM 
    exam_results
JOIN 
    students ON exam_results.student_id = students.student_id
JOIN 
    exams ON exam_results.exam_id = exams.exam_id
JOIN 
    subjects ON exams.subject_id = subjects.subject_id;
    
    -- to view student results using stored procedure
    delimiter $$
    create procedure result()
    begin
    SELECT 
    ROW_NUMBER() OVER (ORDER BY subjects.subject_name) AS S_No,
    students.roll_number, 
    students.student_name, 
    subjects.subject_name, 
    exams.exam_name, 
    exam_results.marks_obtained, 
    exam_results.grade
FROM 
    exam_results
JOIN 
    students ON exam_results.student_id = students.student_id
JOIN 
    exams ON exam_results.exam_id = exams.exam_id
JOIN 
    subjects ON exams.subject_id = subjects.subject_id
WHERE 
    students.roll_number =(1);  -- Replace 'Roll_No' with actual roll number
end $$
-- to get procedure result 
call result();
-- to drop a procedure
drop procedure result;

-- get student results using store procedures
DELIMITER $$

CREATE PROCEDURE GetStudentResultsByRollNumber(IN roll_no VARCHAR(20))
BEGIN
    SELECT 
        ROW_NUMBER() OVER (ORDER BY subjects.subject_name) AS S_No,
        students.roll_number, 
        students.student_name, 
        subjects.subject_name, 
        exams.exam_name, 
        exam_results.marks_obtained, 
        exam_results.grade
    FROM 
        exam_results
    JOIN 
        students ON exam_results.student_id = students.student_id
    JOIN 
        exams ON exam_results.exam_id = exams.exam_id
    JOIN 
        subjects ON exams.subject_id = subjects.subject_id
    WHERE 
        students.roll_number = roll_no;
END$$

DELIMITER ;
 -- to view output sunig stored procedure
 CALL GetStudentResultsByRollNumber('1');
