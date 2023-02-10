-- 1) Create the database using the CREATE DATABASE statement below:

CREATE DATABASE SalfordBuildingProjects;

-- 2) Use the below SQL statement to create the first table.  Create Employees table

Use SalfordBuildingProjects; 
 
CREATE TABLE Employees(
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(30) NOT NULL,
    MiddleName NVARCHAR(30) NULL,
    LastName NVARCHAR(30) NOT NULL,
    DepartmentID TINYINT NOT NULL,
    EmailAddress  NVARCHAR(50) NOT NULL,
    LineManagerID INT NULL,
    DateJoined DATE NOT NULL,
    DateLeft DATE NULL);

-- 3) Now create the second table which holds the department data -- Create Department table

CREATE TABLE Department(
    DepartmentID TINYINT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(30) NOT NULL,
    DepartmentEmail NVARCHAR(50) NULL,
    DepartmentTelephone NVARCHAR(40) NOT NULL) ;

-- 4) Finally, create the third table which holds the project data. --Create Projects table

CREATE TABLE Projects(
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectName NVARCHAR(50) NOT NULL,
    ProjectManagerID INT NULL FOREIGN KEY REFERENCES Employees(EmployeeID),
    StartDate DATE NULL,
    EndDate DATE NULL 
);

--5) Execute the below statement to add a foreign key constraint to the Employees table, so that the DepartmentID references the primary key of the Departments table:
--Add foreign key constraints

ALTER TABLE Employees
ADD CONSTRAINT fk_department
FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID);


--6) Execute the below statement to add a foreign key constraint to the LineManagerID column in the Employees 
-- table, so that this references the primary key of the same table. This is called a self-referencing primary key and is useful when 
-- we want to capture a hierarchy – as each person’s line manager will be another employee in the same table.

ALTER TABLE Employees 
ADD CONSTRAINT fk_employee
    FOREIGN KEY (LineManagerID) REFERENCES Employees(EmployeeID);

-- 7) Execute the below statement to insert details of the departments into the Department table.

INSERT INTO Department 
VALUES('Marketing','marketing@salfordbuildingprojects.co.uk','0161 123 4567'),
       ('HR', 'hr@salfordbuildingprojects.co.uk','0161 123 4568');


-- 8) Execute the below statement to insert details of the departments into the Department table. 
-- Note, as we are specifying the columns, we don’t have to insert them in the same order as they appear in the table.
--INSERT specifying columns
INSERT INTO Department (DepartmentEmail, DepartmentTelephone,DepartmentName)
VALUES ('operations@salfordbuildingprojects.co.uk', '0161 123 4590','Operations'),
     ('sales@salfordbuildingprojects.co.uk', '0161 123 4591','Sales');

-- 9) Write a SELECT statement which will return all the data you have just inserted into the Department table
 
 SELECT * FROM Department;

 -- 10) Will this statement execute successfully?

 INSERT INTO Employees
VALUES ('Beatrice', 'Alice', ' Robinson', 2, 'b.robinson@salfordbuildingprojects.co.uk', NULL,'2020-08-30',NULL); 
-- this will execute

-- 11) Will this statement execute successfully? INSERT INTO Employees

INSERT INTO Employees
VALUES ('Ejimofor', NULL, ' Chinweuba', NULL, 'e.chinweuba@salfordbuildingprojects.co.uk', 1,'2021-12-02', NULL);
-- this won't execute because department can't be null

-- corrected 
INSERT INTO Employees
VALUES ('Ejimofor', NULL, 'Chinweuba', 3, 'e.chinweuba@salfordbuildingprojects.co.uk', 1,'2021-12-02', NULL);




-- 12) Will this statement execute successfully? INSERT INTO Employees
INSERT INTO Employees
VALUES ('Ailén', 'Leal', 'Soria', 3, 1,'2022-10-22', NULL);

-- this won't run because e-mail is missing and it can't be null

--corrected

INSERT INTO Employees
VALUES ('Ailén', 'Leal', 'Soria', 3,'alea@gmail.com', 1,'2022-10-22', NULL);


-- 13) Will this statement execute successfully?
INSERT INTO Employees (FirstName, LastName, DepartmentID,
EmailAddress)
VALUES ('Houd', 'Mustafa', 3,
'h.mustafa@salfordbuildingprojects.co.uk');

-- Date Joined column is supposed to have a value, hence, this won't execute

--corrected
INSERT INTO Employees (FirstName, LastName, DepartmentID,EmailAddress,DateJoined)
VALUES ('Houd', 'Mustafa', 3,'h.mustafa@salfordbuildingprojects.co.uk','2018-01-20');

