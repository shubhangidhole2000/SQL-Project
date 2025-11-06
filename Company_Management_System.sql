--  Create Database
create database company_db;
use company_db;

-- Create Tables
-- Department Table
create table department
(dept_id int primary key,
dept_name varchar(50) not null unique,
location varchar(50));

-- Employee Table
create table employee 
(emp_id int primary key,
emp_name varchar(50) not null,
age int,
salary int not null,
dept_id int,
email varchar(100) unique,
foreign key (dept_id) references department(dept_id));

-- Projects Table
create table projects 
(project_id int primary key,
project_name varchar(50) not null,
dept_id int,
budget int not null,
start_date date,
end_date date,
foreign key (dept_id) references department(dept_id));

-- Attendance Table
create table attendance 
(attend_id int primary key,
emp_id int,
attend_date date,
status varchar(10),
foreign key (emp_id) references employee(emp_id));

-- Salary History Table
CREATE TABLE salary_history 
(sal_id int primary key,
emp_id int,
old_salary int,
new_salary int,
change_date date,
foreign key (emp_id) references employee(emp_id));


-- Insert Data
-- Department Data
insert into department
(dept_id, dept_name, location) 
values
(1,'HR','Mumbai'), 
(2,'IT','Pune'), 
(3,'Finance','Delhi'), 
(4,'Marketing','Bangalore'), 
(5,'Operations','Chennai');

-- Employee Data
insert into employee
(emp_id, emp_name, age, salary, dept_id, email)
values
(1,'Rahul',28,50000,2,'rahul@gmail.com'),
(2,'Priya',32,60000,1,'priya@gmail.com'),
(3,'Sneha',27,70000,2,'sneha@gmail.com'),
(4,'Karan',35,62000,3,'karan@gmail.com'),
(5,'Meera',29,56000,4,'meera@gmail.com'),
(6,'Rohan',31,70000,2,'rohan@gmail.com'),
(7,'Reena',33,80000,1,'reena@gmail.com'),
(8,'Ankit',26,54000,3,'ankit@gmail.com'),
(9,'Sahil',30,75000,2,'sahil@gmail.com'),
(10,'Neha',28,58000,4,'neha@gmail.com'),
(11,'Vikram',34,69000,5,'vikram@gmail.com'),
(12,'Tina',29,60000,1,'tina@gmail.com'),
(13,'Ravi',27,52000,3,'ravi@gmail.com'),
(14,'Sonali',31,63000,4,'sonali@gmail.com'),
(15,'Manish',32,65000,5,'manish@gmail.com');

--  Projects Data
insert into projects
(project_id, project_name, dept_id, budget, start_date, end_date)
VALUES
(1,'Project Alpha',2,120000,'2024-01-01','2024-06-30'),
(2,'Project Beta',1,90000,'2024-02-01','2024-08-31'),
(3,'Project Gamma',3,150000,'2024-03-15','2024-09-30'),
(4,'Project Delta',4,110000,'2024-04-01','2024-12-31'),
(5,'Project Epsilon',5,130000,'2024-05-01','2024-11-30'),
(6,'Project Zeta',2,100000,'2024-06-01','2024-12-15'),
(7,'Project Eta',1,95000,'2024-07-01','2024-10-31'),
(8,'Project Theta',3,120000,'2024-08-01','2024-12-31'),
(9,'Project Iota',4,115000,'2024-09-01','2024-12-31'),
(10,'Project Kappa',5,125000,'2024-10-01','2025-03-31'),
(11,'Project Lambda',2,140000,'2024-11-01','2025-04-30'),
(12,'Project Mu',1,100000,'2024-12-01','2025-05-31'),
(13,'Project Nu',3,105000,'2025-01-01','2025-06-30'),
(14,'Project Xi',4,135000,'2025-02-01','2025-07-31'),
(15,'Project Omicron',5,145000,'2025-03-01','2025-08-31');

-- Attendance Data
insert into attendance
(attend_id, emp_id, attend_date, status)
values
(1,1,'2025-09-01','Present'),
(2,2,'2025-09-01','Absent'),
(3,3,'2025-09-01','Present'),
(4,4,'2025-09-01','Leave'),
(5,5,'2025-09-01','Present'),
(6,6,'2025-09-01','Present'),
(7,7,'2025-09-01','Absent'),
(8,8,'2025-09-01','Present'),
(9,9,'2025-09-01','Leave'),
(10,10,'2025-09-01','Present'),
(11,11,'2025-09-01','Present'),
(12,12,'2025-09-01','Absent'),
(13,13,'2025-09-01','Present'),
(14,14,'2025-09-01','Present'),
(15,15,'2025-09-01','Leave');

