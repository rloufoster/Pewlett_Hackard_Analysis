--CHALLENGE
---- DELIVERABLE 1- Join employee and titles tables to get number of titles (with dupes)
SELECT e.emp_no, e.first_name, e.last_name,
	t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
JOIN titles as t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no 

SELECT * FROM retirement_titles

-- Use Dictinct with Orderby to remove dupes
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title,
	to_date
INTO unique_titles 
FROM retirement_titles 
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

-- How many are retiring by title?
SELECT count(title) "count", title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles

----DELIVERABLE 2
--What employees are eligible to participate in a mentorship program and eliminate dupes.
SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no

SELECT * FROM mentorship_eligibility

----SUMMARY CODE

--Who is eligible to leave
SELECT DISTINCT ON (emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO employees_leaving
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
	AND (de.from_date BETWEEN '1985-01-01' AND '1988-12-31')
ORDER BY e.emp_no;

SELECT * FROM employees_leaving;

--How many potential mentors per department
SELECT DISTINCT ON (emp_no) e.emp_no, d.dept_name, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO employees_leaving_by_dept
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN titles as t
ON (e.emp_no = t.emp_no)
LEFT JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
	AND (de.from_date BETWEEN '1985-01-01' AND '1988-12-31')
ORDER BY e.emp_no;

SELECT * FROM employees_leaving_by_dept;

--Group the leaving employees for cummulative count of leaving by department
SELECT COUNT(first_name) "Count", dept_name
INTO employees_leaving_by_dept_totals
FROM employees_leaving_by_dept
GROUP BY dept_name
ORDER BY "Count" desc;

SELECT * FROM employees_leaving_by_dept_totals;


