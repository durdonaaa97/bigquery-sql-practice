--Following query uses JOIN to join employee name and role with corresponding department. Joins data from 2 tables.
--Inner Join returns only overlapping data inside 2 tables, which are without nulls.

Select 
employees.name as employee_name,   --employee.name to retrieve names from employee table 
employees.role as employee_role,
departments.name as department_name
From `astral-trees-454812-s3.employee_data.employees` as employees
Inner Join `astral-trees-454812-s3.employee_data.departments` as departments
On employees.department_id= departments.department_id


--Left/Right Join returns either Left or Right table with overlapping data inside the 2 tables, so it might include data with nulls.

Select 
employees.name as employee_name,   --employee.name to retrieve names from employee table 
employees.role as employee_role,
departments.name as department_name
From `astral-trees-454812-s3.employee_data.employees` as employees
Right Join `astral-trees-454812-s3.employee_data.departments` as departments
On employees.department_id= departments.department_id

  
--Left Join
Select 
employees.name as employee_name,   --employee.name to retrieve names from employee table 
employees.role as employee_role,
departments.name as department_name
From `astral-trees-454812-s3.employee_data.employees` as employees
Left Join `astral-trees-454812-s3.employee_data.departments` as departments
On employees.department_id= departments.department_id
