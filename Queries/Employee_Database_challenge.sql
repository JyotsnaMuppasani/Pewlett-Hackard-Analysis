--Retirement Titles
SELECT emp.emp_no,
emp.first_name,
emp.last_name,
tit.title,
tit.from_date,
tit.to_date
INTO retirement_titles
FROM employees as emp
INNER JOIN titles AS tit
ON (emp.emp_no = tit.emp_no)
WHERE birth_date Between '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;


--Unique Titles
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no,to_date DESC;

--RETIRING TITLES
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

--MENTORSHIP ELIGIBILITY
SELECT DISTINCT ON(e.emp_no)e.emp_no, 
e.first_name, 
e.last_name,
e.birth_date,
d.from_date,
d.to_date,
t.title
INTO mentorship_eligibilty 
FROM employees as e
LEFT JOIN dept_emp as d
ON e.emp_no = d.emp_no
RIGHT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (d.to_date = '9999-01-01')
ORDER BY emp_no;