-- Salary History Data
insert into salary_history
(sal_id, emp_id, old_salary, new_salary, change_date)
values
(1,1,45000,50000,'2025-01-01'),
(2,2,55000,60000,'2025-02-01'),
(3,3,65000,70000,'2025-03-01'),
(4,4,60000,62000,'2025-04-01'),
(5,5,50000,56000,'2025-05-01'),
(6,6,65000,70000,'2025-06-01'),
(7,7,75000,80000,'2025-07-01'),
(8,8,50000,54000,'2025-08-01'),
(9,9,70000,75000,'2025-09-01'),
(10,10,55000,58000,'2025-01-15'),
(11,11,65000,69000,'2025-02-15'),
(12,12,55000,60000,'2025-03-15'),
(13,13,50000,52000,'2025-04-15'),
(14,14,60000,63000,'2025-05-15'),
(15,15,62000,65000,'2025-06-15');

-- Show Table Data
-- Department Table
select * from department;

-- Employee Table
select * from employee;

-- Projects Table
select * from projects;

-- Attendance Table
select * from attendance;

-- Salary History Table
select * from salary_history;

-- UPDATE :-
-- Update the employee whose emp_id = 15. Change the name to Sakshi and salary to 75000.
update employee
set emp_name = 'Sakshi', salary = 750000
where emp_id = 15;

-- WHERE:- 
-- Show all employees whose salary is more than 65000.
select emp_name, salary from employee
where salary > 65000;

-- WHERE:- 
-- Display attendance records where status is 'Leave'.
select emp_id, attend_date, status from attendance
where status = "Leave";

-- BETWEEN,AND :- 
-- Find employees whose age is between 28 and 32 and salary is greater than 55000.
select emp_name, age, salary from employee
where (age between 28 and 32) and salary > 55000;

-- IN :- 
-- Show departments located in 'Mumbai', 'Pune', 'Delhi'.
select dept_name, location from department
where location in ('Mumbai','Pune','Delhi');

-- LIKE:- 
-- List employees whose name start with 'R'.
select emp_name from employee
where emp_name like 'R%';

-- ORDER BY, LIMIT:- 
-- Show employees sorted by age (youngest to oldest).
select emp_id, emp_name, age from employee
order by age asc;

-- Show top 5 highest paid employees.
select emp_id, emp_name, salary from employee
order by salary desc
limit 5;

-- Aggregate Function:- 
-- Find the lowest budget, highest budget and average budget among projects.
select min(budget) as lowest_budget,
max(budget) as highest_budget,
avg(budget) as average_budget
from projects;

-- GROUP BY, HAVING:- 
-- Show attendance status where more than 4 employees are marked same.
select status, count(emp_id) AS total_count
from attendance
group by status
having count(emp_id) > 2;


-- CONCATINATE :- 
-- Show employee name and department ID together in one column called emp_info.
select concat(emp_name, ' - ', dept_id) as emp_info
from employee;

-- DATE FUNCTION :- 
-- Show each projects name and extract year from project start dates.
select project_name, year(start_date) as start_year
from projects;

-- JOIN :- 
-- Display all Employees along with their Department name and Department location.
select e.emp_name, d.dept_name, d.location
from employee e
join department d on e.dept_id = d.dept_id;

-- SUBQUERY :- 
-- Show employees email whose department is "Finance".
select email from employee
where dept_id in (select dept_id from department where dept_name = 'Finance');

-- show employees name who were absent on '2025-09-01'.
select emp_name from employee 
where emp_id in (select emp_id from attendance 
				 where attend_date = '2025-09-01' and status = 'Absent');

-- WINDOWS FUNCTION :- 
-- RANK :- 
-- Rank Employees by new_salary.
select emp_id, new_salary,
rank() over (order by new_salary desc) as salary_rank
from salary_history;

-- DENSE RANK :– 
-- Rank salaries in each department.
select emp_id, emp_name, dept_id, salary,
dense_rank() over (partition by dept_id order by salary desc) as dept_salary_rank
from employee;
