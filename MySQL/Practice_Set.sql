-- Create the college database if it does not already exist.
CREATE DATABASE IF NOT EXISTS college;

-- Select the college database.
USE college;

-- Create a Teacher table to store teacher information.
CREATE TABLE Teacher(
-- Store a unique ID for each teacher.
Id INT PRIMARY KEY,
-- Store the teacher's name.
name VARCHAR(30),
-- Store the teacher's subject.
subject VARCHAR(20),
-- Store the teacher's salary.
salary int
);

-- Insert teacher records into the Teacher table.
INSERT INTO Teacher
-- Specify the columns that will receive the values.
(Id, name, subject, salary) 
-- Insert four teacher records.
VALUES
(23, "Waseem", "Math", 50000),
(47, "Ashan", "English", 60000),
(18, "Aslam", "Chemistry", 450000),
(9, "Amina", "Physics",750000);

-- Display all teachers and all columns.
SELECT * FROM Teacher;

-- Display only teachers whose salary is greater than 50,000.
SELECT * FROM Teacher WHERE Salary > 50000;

-- Rename the salary column to ctc while keeping it as an integer.
ALTER TABLE Teacher 
CHANGE COLUMN salary ctc INT;

-- Increase every teacher's CTC by 25%.
UPDATE Teacher SET ctc = ctc + ctc * 0.25;

-- Add a city column and set DG KHAN as its default value.
ALTER TABLE Teacher
ADD COLUMN city VARCHAR(30) DEFAULT "DG KHAN";

-- Remove the ctc column from the Teacher table.
ALTER TABLE teacher
DROP ctc;
