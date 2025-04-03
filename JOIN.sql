--Following query uses JOIN to join employee name and role with corresponding department. Joins data from 2 tables.
--Inner Join returns only overlapping data inside 2 tables, which are without nulls.

Select 
employees.name as employee_name,   --employee.name to retrieve names from employee table (alias)
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


---------------------------------------------------------------------------------------
--In 2015, how many people were of the official age for secondary education broken down by region of the world?

SELECT
summary.region,
SUM(edu.value) secondary_edu_population      --Use the SUM(value) to calculate the total population for a given size
FROM
    `bigquery-public-data.world_bank_intl_education.international_education` AS edu
Inner JOIN
    `bigquery-public-data.world_bank_intl_education.country_summary` AS summary
ON edu.country_code = summary.country_code        --country_code is our key
    WHERE summary.region IS NOT NULL              --Exclude rows with a missing region.
    AND edu.indicator_name = 'Population of the official age for secondary education, both sexes (number)'
    AND edu.year = 2015
GROUP BY summary.region
ORDER BY secondary_edu_population DESC      --Sort by highest population region first.
