-- Create a new database named college.
CREATE DATABASE college;

-- Select the college database so the following commands run inside it.
USE college;

-- Create a student table with roll number, name, and age.
CREATE TABLE student(
-- Store the student's roll number as an integer.
rollno INT,
-- Store the student's name with a maximum length of 30 characters.
name VARCHAR(30),
-- Store the student's age as an integer.
age INT
);

-- Insert student records into the student table.
INSERT INTO student 
-- Insert values in the order: rollno, name, age.
VALUES 
(101, "Waseem", 22),
(102, "Ashan", 23);

-- Display all records and all columns from the student table.
SELECT * FROM student;
