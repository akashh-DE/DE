create table hr_dept_backup as 
select * from HR.DEPARTMENTS;

-- Part 1: Practice Questions (With Answers and Explanations)
-- Question 1
-- Create a table hr_emp_backup from SELECT * FROM hr.employees (copy structure and data).


CREATE TABLE hr_emp_backup AS
SELECT * FROM hr.employees;
-- Explanation: CREATE TABLE ... AS SELECT creates a new table and populates it with the result of the query. This copies all columns and all rows from hr.employees.

-- Question 2
-- Add a column notes of type VARCHAR2(200) to hr_emp_backup.



 ALTER TABLE hr_emp_backup ADD notes VARCHAR2(200);

 select * from HR_EMP_BACKUP

-- Explanation: ALTER TABLE ... ADD column_name datatype adds a new column. Existing rows get NULL in the new column unless you specify a DEFAULT.

-- Question 3
-- Rename the column notes to remarks in hr_emp_backup.


 ALTER TABLE hr_emp_backup RENAME COLUMN notes TO remarks;


-- Explanation: RENAME COLUMN old_name TO new_name changes the column name. Data and type are unchanged.

-- Part 2: Self-Practice (No Answers)

-- Create a table from hr.employees that contains only the columns: employee_id, first_name, last_name, salary, department_id.

CREATE TABLE hr_emp_backup1 AS
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,salary,DEPARTMENT_ID FROM hr.employees;

-- Alter that table to add a column effective_date of type DATE.

alter TABLE hr_emp_backup1  add effective_date date;

select * from hr_emp_backup1

-- Truncate the backup table you created (so it is empty but the structure remains).

TRUNCATE TABLE hr_emp_backup1

-- Part 3: Additional Practice — 20 Medium + 20 Hard Questions (With Hints)
-- All use hr.employees and hr.departments only. Use backup/copy tables (e.g. hr_emp_backup) so you do not alter production.

-- 20 Medium Questions
-- M1. Create a table hr_dept_backup as a full copy of hr.departments.
-- Hint: CREATE TABLE hr_dept_backup AS SELECT * FROM hr.departments;

create table hr_dept_backup as 
select * from hr.departments

-- M2. Add a column notes VARCHAR2(100) to hr_emp_backup.
-- Hint: ALTER TABLE hr_emp_backup ADD notes VARCHAR2(100);

alter table hr_emp_backup add notes VARCHAR(20)

-- M3. Create a table emp_50 from employees in department 50 only (all columns).
-- Hint: CREATE TABLE emp_50 AS SELECT * FROM hr.employees WHERE department_id = 50;

create table emp_50 as 
select * from hr.employees
where department_id=50


select * from emp_50
-- M4. Add column updated_at DATE DEFAULT SYSDATE to your backup table.
-- Hint: ALTER TABLE ... ADD updated_at DATE DEFAULT SYSDATE;

alter table emp_50 add updated_at DATE default SYSDATE

-- M5. Create a table dept_names with only department_id and department_name from hr.departments.
-- Hint: CREATE TABLE dept_names AS SELECT department_id, department_name FROM hr.departments;

Create TABLE dept_names as 
select department_id,department_name from hr.DEPARTMENTS

-- M6. Modify column notes in hr_emp_backup to VARCHAR2(500).
-- Hint: ALTER TABLE hr_emp_backup MODIFY notes VARCHAR2(500);

alter table hr_emp_backup Modify notes VARCHAR2(500)

-- M7. Create an empty table emp_structure with the same structure as hr.employees (no rows).
-- Hint: CREATE TABLE emp_structure AS SELECT * FROM hr.employees WHERE 1=0;

create table emp_structure as
select * from Hr.employees where 1=0

select * from emp_structure

-- M8. Rename table hr_emp_backup to hr_employees_archive.
-- Hint: RENAME hr_emp_backup TO hr_employees_archive;

 rename hr_emp_backup to hr_employees_archive

-- M9. Add two columns to a backup table: created_by VARCHAR2(50) and created_date DATE.
-- Hint: Two ALTER TABLE ... ADD statements (or one ADD with two columns if your Oracle version allows).

alter table hr_employees_archive add (created_by VARCHAR2(50), created_date VARCHAR2(50))

-- M10. Create table high_earners from hr.employees where salary > 10000 (all columns).
-- Hint: CREATE TABLE high_earners AS SELECT * FROM hr.employees WHERE salary > 10000;