--14) Will this statement execute successfully?
INSERT INTO Employees (FirstName, LastName, DepartmentID,EmailAddress, DateJoined)
VALUES ('Charles', 'Dotson', 3, 9000, '2018-02-14');
-- This will execute successfully because all the values are listed satisfying the not null even though the email is wrong


-- 15) Will this statement execute successfully?
INSERT INTO Employees (FirstName, LastName, DepartmentID,EmailAddress, DateJoined)
VALUES ('Zhen', 'Pai', 3,'z.pai@salfordbuildingprojects.co.uk', 20181212);

-- This will not execute because the DateJoined value doesn't correspond to a date format.
--corrected
INSERT INTO Employees (FirstName, LastName, DepartmentID,EmailAddress, DateJoined)
VALUES ('Zhen', 'Pai', 3,'z.pai@salfordbuildingprojects.co.uk', '2018-12-12');

-- 16) Now we want to insert the following data into the Projects table.
--  • Ejimofor Chinweuba manages two projects, ‘Riverbank Way’ and ‘Crescent Towers’; they both started 23rd October 2019 and are on-going.
--  • Zhen Pai was managing the ‘Manchester Mall’ project which started on the 6th November 2017 but this finished on the 8th August 2022.
--Don’t forget that you will need the Employee IDs of the Project Manager to insert these projects, so you might want to carry out a 
-- select query on the Employees table first to confirm these.

INSERT INTO Projects(ProjectName,ProjectManagerID,StartDate)
VALUES('Riverbank Way',4,'2019-10-23'),
      ('Crescent Towers',4,'2019-10-23');
 
INSERT INTO Projects(ProjectName,ProjectManagerID,StartDate,EndDate)
VALUES('Manchester Mall',7,'2017-11-06','2022-08-08') ;

--17) Earlier we inserted an invalid email address for Charles Dotson. Let’s update this to the correct value:
UPDATE Employees
SET EmailAddress = 'c.dotson@salfordbuildingprojects.co.uk'
WHERE EmailAddress = '9000';

-- 18) Both projects managed by Ejimofor Chinweuba finished on the 17th December 2022. Update the projects table accordingly.

UPDATE Projects
SET EndDate = '2022-12-17'
WHERE ProjectManagerID = 4;

--19) Ailén Soria left the company on the 4th February 2023. Update her employee record accordingly
 
UPDATE Employees
SET DateLeft = '2023-02-04'
WHERE FirstName = 'Ailén' and LastName = 'Soria';

--EmployeeID is the best option to use for this
UPDATE Employees
SET DateLeft = '2023-02-04'
WHERE EmployeeID = 5;
 
 -- 20) The company decides to get rid of the departmental email addresses. Set all values in this column to NULL.
 
 UPDATE Department
 SET DepartmentEmail = NULL;

 -- 21) The company updates their telephone lines. All the telephone numbers which take 
 --     the form 0161 123 456* (where the * is any single digit) will now 
 --     be replaced by 0161 123 4592 (this means more than one department may share the same telephone line). 
 --     Write an update statement to update accordingly (Hint – think about our wildcard operators last week.)

 UPDATE Department
 SET DepartmentTelephone = '0161 123 4592'
 WHERE DepartmentTelephone LIKE '0161 123 456[0-9]';
 
 -- 22) The marketing department closes down and the Sales department becomes Sales & Marketing.
--     Delete the Marketing department record and update the Sales department record accordingly.
 
DELETE  
FROM Department
WHERE DepartmentName = 'Marketing';

UPDATE Department
SET DepartmentName = 'Sales & Marketing'
WHERE DepartmentName = 'Sales';

-- 23) Try deleting the HR department. Why can’t you do this?
--   (Hint – think about the other tables which might reference the DepartmentID as a foreign key. 
--    If you know everyone in the HR department was moved to Operations, can you update Employees accordingly?
--    Now can you run the delete statement?)

DELETE
FROM Department
WHERE DepartmentName = 'HR';

'ERROR'
-- The DELETE statement conflicted with the REFERENCE constraint "fk_department". 
--  The conflict occurred in database "SalfordBuildingProjects", table "dbo.Employees", column 'DepartmentID'.

-- Moving Employees to Operations who are in HR
UPDATE Employees
SET DepartmentID = 3
WHERE DepartmentID = 2;

-- Now, I can run the delete statement

DELETE
FROM Department
WHERE DepartmentName = 'HR';

 
