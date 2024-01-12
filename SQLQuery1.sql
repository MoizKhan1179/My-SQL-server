use ifra;
select * from courses;
select * from table1;



CREATE TABLE EMPLOYEE(
id int not null identity(100, 2),
fnmae varchar (255),
lname varchar(255),
email varchar(255),
designation varchar(255),
gender varchar (255),
age int,
salary int);


-- Inserting 10 random records into the EMPLOYEE table
INSERT INTO EMPLOYEE (fnmae, lname, email, designation, gender, age, salary)
VALUES
    ('John', 'Doe', 'john.doe@example.com', 'Manager', 'Male', 35, 80000),
    ('Jane', 'Smith', 'jane.smith@example.com', 'Developer', 'Female', 28, 65000),
    ('Michael', 'Johnson', 'michael.johnson@example.com', 'Analyst', 'Male', 40, 70000),
    ('Emily', 'Brown', 'emily.brown@example.com', 'Designer', 'Female', 32, 75000),
    ('Robert', 'Williams', 'robert.williams@example.com', 'Engineer', 'Male', 29, 70000),
    ('Sophia', 'Jones', 'sophia.jones@example.com', 'Manager', 'Female', 38, 85000),
    ('Daniel', 'Taylor', 'daniel.taylor@example.com', 'Analyst', 'Male', 31, 72000),
    ('Olivia', 'Miller', 'olivia.miller@example.com', 'Developer', 'Female', 27, 68000),
    ('William', 'Davis', 'william.davis@example.com', 'Engineer', 'Male', 33, 72000),
    ('Ava', 'Anderson', 'ava.anderson@example.com', 'Designer', 'Female', 30, 74000);

	select * from employee;


	select gender,sum(salary) as total_salary from EMPLOYEE group by (gender) with rollup;
		select designation,sum(salary) as totalSalary from EMPLOYEE group by (designation) with rollup;


		SELECT gender,designation,SUM(salary) AS total_Salary FROM EMPLOYEE GROUP BY gender, designation WITH ROLLUP;