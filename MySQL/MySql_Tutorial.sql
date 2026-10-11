-- Create the instagram database if it does not already exist.
CREATE DATABASE IF NOT EXISTS instagram;

-- Select the instagram database for the following operations.
USE instagram;

-- Create the user table to store user information.
CREATE TABLE user(
-- Store a unique user ID.
Id int,
-- Store the user's age.
age int,
-- Store the user's name; NULL values are not allowed.
name VARCHAR(30) NOT NULL,
-- Store the user's email; duplicate emails are not allowed.
email VARCHAR(50) UNIQUE,
-- Store the number of followers; default value is 0.
follower INT DEFAULT 0,
-- Store the number of accounts the user follows.
following INT,
-- Allow only users whose age is 18 or above.
CONSTRAINT age_check CHECK(age >= 18),
-- Make Id the primary key of the user table.
primary key(Id)
);

-- Create the post table to store posts made by users.
CREATE TABLE post(
-- Store a unique ID for each post.
id INT PRIMARY KEY,
-- Store the post content with a maximum length of 100 characters.
content VARCHAR(100),
-- Store the ID of the user who created the post.
user_id INT,
-- Connect user_id with the Id column of the user table.
FOREIGN KEY(user_id) REFERENCES user(Id)
); 

-- Insert the first set of users into the user table.
INSERT INTO user 
-- Specify the columns that will receive the inserted values.
(id, age, name, email, follower, following)
-- Insert four user records.
VALUES
(101,19,"Waseem", "waseem@gmail.com", 490, 78),
(102,30,"Ali", "ali@gmail.com", 4290, 578),
(103,24,"Ashan", "ashan@gmail.com", 902, 178),
(104,20,"Naseem", "Naseem@gmail.com", 2960, 785);

-- Insert another set of users into the user table.
INSERT INTO user 
-- Specify the columns for these records.
(id, age, name, email, follower, following)
-- Insert user records.
VALUES
(105,19,"Mateen","mateen@gmail.com", 200, 70),
(106,31,"faheem", "faheem@gmail.com", 290, 78),
(107,22,"naeem", "naeem@gmail.com", 102, 18),
(108,20,"nadeem", "nadeem@gmail.com", 360, 85),
-- This row is missing the age value for the specified column list and may cause an error.
(109,"Saleem", "saleem@gmail.com", 170, 85);

-- Insert a user record while specifying only selected columns.
INSERT INTO user 
-- The age and follower columns are omitted, so their default/NULL behavior applies.
(id, name, email, following)
-- Insert Saleem's record.
VALUES
(109,"Saleem", "saleem@gmail.com", 85);

-- Display all columns and rows from the user table.
SELECT * FROM user;

-- Display only the Id and name columns of all users.
SELECT Id, name FROM user;

-- Display users who are following 200 or more accounts.
SELECT * FROM user  WHERE following >= 200;

-- Display each user's name and follower count when age is 20 or less.
SELECT name , follower FROM user  WHERE age <= 20;

-- Display name and age for users who are 20 or younger AND follow at least 200 accounts.
SELECT name , age FROM user  WHERE age <= 20 and following >= 200;

-- Display name and age for users who are 20 or younger OR follow at least 200 accounts.
SELECT name , age FROM user  WHERE age <= 20 or following >= 200;

-- Display users whose age is between 19 and 23, inclusive.
SELECT name , age FROM user  WHERE age BETWEEN 19 AND 23;

-- Display users whose email matches any email in the given list.
SELECT name , email FROM user WHERE email IN ("waseem@gmail.com","hasan@gami.com","ashan@gmail.com");

-- Display users whose age is either 19 or 20.
SELECT name , age, email FROM user WHERE age IN (19, 20);

-- Display users whose age is not 19 or 20.
SELECT name , age, email FROM user WHERE age NOT IN (19, 20);

-- Display the name and follower count of the first user whose age is 20 or less.
SELECT name , follower FROM user  WHERE age <= 20 LIMIT 1;

-- Display all users ordered by follower count from lowest to highest.
SELECT name , follower FROM user  Order by follower ASC;

-- Find the maximum follower count.
SELECT max(follower) FROM user;

-- Count users whose age is exactly 19.
SELECT count(age) FROM user WHERE age = 19;

-- Find the minimum age of the users.
SELECT min(age) FROM user;

-- Find the average age of the users.
SELECT avg(age) FROM user;

-- Find the total number of followers of all users.
SELECT sum(follower) FROM user;

-- Count users for each age group.
SELECT count(id) FROM user GROUP BY age;

-- For each age, find the maximum number of followers.
SELECT age, max(follower) FROM user GROUP BY age;

-- For each age, find the maximum follower count and keep groups above 200 followers.
SELECT age, max(follower) FROM user GROUP BY age HAVING max(follower) > 200; 

-- Filter age groups by maximum followers above 200 and sort the result by age ascending.
SELECT age, max(follower) FROM user GROUP BY age HAVING max(follower) > 200 ORDER BY age ASC; 

-- Try to change the follower count to 600 for users whose age is 200.
-- Note: This condition may match no rows because age 200 is not present.
UPDATE user SET follower = 600 where age = 200;

-- Disable MySQL safe-update mode so UPDATE/DELETE statements can run without key-based conditions.
SET SQL_SAFE_UPDATES = 0;

-- Delete the user whose follower count is 4290.
DELETE FROM user WHERE follower = 4290;

-- Add a City column and give "DG KHAN" as its default value.
ALTER TABLE user ADD COLUMN City VARCHAR(30) DEFAULT "DG KHAN";

-- Display the updated user table including the new City column.
SELECT * FROM user;

-- Remove the age column from the user table.
ALTER TABLE user DROP COLUMN age;

-- Rename the user table to insta_user.
ALTER TABLE user RENAME TO insta_user;

-- Display all records from the renamed table.
SELECT * FROM insta_user;

-- Rename insta_user back to user.
ALTER TABLE insta_user RENAME TO user;

-- Rename the follower column to sub and keep its type/default definition.
ALTER TABLE user CHANGE COLUMN follower sub INT DEFAULT 0;

-- Display the user table after renaming the column.
SELECT * FROM user;

-- Change the default value of the sub column to 5.
ALTER TABLE user MODIFY COLUMN sub INT DEFAULT 5;

-- Delete the post table permanently.
DROP table post;

-- Remove all records from the user table while keeping the table structure.
truncate table user;
