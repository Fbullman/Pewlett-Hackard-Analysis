--Retirement employees in Sales and Development department

--PART 1

SELECT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows - part 2/Deliverable 1
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

--part 3 count retiring employees by recent titles 
SELECT DISTINCT ON (title) title
FROM unique_titles
ORDER BY title

SELECT COUNT(title) AS "Count", title AS "Title"
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY "Count" desc;

--Deliverable part 2 Mentorship

SELECT DISTINCT ON (emp_no)
e.emp_no, 
e.first_name, 
e.last_name, 
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibilty
from employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

select * from mentorship_eligibilty
limit 10

select title, count(*) as "Mentorship_Eligibility_by_Title"
INTO mentorship_eligibilty_count_by_title
from mentorship_eligibilty
GROUP BY title

select * from mentorship_eligibilty_count_by_title;
