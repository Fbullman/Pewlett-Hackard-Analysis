

--Retirement employees in Sales and Development dept.
SELECT de.emp_no,
    de.first_name,
    de.last_name,
    ti.title,
	ti.from_date,
    ti.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles AS ti
ON de.emp_no=  ti.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;



-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM ret_titles
ORDER BY emp_no ASC, to_date DESC;


-- Counting the number of each employee per title
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

-- Creating a list of employees eligible for potential mentorship program
SELECT DISTINCT ON (e.emp_no) e.emp_no,
  e.first_name,
  e.last_name,
  e.birth_date,
  de.from_date,
  de.to_date,
  ti.title
INTO mentorship
FROM employees as e
INNER JOIN dept_emp as de
  ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
  ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
