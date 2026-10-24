-- Part 1

SELECT first_name || ' ' || last_name AS full_name
FROM hr.employees;

SELECT employee_id, first_name, last_name, salary, salary * 12 AS annual_salary
FROM hr.employees;

--Part 2: Self-Practice (No Answers)
--Try these on your own using hr.employees.

-- 1)List all distinct values of job_id.

select distinct JOB_ID from hr.EMPLOYEES


-- 2)Show commission_pct and salary for the first 10 rows (use FETCH FIRST 10 ROWS ONLY or equivalent).



SELECT commission_pct,salary  
from HR.EMPLOYEES
where rownum<=10


-- 3)Write a SELECT that returns each employee’s employee_id and a literal value 'HR' in a column named department


SELECT *
FROM HR.EMPLOYEES
WHERE JOB_ID LIKE 'HR%';


-- Part 3: Additional Practice — 20 Medium + 20 Hard Questions (With Hints)
-- All questions use hr.employees and hr.departments only.



--M1. Display employee_id, first_name, last_name, and a new column full_name that is first_name and last_name concatenated with a comma between them (e.g., "John, Doe").
   --Hint: Use first_name || ', ' || last_name and alias it as full_name.

SELECT employee_id,first_name,last_name,first_name||', ' ||last_name AS full_name 
from HR.EMPLOYEES;


-- M2. List employee_id, salary, and a column bonus_10_pct showing 10% of salary (salary * 0.10).
-- Hint: Use an arithmetic expression and alias.

   SELECT employee_id,salary, salary*0.10 AS bonus_10_pct 
   FROM HR.EMPLOYEES;



-- M3. Show employee_id, hire_date, and a literal column record_type with value 'Employee' for every row.
-- Hint: Add 'Employee' AS record_type in the SELECT list.

    SELECT employee_id,hire_date, 'Employee' as record_type
    From HR.EMPLOYEES


-- M4. For each employee, display email and a column email_domain set to the literal '@company.com'.
-- Hint: Use a string literal with an alias; no concatenation required for this part.

select employee_id,email,'@comapany.com' as email_domain
from HR.EMPLOYEES


-- M5. List employee_id, salary, commission_pct, and effective_commission where effective_commission is NVL(commission_pct, 0).
-- Hint: Use NVL(commission_pct, 0) AS effective_commission.

SELECT employee_id,salary,commission_pct, NVL(commission_pct,0)
FROM HR.EMPLOYEES



-- M6. Display first_name, last_name, and a column initials formed by the first character of first_name and the first character of last_name (e.g., "JD").
-- Hint: Use SUBSTR(first_name, 1, 1) and SUBSTR(last_name, 1, 1) concatenated.

SELECT first_name,
        last_name ,
        substr(first_name,1,1) || substr(LAST_NAME,1,1)  as initials
from HR.EMPLOYEES;




-- M7. Show employee_id, salary, and annual_salary as salary * 12, and also annual_plus_bonus as salary * 12 * 1.1 (10% bonus).
-- Hint: Two calculated columns with aliases.

select employee_id,
        salary,
        salary*12 as annual_salary,
        salary*12*1.1 as annual_plus_bonus
FROM
    HR.EMPLOYEES;


-- M8. List all columns from hr.departments using explicit column names (department_id, department_name, manager_id, location_id).
-- Hint: SELECT each column name from hr.departments; no *.

SELECT DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID
 FROM HR.departments



-- M9. From hr.employees, select employee_id and a column description that is the literal 'Emp#' concatenated with employee_id (cast to string if needed: use TO_CHAR(employee_id)).
-- Hint: 'Emp#' || TO_CHAR(employee_id) AS description.

SELECT employee_id, 'Emp#' || TO_CHAR(employee_id)
FROM HR.EMPLOYEES



-- M10. Display job_id, salary, and a column salary_band that is the literal 'Standard' for every row.
-- Hint: Add 'Standard' AS salary_band in SELECT.

SELECT JOB_ID,salary, 'Standard' as salary_band
from HR.EMPLOYEES


-- M11. List employee_id, first_name, last_name, and a column display_name as "Last, First" (last_name, comma space, first_name).
-- Hint: last_name || ', ' || first_name AS display_name.

SELECT first_name,last_name,last_name|| ', '||first_name as display_name
from HR.EMPLOYEES


-- M12. Show department_id from hr.departments and a literal 1 as column sort_order.
-- Hint: SELECT department_id, 1 AS sort_order FROM hr.departments.

SELECT department_id,1 as sort_order
from hr.departments


-- M13. From hr.employees, display salary and monthly_net as salary * 0.85 (assuming 15% tax).
-- Hint: salary * 0.85 AS monthly_net.



SELECT salary, salary*0.85 as monthly_net
from HR.employees

-- M14. List employee_id, commission_pct, and commission_display where NULL commission_pct is shown as 0 using NVL.
-- Hint: NVL(commission_pct, 0) AS commission_display.

SELECT employee_id, commission_pct,NVL(commission_pct,0) as commission_display
FROM
HR.EMPLOYEES


