-- Obtain a list of applications where the CourseID is unknown 
  SELECT * FROM uni.application 
WHERE courseappliedfor is null;

-- Q2. Obtain a list of students where their CourseID is not unknown 
SELECT * FROM Uni.student
WHERE CourseId is null;
 

-- Q3 Obtain a list of students whom were born in the month of June 2002 
SELECT * FROM Uni.student
WHERE DateOfBirth like monthname(6);
 

-- Q4 Obtain a list of applications where CourseID is unknown and the applications where  made between 01/04/2020 and 31/07/2020 
SELECT * FROM uni.application
WHERE CourseAppliedFor is null AND DateOfApplication BETWEEN'2020/04/01' and '2020/07/31'; 

-- TASK 2 GROUPING FUNCTIONS
# Q1. Obtain the number of modules which are assigned to each course 
SELECT subject,count(ModuleName)
 FROM uni.module
 GROUP BY subject;
 
-- Q.2 Retrieve Information on the number of successful applications per course 
SELECT CourseAppliedFor, accepted, COUNT(CourseAppliedFor) 
 FROM application
 WHERE accepted = 1
 group by CourseAppliedFor, accepted;
 

-- Q3 Find the average Membership Fee of Student Clubs by the ID of the Staff member (Lecturer) supervising it 
SELECT SupervisingStaff, AVG (MembershipFee) 
 FROM uni.club
 group by SupervisingStaff;

-- Q4. Find the Sum total of Joining Fees for all active clubs by Staff Member supervising them 
SELECT SupervisingStaff, SUM(JoiningFee) 
 FROM uni.club
 group by SupervisingStaff;
 
 -- ADVANCED JOINS
 -- 1. Obtain a list of all modules and the names of any courses they may be taught (include modules without courses) 

 SELECT module.ModuleName, module.CourseID, course.CourseName 
 FROM uni.module
 Join
 uni.course
 ON module.CourseID = course.CourseID
 Order by module.CourseID;

-- 2. Obtain a list of students along with any related application numbers if they have them 

SELECT student.forenames, student.surname ,student.studentID, application.applicationID
From uni.student
LEFT JOIN  uni.application
ON student. studentID = application.studentID
Order by student.studentID;

-- 3.Obtain the Class ID, Class Date and Feedback score of the latest class scheduled for each Class ID 
SELECT class.ClassID, schedule.CDate, schedule.FeedbackScore
 FROM uni.class
 Right join uni.schedule
 ON class.ClassID = schedule.ClassID
 ORDER BY schedule.ClassID;

