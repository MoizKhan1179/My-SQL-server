--functions in MySQL server

--table valued function

SELECT Floor(4.4);

--Scalar function without parameters

create function Anime()
returns varchar(255)
begin

return 'One Piece'

end

select dbo.Anime() as Anime;

--Scalar func with parameater

create function addition(@num1 as int, @num2 as int)
returns int

begin

return (@num1 + @num2)

end

select dbo.addition(2,4) as addition; 



CREATE TABLE employee(
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


--function with parameter


create function students(@age as int)
returns varchar(255)
as
begin
declare @str varchar(100)

if(@age >= 18)

begin 
set @str = 'You are eligible for this job'
end

else

begin
set @str = 'Card Declined'
end

return  @str
end

select dbo.students(11); 

-- Table valued Function

create function emp()
returns table
as
return select * from employee

select * from emp()

create function maleEmp(@gender as varchar(20))
returns table
as
return select * from employee where gender = @gender

select * from maleEmp('male');




alter function maleEmp()
returns table
as
return select distinct designation from employee

select * from maleEmp();