-- M15. Display first_name, last_name, salary, and a column compensation that is salary * (1 + NVL(commission_pct, 0)).
-- Hint: Total comp = salary + salarycommission_pct; factor as salary(1 + NVL(commission_pct,0)).

select first_name,last_name,salary,salary*(1+NVL(commission_pct,0)) as compensation
FROM
HR.EMPLOYEES


-- M16. From hr.departments, list department_name and a literal column region with value 'HQ'.
-- Hint: SELECT department_name, 'HQ' AS region FROM hr.departments.

select department_name, 'HQ' as region
FROM
HR.departments


-- M17. Show employee_id, hire_date, and a column years_label with literal 'Years of service'.
-- Hint: Add a string literal with alias years_label.

SELECT employee_id,hire_date,'Years of service' as years_label
from 
HR.employees

-- M18. List employee_id, salary, and double_salary as salary * 2.
-- Hint: Simple arithmetic expression with alias.

SELECT employee_id,salary,salary*2 as double_salary
FROM
HR.EMPLOYEES

-- M19. From hr.employees, display manager_id and a column has_manager that is the literal 'Yes' when manager_id is not null and 'No' when manager_id is null (use NVL2: NVL2(manager_id, 'Yes', 'No')).
-- Hint: NVL2(manager_id, 'Yes', 'No') AS has_manager.

SELECT MANAGER_ID,NVL2(MANAGER_ID,'Yes','No')
FROM
HR.EMPLOYEES


-- M20. Show department_id, department_name from hr.departments, and a calculated column dept_code as the first 3 characters of department_name (use SUBSTR).
-- Hint: SUBSTR(department_name, 1, 3) AS dept_code.

SELECT department_id,department_name,SUBSTR(department_name,1,3) as dept_code
FROM
HR.departments

-- 20 Hard Questions

-- H1. Display employee_id, first_name, last_name, salary, and a column salary_rank_label that is 'High' if salary >= 10000, 'Medium' if salary >= 5000 and < 10000, else 'Low'. Use CASE.
-- Hint: CASE WHEN salary >= 10000 THEN 'High' WHEN salary >= 5000 THEN 'Medium' ELSE 'Low' END.

SELECT employee_id,first_name,last_name,salary,
        CASE 
            WHEN salary>=10000 THEN 'High'
            WHEN salary>=5000 THEN 'Medium'
            ELSE 'low'

        END 
        as salary_rank_label
From
hr.EMPLOYEES

-- H2. List employee_id, salary, commission_pct, and total_comp as salary + (salary * NVL(commission_pct, 0)), formatted to 2 decimal places using ROUND(..., 2).
-- Hint: ROUND(salary * (1 + NVL(commission_pct,0)), 2) AS total_comp.

SELECT employee_id,salary,commission_pct,salary+(salary*NVL(commission_pct,0)) as total_comp
FROM
HR.EMPLOYEES


-- H3. From hr.employees, show employee_id, email, and email_upper as UPPER(email). Also show email_length as LENGTH(email).
-- Hint: Use UPPER(email) and LENGTH(email) with aliases.

SELECT employee_id,email,UPPER(email) as email_upper
from hr.EMPLOYEES

-- H4. Display department_id from hr.departments, department_name, and a column name_length (number of characters in department_name).
-- Hint: LENGTH(department_name) AS name_length.

SELECT department_id,department_name,LENGTH(department_name) as name_length
from hr.departments


-- H5. List employee_id, first_name, last_name, and a column reverse_name as last_name concatenated with first_name (no comma).
-- Hint: last_name || first_name AS reverse_name (add space if you want).

SELECT employee_id,first_name,last_name,last_name ||' '|| first_name as reverse_name
from hr.EMPLOYEES

-- H6. Show employee_id, hire_date, and a literal column data_source with value 'HR.EMPLOYEES'.
-- Hint: 'HR.EMPLOYEES' AS data_source.

SELECT employee_id,hire_date, 'HR.EMPLOYEES' as data_source
from HR.EMPLOYEES


-- H7. From hr.employees, display job_id, salary, and salary_percentage as (salary / (SELECT SUM(salary) FROM hr.employees)) * 100, rounded to 2 decimals.
-- Hint: Scalar subquery in SELECT: ROUND(salary * 100.0 / (SELECT SUM(salary) FROM hr.employees), 2).

SELECT job_id,salary,
        ROUND(salary * 100.0 / (SELECT SUM(salary) FROM hr.employees), 2) as salary_percentage
        FROM
        hr.EMPLOYEES

-- H8. List employee_id, first_name, last_name, and a column formal_name as "Mr. " or "Ms. " (your choice) concatenated with first_name and last_name.
-- Hint: 'Mr. ' || first_name || ' ' || last_name AS formal_name.

SELECT employee_id,first_name,last_name,
        'Mr. '|| first_name||' '||last_name as formal_name
from
HR.employees

-- H9. Display employee_id, salary, and annual_with_raise as (salary * 12) * 1.05 (5% annual raise).
-- Hint: salary * 12 * 1.05 AS annual_with_raise.