create table high_earners as 
SELECT * from HR.employees
WHERE salary>10000

-- M11. Drop the column notes from your backup table.
-- Hint: ALTER TABLE ... DROP COLUMN notes;

ALTER table hr_employees_archive DROP column notes;

-- M12. Create table emp_salary_dept with only employee_id, salary, department_id from hr.employees.
-- Hint: CREATE TABLE emp_salary_dept AS SELECT employee_id, salary, department_id FROM hr.employees;

CREATE TABLE emp_salary_dept AS
SELECT EMPLOYEE_ID,salary,department_id
FROM HR.employees

-- M13. Truncate the table emp_50 (or whatever copy table you created).
-- Hint: TRUNCATE TABLE emp_50;

TRUNCATE TABLE emp_50

-- M14. Rename column remarks to comments in your backup table.
-- Hint: ALTER TABLE ... RENAME COLUMN remarks TO comments;

alter table hr_employees_archive RENAME column remarks to comments

-- M15. Create a table dept_emp_count with department_id and a literal 0 as column emp_count (one row per department).
-- Hint: CREATE TABLE dept_emp_count AS SELECT department_id, 0 AS emp_count FROM hr.departments;

create TABLE dept_emp_count AS
SELECT department_id, 0 as emp_count from hr.departments

SELECT * from dept_emp_count

-- M16. Add column status VARCHAR2(20) DEFAULT 'ACTIVE' to a backup table.
-- Hint: ALTER TABLE ... ADD status VARCHAR2(20) DEFAULT 'ACTIVE';

ALTER TABLE hr_employees_archive add status varchar2(20) default 'ACTIVE'

-- M17. Create table emp_hire_2005 from hr.employees where EXTRACT(YEAR FROM hire_date) = 2005.
-- Hint: CREATE TABLE emp_hire_2005 AS SELECT * FROM hr.employees WHERE EXTRACT(YEAR FROM hire_date) = 2005;

CREATE TABLE emp_hire_2005 AS
SELECT * from hr.employees
WHERE EXTRACT(year from hire_date)=2005

-- M18. Modify column status to VARCHAR2(30).
-- Hint: ALTER TABLE ... MODIFY status VARCHAR2(30);


ALTER table hr_employees_archive MODIFY status  VARCHAR2(30)

-- M19. Create an empty table with the same structure as hr.departments. Name it dept_template.
-- Hint: CREATE TABLE dept_template AS SELECT * FROM hr.departments WHERE 1=0;

CREATE table dept_template as 
SELECT * FROM hr.DEPARTMENTS
where 1=0;

-- M20. Add column audit_id NUMBER(10) to your backup table.
-- Hint: ALTER TABLE ... ADD audit_id NUMBER(10);

alter TABLE hr_employees_archive
add audit_id NUMBER(10)

-- 20 Hard Questions
-- H1. Create a table emp_dept_summary that has one row per department with columns department_id, department_name (from hr.departments), and a computed column total_sal (use a subquery or join to get SUM(salary) per department).
-- Hint: CREATE TABLE ... AS SELECT d.department_id, d.department_name, (SELECT SUM(salary) FROM hr.employees e WHERE e.department_id = d.department_id) AS total_sal FROM hr.departments d;

CREATE table emp_dept_summary as 
SELECT d.department_name,d.department_id,(select sum(salary) from hr.employees e WHERE e.department_id=d.department_id) as total_sal from hr.DEPARTMENTS d;

select * from emp_dept_summary

-- H2. Create table emp_backup_80 from hr.employees for department 80, but only columns employee_id, first_name, last_name, salary, commission_pct.
-- Hint: CREATE TABLE emp_backup_80 AS SELECT employee_id, first_name, last_name, salary, commission_pct FROM hr.employees WHERE department_id = 80;

create table emp_backup_80 as 
SELECT employee_id,FIRST_NAME,LAST_NAME,salary,commission_pct
FROM hr.employees
where department_id=80;

-- H3. Add a column full_name to a backup table and populate it with first_name || ' ' || last_name for all existing rows (requires UPDATE after ADD; then you could add a default for new rows).
-- Hint: ALTER TABLE ... ADD full_name VARCHAR2(50); UPDATE ... SET full_name = first_name || ' ' || last_name;

alter TABLE hr_emp_backup1
    add full_name VARCHAR2(50);
