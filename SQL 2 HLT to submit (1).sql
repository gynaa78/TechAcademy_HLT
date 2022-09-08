-- q1
SELECT COUNT(*) AS 'Number of Students' 
FROM student;

-- Q2 Calculate the sum of full time fees for every full-time course
SELECT max(FullTimeFee)
FROM uni.fees;

SELECT sum(FullTimeFee)
FROM uni.fees;
 
 -- Exploring min, avg fees
SELECT min(FullTimeFee)
FROM uni.fees;

SELECT AVG(FullTimeFee)
FROM uni.fees;

-- Q3 3. Identify the cost of the least and most expensive course
SELECT max(FullTimeFee) AS 'Maximum Full Time Fee#', Min(FullTimeFee) AS 'Minimum Full Time Fee',
 Max(PartTimeFee) AS 'Maximum Part Time Fee#', Min(PartTimeFee) AS 'Minimum Part Time Fee'
FROM uni.fees;

-- 4  Calculate the average cost of all part time courses
SELECT AVG(PartTimeFee)
FROM uni.fees;

-- Q.5  Calculate the fee of each full time course after applying (subtracting) the scholarship discount

SELECT CourseID,FullTimeFee, FullTimeFee -ScholarshipDiscount AS 'Discount Price'
FROM uni.fees
ORDER by 2 Desc;

-- q.6  Select only the course number of the cheapest full-time course
SELECT CourseID, Min(FullTimeFee)
FROM uni.fees;

-- Q.7 Find cost of the most expensive course after applying the scholarship discount
SELECT CourseID, Max(FullTimeFee -ScholarshipDiscount) AS 'Discount Price'
FROM uni.fees;

-- Q.8 Count the number of applications for History courses made between 01/03/2020 and 30/08/2020
Select * From application;

Select CourseAppliedFor,  DateOfApplication, count(applicationID) 
From uni.application
WHERE (CourseAppliedFor = 11) AND (DateOfApplication BETWEEN '2020-03-01' AND '2020-08-30')
GROUP BY CourseAppliedFor, DateOfApplication
Order by DateOfApplication;

-- Task 2 Database Functions
--  Q1 Write a select statement to obtain all of the student information for successful applications made for Course 11 which do not relate to current students

 SELECT * FROM uni.application 
 WHERE CourseAppliedFor = 11 AND accepted =1 AND StudentID =0;
 
 -- Q2 Modify the select statement from the previous example into an insert statement and insert the data into the student 
 
INSERT into uni.student
(Forenames, Surname, EmailAddress, CourseID)
select Forenames, Surname, EmailAddress, CourseAppliedFor
from uni.application
where CourseAppliedFor = 11
and StudentId = 0
and accepted = 1;
  
 -- Q3 Write a select statement to obtain all the information for the unsuccessful applications made for Course 11
  select * from application
  WHERE CourseAppliedFor =11 and accepted = 0;
  
  -- Q4 Modify the select statement from the previous example into a delete statement and delete the unsuccessful Course 11
DELETE FROM uni.application
WHERE CourseAppliedFor = 11 AND accepted = 0;
  
  -- Q5 Write a select statement to identify the unsuccessful applications for course 1 made after 01/03/2020
select * from uni.application
where courseappliedfor = 1
and accepted = 0
and dateofapplication > '2020-03-01';

-- Q6 Using the select statement from the previous example, modify it into an update statement and update the applications to successful

update uni.application
set accepted = 1
where courseappliedfor = 1
and accepted = 0
and dateofapplication > '2020-03-01';


-- Q7 Rollback
update uni.application
set accepted = 1
where courseappliedfor = 1
and accepted = 0
and dateofapplication > '2020-03-01';
rollback;
