--Create tables, import data
CREATE TABLE departments (
dept_no varchar NOT NULL,
dept_name varchar NOT NULL,
CONSTRAINT "pk_departments" PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
emp_no int NOT NULL,
dept_no varchar NOT NULL,
CONSTRAINT "pk_dept_emp" PRIMARY KEY ("emp_no","dept_no")	
);

CREATE TABLE dept_manager (
emp_no varchar NOT NULL,
dept_no int NOT NULL,
CONSTRAINT "pk_dept_manager" PRIMARY KEY ("emp_no","dept_no")
);

CREATE TABLE employee (
    emp_no int NOT NULL,
    emp_title NOT NULL,
    birth_date date NOT NULL,
    first_name varchar NOT NULL,
    last_name varchar NOT NULL,
    sex varchar NOT NULL,
    hire_date date NOT NULL
	CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no")
);

CREATE TABLE salaries (
emp_no int NOT NULL,
salary int NOT NULL
CONSTRAINT "pk_salaries" PRIMARY KEY ("emp_no")
);

CREATE TABLE titles (
title_id varchar NOT NULL,
title varchar NOT NULL,
CONSTRAINT "pk_titles" PRIMARY KEY ("title_id")
);









--Data Analysis #1
SELECT employee.emp_no,employee.first_name,employee.last_name, employee.sex, salaries.salary
FROM salaries
Inner JOIN employee ON employee.emp_no = salaries.emp_no;

--Data Analysis #2
SELECT hire_date,first_name,last_name
FROM employee
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date asc;

--Data Analysis #3
SELECT departments.dept_no,dept_manager.dept_no,
employee.last_name, employee.sex, salaries.salary
FROM departments
Inner JOIN employee ON employee.emp_no = salaries.emp_no;


-- Data Analysis #4
SELECT dept_emp.dept_no, dept_emp.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM departments
JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
LEFT JOIN employee
ON employee.emp_no = dept_emp.emp_no
ORDER BY emp_no;

--Data Analysis #5
SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Data Analysis #6
SELECT dept_emp.dept_no, employee.emp_no, employee.last_name, employee.first_name
FROM employee
LEFT JOIN dept_emp
ON employee.emp_no = dept_emp.emp_no
WHERE dept_no = 'd007';


--Data Analysis #7
SELECT dept_emp.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM departments
JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
LEFT JOIN employee
ON employee.emp_no = dept_emp.emp_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

--Data Analysis #8
SELECT last_name, COUNT(last_name)AS "name count"
FROM employee
GROUP BY last_name
ORDER by "name count" DESC;
select * from employee