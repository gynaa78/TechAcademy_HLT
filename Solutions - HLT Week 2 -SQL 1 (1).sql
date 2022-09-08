c

# Question 1: Obtain all information on the Students not attending course 1
SELECT *
FROM uni.student
WHERE CourseID <> 1;

# Question 2:  Obtain the first name, surname and Date of Birth for the student with the email address: val.bolger@example.com
SELECT Forenames, Surname, DateOfBirth
FROM uni.student
WHERE EmailAddress = 'val.bolger@example.com';
  
# Question 3: Obtain a list of the modules which have the subject Economics 
SELECT ModuleName
From uni.module
WHERE subject = 'Economics';

-- Exploring the schedule table
SELECT * FROM uni.schedule;


# Question 4: Obtain a list of class numbers and their dates which are scheduled before 21st September 2020
SELECT ClassID, CDate
FROM uni.schedule
WHERE CDate < '2020-09-21';

-- Exploring the course table
SELECT * FROM uni.course; 

# Question 5: Insert a record for a new course named Deep-Space Radar Telemetry.
INSERT into uni.course
(CourseName)
values('Deep-Space Radar Telemetry');

-- checking if inserted
SELECT * FROM uni.course; 

# Question 6a -6e : Write an insert to insert records for the following modules:
   # String Theory
   # Exotic Matter
   # Harnessing the Einstein-Rosen Bridge
   # Supercollision and miniature Black Holes
#(these modules are worth 20 credits each, at level 6 and are taught on the Quantum Physics Course)
-- Exploring module table
SELECT * FROM uni.module;

-- Finding out the Quantum Physics Course
SELECT * FROM uni.course
WHERE
CourseName = 'Quantum Physics';

# 6a
INSERT into uni.module
(ModuleName, Subject, Level, CourseID, Credits)
values ('String Theory', 'Physics', 6, 6, 20);

# 6b
INSERT into uni.module
(ModuleName, Subject, Level, CourseID, Credits)
values ('Exotic Matter', 'Physics', 6, 6, 20);

# 6c
INSERT into uni.module
(ModuleName, Subject, Level, CourseID, Credits)
values ('Harnessing the Einstein-Rosen Bridge', 'Physics', 6, 6, 20);

# 6d
INSERT into uni.module
(ModuleName, Subject, Level, CourseID, Credits)
values ('Supercollision and miniature Black Holes', 'Physics', 6, 6, 20);

-- Rechecking the module table to ensure the above are inserted
SELECT * FROM uni.module;

-- Exploring the class table
SELECT * FROM uni.class;

# Question 7 Using the information from the previous example and the LecturerID of 6, create a class for each new module. 

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 105);

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 106);

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 107);

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 108);

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 109);

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 110);

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 111);

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 112);

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 113);

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 114);

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 115);

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 116);

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 117);

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 118);

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 119);

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 120);

INSERT into uni.class
(LecturerID, ModuleID)
values (6, 121);

-- checking if new classes ceated
SELECT * FROM uni.class;

# Using the 3rd Normal Form Student Data from Activity 3, write an insert to enter this student data into the Student Table of the Example Database 
SELECT * FROM uni.student;