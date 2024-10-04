# Student-Result-Management-System

## Project Overview

This project is a **Student Result Management System** built using **MySQL**. It allows administrators to manage student details, courses, exams, and results, and provides functionalities to view student results based on various parameters like roll number, name, or semester.

## Features

- Add and manage departments, students, and subjects.
- Store and retrieve exam results for students.
- Query results based on student name, roll number, or other criteria.
- Display results with serial numbers for easy reference.
  
## Technologies Used

- MySQL
- SQL Queries

## Database Schema

The database consists of the following tables:
- `students`: Stores student information (name, roll number, DOB, gender, email, phone number, department).
- `departments`: Stores department details (e.g., department name).
- `subjects`: Stores subject/course information (subject name, code, and department association).
- `semesters`: Stores semester details.
- `exams`: Stores information about exams.
- `exam_results`: Stores exam results for each student.

## Setup Instructions

1. Clone the repository:

   ```bash
   git clone https://github.com/sathishtz/Student_Result_Management_System.git
