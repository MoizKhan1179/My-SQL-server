create database company1

use company1;

-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
	Dept int
);
select * from Employees;


INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary,Dept)
VALUES
    (1, 'John', 'Doe', 1, 60000.00,1),
    (2, 'Jane', 'Smith', 2, 55000.00,2),
    (3, 'Mike', 'Johnson', 1, 65000.00,1),
    (4, 'Emily', 'Williams', 3, 70000.00,3),
    (5, 'David', 'Brown', 2, 50000.00,2),
    (6, 'Sarah', 'Miller', 1, 62000.00,3),
    (7, 'Chris', 'Wilson', 3, 75000.00,2),
    (8, 'Anna', 'Jones', 2, 53000.00,1),
    (9, 'Brian', 'Taylor', 1, 58000.00,2),
    (10, 'Laura', 'Anderson', 3, 72000.00,3);

select * from employees;


--05.
Select * from employees where Salary>(50000);

--07.
Select * from employees where lastName like 's%';

--09.
Select sum(Salary) as 'Total salary' from Employees;

--10.
Select max(salary) from employees;




-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY ,
    DepartmentName VARCHAR(50),
	
);

select * from departments;

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');

select * from Departments;


select * from Employees as e join Departments as d on e.DepartmentID=d.DepartmentID;


select EmployeeID,FirstName, LastName, Salary, DepartmentName from Employees as e join Departments as d on e.DepartmentID=d.DepartmentID;



create view emp_3 
as
 select * from employees;
UPDATE Employees set FirstName ='ali'where EmployeeID = 3 ;

select * from emp_3;

 select definition from sys.sql_modules
 where object_id=object_id('emp_3');

Sp_helptext emp_3;

CREATE TABLE Projects(
ProjectID int not null,
ProjectName varchar(255),
startDate varchar(20)
);


Instructions:

1. Create a new table named Projects with columns ProjectID, ProjectName, and StartDate.

2. Insert five employees into the Employees table.

3. Insert three departments into the Departments table.

4. Assign each employee to a department in the Employees table.

5. Retrieve the details of employees whose salary is above 50000.

6. Fetch a list of all employees along with the department they belong to.

7. Retrieve the employees whose last name starts with 'S'.

8. Retrieve the projects with names containing the word 'Database'.

9. Calculate the total salary of all employees.

10.Find the department with the highest average salary.

--

-- last class
create table depart (
	ID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary int,
	Designation varchar(50),
	gender varchar(10)
	   );
	  
insert into depart (ID,FirstName,LastName, Salary, Designation, gender) values 
	(1, 'John', 'Doe', 50000, 'Manager', 'Male'),
    (2, 'Jane', 'Smith', 60000, 'Developer', 'Female'),
    (3, 'Mike', 'Johnson', 55000, 'Developer', 'Male'),
    (4, 'Sarah', 'Miller', 65000, 'Developer', 'Female'),
    (5, 'Alex', 'Davis', 70000, 'Developer', 'Male'),
    (6, 'Emily', 'Wilson', 52000, 'Coordinator', 'Female'),
    (7, 'Brian', 'Lee', 48000, 'Assistant', 'Male'),
    (8, 'Rachel', 'Brown', 56000, 'Assistant', 'Female'),
    (9, 'Tom', 'Clark', 62000, 'Assistant', 'Male'),
    (10, 'Linda', 'Taylor', 58000, 'Analyst', 'Female');


	select * from depart;

select designation, sum(salary) from depart group by (designation) with rollup;


select designation, sum(salary) as Total_Salary from depart group by cube (designation,salary);





--new
create table admin(
	ID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary int,
	Designation varchar(50),
	gender varchar(10)
	   );