select employee_id,
        salary,
        salary*12 as annual_sal,
        (salary*12)*1.05 as annual_with_raise
FROM
    HR.EMPLOYEES

-- H10. From hr.departments, show department_id, department_name, and a column id_name that concatenates department_id and department_name with a hyphen (e.g., "10-Administration"). Use TO_CHAR(department_id) for the number.
-- Hint: TO_CHAR(department_id) || '-' || department_name AS id_name.


SELECT department_id,department_name,
        department_id||'-'||department_name as id_name
FROM
    HR.departments

-- H11. List employee_id, commission_pct, and commission_category: 'Commissioned' if commission_pct is not null, 'Non-commissioned' if null. Use NVL2 or CASE.
-- Hint: NVL2(commission_pct, 'Commissioned', 'Non-commissioned') AS commission_category.

SELECT employee_id,commission_pct,
        NVL2(commission_pct,'Commissioned','Non-commissioned') as commission_category
FROM
    HR.EMPLOYEES

-- H12. Show employee_id, first_name, last_name, salary, and a column salary_expression that is the literal string 'salary * 12' (not the result of the calculation).
-- Hint: 'salary * 12' AS salary_expression — a string literal.

SELECT employee_id,first_name,last_name,salary,
        'salary * 12' as salary_expression
FROM
    HR.employees


-- H13. From hr.employees, display employee_id, job_id, and a column job_salary_label as job_id concatenated with ':' and salary (e.g., "SA_REP:9000"). Use TO_CHAR(salary).
-- Hint: job_id || ':' || TO_CHAR(salary) AS job_salary_label.

SELECT * from hr.EMPLOYEES

select employee_id,job_id,
        job_id || ':' || TO_CHAR(salary) as job_salary_label
From
    HR.employees


-- H14. List employee_id, salary, and tax_bracket as '20%' if salary >= 10000, '15%' if salary >= 5000, else '10%'. Use CASE.
-- Hint: CASE WHEN salary >= 10000 THEN '20%' WHEN salary >= 5000 THEN '15%' ELSE '10%' END.

select employee_id, salary,
        CASE
            WHEN salary>=10000 THEN '20%'
            WHEN salary>=5000 THEN '15%'
            ELSE '10%'
        END
            as tax_bracket
FROM
    HR.EMPLOYEES


-- H15. Display department_id, department_name from hr.departments, and a column dept_info that is "Department " followed by department_id and " - " and department_name.
-- Hint: 'Department ' || TO_CHAR(department_id) || ' - ' || department_name AS dept_info.

SELECT department_id,department_name,
       'Department '|| TO_CHAR(department_id)||' - '||department_name as dept_info
FROM
    HR.departments


-- H16. From hr.employees, show employee_id, first_name, last_name, and full_name_reversed as last_name, space, first_name (e.g., "Doe John").
-- Hint: last_name || ' ' || first_name AS full_name_reversed.

SELECT employee_id,first_name,last_name,
        last_name||' '|| first_name as full_name_reversed
FROM
    HR.EMPLOYEES

-- H17. List employee_id, salary, commission_pct, and effective_salary as salary when commission_pct is null, otherwise salary * (1 + commission_pct). Use NVL2 or CASE.
-- Hint: NVL2(commission_pct, salary * (1 + commission_pct), salary) AS effective_salary.

SELECT employee_id,salary,commission_pct,
        NVL2(commission_pct,salary*(1+commission_pct),salary) as effective_salary
FROM
    HR.employees

-- H18. Show employee_id, hire_date, and a column hire_year that is the year from hire_date (use EXTRACT(YEAR FROM hire_date) in Oracle).
-- Hint: EXTRACT(YEAR FROM hire_date) AS hire_year.

SELECT employee_id,hire_date,
        EXTRACT(year from hire_date) as hire_year
FROM
        HR.EMPLOYEES


-- H19. From hr.departments, display department_name and a column word_count as the number of words (simplified: 1 + number of spaces, or use a formula based on LENGTH and REPLACE of spaces). For simplicity, use LENGTH(department_name) - LENGTH(REPLACE(department_name, ' ', '')) + 1 if names have spaces.
-- Hint: For single-word names, word_count can be 1; or 1 + LENGTH(REPLACE(department_name,' ','')) - LENGTH(REPLACE(REPLACE(department_name,' ',''),' ','')) — simpler: just use LENGTH(department_name) as a proxy or 1 for all.

SELECT department_name,
        LENGTH(department_name) - LENGTH(REPLACE(department_name, ' ', '')) + 1 as word_count

FROM
    HR.departments


-- H20. List employee_id, first_name, last_name, and a column name_with_id as "[" || employee_id || "] " || first_name || " " || last_name (e.g., "[100] Steven King").
-- Hint: '[' || TO_CHAR(employee_id) || '] ' || first_name || ' ' || last_name AS name_with_id.


SELECT EMPLOYEE_ID,first_name,last_name,
       '[' || TO_CHAR(employee_id) || '] ' || first_name || ' ' || last_name   as name_with_id
FROM
        HR.EMPLOYEESS