update hr_emp_backup1 
    set full_name=first_name || ' ' ||last_name

    SELECT * from hr_emp_backup1

-- H4. Create a table that has department_id, department_name, and a column manager_name (you would need to join hr.departments with hr.employees on manager_id to get manager's name).
-- Hint: CREATE TABLE dept_with_mgr AS SELECT d.department_id, d.department_name, e.first_name || ' ' || e.last_name AS manager_name FROM hr.departments d LEFT JOIN hr.employees e ON d.manager_id = e.employee_id;

CREATE TABLE dept_with_mgr as 
SELECT d.department_id, d.department_name, e.first_name || ' ' || e.last_name AS manager_name 
FROM hr.departments d 
LEFT JOIN hr.employees e
ON d.manager_id = e.employee_id;

-- H5. Create table emp_job_salary with columns job_id, min_sal, max_sal, avg_sal (use GROUP BY job_id with MIN, MAX, AVG on salary from hr.employees).
-- Hint: CREATE TABLE emp_job_salary AS SELECT job_id, MIN(salary) AS min_sal, MAX(salary) AS max_sal, AVG(salary) AS avg_sal FROM hr.employees GROUP BY job_id;

create table emp_job_salary AS
SELECT job_id,min(salary) as min_sal ,max(salary) as max_sal, AVG(salary) as avg_sal
from hr.employees
group by job_id

SELECT * from emp_job_salary
-- H6. Add a column that has a DEFAULT expression using SYSDATE and rename an existing column in the same table (two statements).
-- Hint: ALTER ADD ... DEFAULT SYSDATE; ALTER RENAME COLUMN ... TO ...;

ALTER TABLE hr_emp_backup1 add modified_date DATE DEFAULT SYSDATE;

ALTER table hr_emp_backup1 RENAME column modified_date to last_modified


-- H7. Create a table emp_top_sal with the same structure as hr.employees but only rows where salary is in the top 10 (use subquery: WHERE salary IN (SELECT ... ORDER BY salary DESC FETCH FIRST 10 ROWS ONLY)).
-- Hint: CREATE TABLE emp_top_sal AS SELECT * FROM hr.employees WHERE salary IN (SELECT salary FROM hr.employees ORDER BY salary DESC FETCH FIRST 10 ROWS ONLY); Note: may duplicate if ties.

CREATE TABLE emp_top_sal AS(
SELECT * from HR.employees
WHERE salary in(
    select salary from HR.employeEs
    order by salary DESC
    fetch first 10 rows ONLY)
      );

-- H8. Create table dept_emp_list with department_id, department_name, and employee_count (count of employees per department).
-- Hint: CREATE TABLE dept_emp_list AS SELECT d.department_id, d.department_name, COUNT(e.employee_id) AS employee_count FROM hr.departments d LEFT JOIN hr.employees e ON e.department_id = d.department_id GROUP BY d.department_id, d.department_name;

CREATE TABLE dept_emp_list AS
SELECT d.department_id,d.department_name,COUNT(e.employee_id) as employee_count 
from hr.DEPARTMENTS d 
LEFT join hr.employees e on e.department_id=d.department_id
GROUP by d.department_id,d.department_name;


CREATE TABLE dept_emp_list AS 
SELECT d.department_id, d.department_name, COUNT(e.employee_id) AS employee_count
FROM hr.departments d 
LEFT JOIN hr.employees e ON e.department_id = d.department_id
 GROUP BY d.department_id, d.department_name;


-- H9. Drop two columns from your backup table in one statement (if Oracle supports: ALTER TABLE ... DROP (col1, col2)).
-- Hint: ALTER TABLE ... DROP (col1, col2); or two separate DROP COLUMN statements.


ALTER TABLE hr_emp_backup1
    DROP (effective_date,last_modified)


-- H10. Create a table that contains only employees whose manager_id is not null and department_id is not null (all columns).
-- Hint: CREATE TABLE emp_with_mgr_dept AS SELECT * FROM hr.employees WHERE manager_id IS NOT NULL AND department_id IS NOT NULL;

create TABLE emp_mgr_dept_ntnull as 
select * from HR.employees
WHERE manager_id is not null AND department_id is not null;

-- H11. Add a column salary_band VARCHAR2(10) and update it with CASE (Low/Medium/High) based on salary; then add DEFAULT 'Medium' for new rows.
-- Hint: ADD column; UPDATE ... SET salary_band = CASE ...; then MODIFY column DEFAULT 'Medium' if needed.

ALTER TABLE hr_emp_backup1 ADD salary_band VARCHAR2(20);

UPDATE hr_emp_backup1
        set salary_band = CASE 
                            when salary <20000 then 'High'
                            when salary <10000 then 'Medium'
                            else 'Low'

                            END


SELECT * from hr_emp_backup1


-- H12. Create table emp_duplicate_check with employee_id, first_name, last_name, and a column dup_count showing how many employees share the same first_name and last_name (use analytic or self-join in CTAS).
-- Hint: Use a subquery with COUNT(*) OVER (PARTITION BY first_name, last_name) AS dup_count in the SELECT.

CREATE table emp_duplicate_check as 
SELECT employee_id,FIRST_NAME,LAST_NAME, 
        (count(*) OVER (PARTITION by FIRST_NAME, LAST_NAME)) as dup_count
FROM hr.employees

select * from emp_duplicate_check

-- H13. Create an empty table with the same structure as hr.employees and name it emp_import_staging.
-- Hint: CREATE TABLE emp_import_staging AS SELECT * FROM hr.employees WHERE 1=0;

CREATE table emp_import_staging as 
SELECT * from HR.employees
WHERE 1=0

-- H14. Modify the data type of a column from NUMBER to VARCHAR2 (e.g. store employee_id as string). Oracle may require add new column, update, drop old, rename.
-- Hint: Add new VARCHAR2 column; UPDATE set new = TO_CHAR(old); DROP old; RENAME new to old.

CREATE TABLE hr_emp_backup2 as 
SELECT employee_id,first_name,last_name,salary,department_id
FROM hr.employees

ALTER TABLE hr_emp_backup2 ADD Id_str VARCHAR2(20)

UPDATE hr_emp_backup2
        SET id_str=TO_CHAR(employee_id)


ALTER table hr_emp_backup2
        DROP column EMPLOYEE_ID

select * from hr_emp_backup2

alter table hr_emp_backup2 
        RENAME COLUMN id_str to employee_id


-- H15. Create table dept_location_1700 from hr.departments where location_id = 1700.
-- Hint: CREATE TABLE dept_location_1700 AS SELECT * FROM hr.departments WHERE location_id = 1700;

crete TABLE dept_location_1700 as 
SELECT * from hr.DEPARTMENTS
WHERE location_id=1700;

-- H16. Add column version NUMBER DEFAULT 1 and last_modified DATE DEFAULT SYSDATE to backup table.
-- Hint: Two ALTER TABLE ADD statements.

ALTER TABLE hr_emp_backup2 add version number default 1;

ALTER TABLE hr_emp_backup2 add last_modified DATE DEFAULT SYSDATE;

-- H17. Create table emp_salary_range with columns from hr.employees but only for salary between 5000 and 15000.
-- Hint: CREATE TABLE emp_salary_range AS SELECT * FROM hr.employees WHERE salary BETWEEN 5000 AND 15000;

CREATE table emp_salary_range as 
SELECT * from HR.employees
WHERE salary BETWEEN 5000 and 15000

-- H18. Truncate a table and then add a new column. Verify the table has 0 rows.
-- Hint: TRUNCATE TABLE ...; ALTER TABLE ... ADD ...; SELECT COUNT(*) FROM ...;

TRUNCATE TABLE hr_emp_backup1

ALTER TABLe hr_emp_backup1
    add Marital_sts VARCHAR2(10)

select count(*)
from hr_emp_backup1

-- H19. Create table job_list with distinct job_id from hr.employees and a literal column category with value 'HR'.
-- Hint: CREATE TABLE job_list AS SELECT DISTINCT job_id, 'HR' AS category FROM hr.employees;

CREATE table job_list as 
select distinct job_id ,'HR' as Category from hr.employees


select * from job_list

-- H20. Drop table emp_structure if it exists (Oracle: use PL/SQL EXECUTE IMMEDIATE 'DROP TABLE emp_structure'; with exception when table does not exist, or check user_tables first).
-- -- Hint: BEGIN EXECUTE IMMEDIATE 'DROP TABLE emp_structure'; EXCEPTION WHEN OTHERS THEN IF SQLCODE != -942 THEN RAISE; END IF; END; (942 = table does not exist).
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE emp_structure';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/