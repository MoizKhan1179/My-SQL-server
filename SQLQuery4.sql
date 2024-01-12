use mosa;

select * from Departments;
select * from Employees;
select * from Projects;

create login shahid with password = 'shahid';
create user shahid for login shahid;

grant select, update, insert on dbo.Employees to shahid;
  
delete from Employees where EmployeeID = 3;


revoke update on dbo.Employees to shahid;