insert into admin (ID,FirstName,LastName, Salary, Designation, gender) values 
	(1, 'Joh', 'Doe', 50000, 'Manager', 'Male'),
    (2, 'Jan', 'Smith', 60000, 'Developer', 'Female'),
    (3, 'Mik', 'Johnson', 55000, 'Developer', 'Male'),
    (4, 'Sara', 'Miller', 65000, 'Developer', 'Female'),
    (5, 'Ale', 'Davis', 70000, 'Developer', 'Male'),
    (6, 'Emil', 'Wilson', 52000, 'Coordinator', 'Female'),
    (7, 'Bria', 'Lee', 48000, 'Assistant', 'Male'),
    (8, 'Rache', 'Brown', 56000, 'Assistant', 'Female'),
    (9, 'To', 'Clark', 62000, 'Assistant', 'Male'),
    (10, 'Lind', 'Taylor', 58000, 'Analyst', 'Female');

select Designation,Gender from admin;
select * from admin;

 --Scalar Function Without Parameter

 create function fullName()
 returns varchar(255)

 begin

  return 'Waqas Ali'

 end

 select dbo.fullName()


  --Scalar Function With Parameter

 create function addition (@num1 as int, @num2 as int)
 returns int
 begin
 return (@num1+@num2) 
 
 end

 select dbo.addition(10,2)

 --function with Variable

 create function student (@age as int)
 returns varchar(255)
 as 
 begin
 declare @str varchar(100)
  if (@age >=15)
  begin
  set @str='you r eligible to take admission in Aptech'
  end
  else
  begin
  set @str='you r not Eligible'
  end
  return @str
  
 end

 select dbo.student(12)


 create function emp()
 returns table
 as
 return select * from admin 

 select * from emp()
 
 
 
 create function maleEmp(@gender as varchar(20))
 returns table 
 as 
 return select * from admin where gender=@gender

 select * from maleEmp('male')


 alter function maleEmp()
 returns table 
 as 
 return select distinct designation from admin 

 select * from maleEmp()



 create procedure SPJoin
 as 
 begin
 select * from Employees as e join departments as d on e.departmentID=d.departmentID;
 End
 GO

 exec SPJoin

 create procedure SpempswithID
 @ID int
 as 
 begin
 select firstName, LastName,((salary/100)*5)+salary from employees where EmployeeID =@ID 
 
 end
 Go
  
  exec SpempswithID ;

  select * from employees;
 
  select * from employees where dept=(select departmentID from departments where DepartmentName ='IT');

--triggers--

  --INSERT--
  create trigger tr_emp1 on employee
  for insert
  as 
  begin
  print 'Someone is trying to breach'
  end

    create trigger tr_emp_insert1 on employee
  after insert
  as 
  begin
  select * from inserted
  end



  --inserting value into tr_emp


  insert into employee(fnmae, lname, email, designation,gender, age, salary)
  values
		('Hammad','Ali','Hammad@gmail.com','IT manager','Male', 20, 500000)


	--delete trigger
	    create trigger tr_emp_del1 on employee
  after delete
  as 
  begin
  print 'user deleted'
  end		

  delete from employee where id= 122

  select * from employee

 --TRIGGERED UPDATE--

 	    create trigger tr_emp_update1 on employee
  after update 
  as 
  begin
	select * from inserted
	select * from deleted
  end

   insert into employee(fnmae, lname, email, designation,gender, age, salary)
  values
		('Hammad','Ali','Hammad@gmail.com','IT manager','Male', 20, 500000)

--UPDATE QUERY--

slect * from inserted
update employee set fnmae= 'Mosa' where id = 124



create table insert_trigger_details(
id int primary key identity,
auditInfo varchar(255)
);

create trigger  insert_trigger_audit on employee 
after insert 
as
begin 
declare @id int, @name varchar(255)
select @id = id, @name = fnmae from inserted 
insert into insert_trigger_details values ('user with id' + CAST(@id as varchar (52)) + 'with name' + @name + 'is inserted in the table')
end
select * from insert_trigger_details


create trigger  Del_trigger_audit on employee 
after delete
as
begin 
declare @id int, @name varchar(255)
select @id = id, @name = fnmae from deleted
insert into insert_trigger_details values
 ('user with id' + CAST(@id as varchar (52)) + 'with name' + @name + 'is deleted from the table')
end
select * from Del_trigger_details
