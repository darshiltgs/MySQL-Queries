use new_hr_db;

DELIMITER $$

CREATE FUNCTION getFullName(firstname VARCHAR(50), lastname VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE FULL_NAME VARCHAR(50);
	SET FULL_NAME = concat(firstname, " ", lastname);
    
    RETURN FULL_NAME;
END $$

DELIMITER ;

select * from tbl_employees;

1.	Write a SQL query to find those employees whose salary is less than 6000. Return full name (first and last name), and salary.
-- query 1
SELECT concat(FIRST_NAME, " ", LAST_NAME) AS FULL_NAME, SALARY FROM Tbl_Employees WHERE SALARY < 6000;

2.	Write a SQL query to find those employees whose salary is higher than 8000. Return first name, last name and department number and salary.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY FROM Tbl_Employees WHERE SALARY > 8000;

3.	Write a SQL query to find those employees whose last name is "McEwen". Return first name, last name and department ID.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM Tbl_Employees WHERE LAST_NAME = "McEwen";

4.	Write a SQL query to find those employees who have no department number. Return employee_id, first_name, last_name, email,phone_number,hire_date, job_id, salary,commission_pct,manager_id and department_id.
SELECT * FROM Tbl_Employees WHERE DEPARTMENT_ID NOT IN (SELECT DEPARTMENT_ID FROM TBL_DEPARTMENTS);

5.	Write a SQL query to find the details of 'Marketing' department. Return all fields.
SELECT * FROM Tbl_Departments where DEPARTMENT_NAME = "Marketing";

6.	Write a SQL query to find those employees whose first name does not contain the letter ‘M’. Sort the result-set in ascending order by department ID. Return full name (first and last name together), hire_date, salary and department_id.
SELECT concat(FIRST_NAME, " ", LAST_NAME) AS FULL_NAME, HIRE_DATE, SALARY, DEPARTMENT_ID FROM TBL_EMPLOYEES WHERE FIRST_NAME NOT LIKE '%M%' ORDER BY DEPARTMENT_ID ASC;

7.	Write a SQL query to find those employees who falls one of the following criteria : 1. whose salary is in the range of 8000, 12000 (Begin and end values are included.) and get some commission. 2. : those employees who joined before ‘2003-06-05’ and not included in the department number 40, 120 and 70. Return all fields. Go to the editor
SELECT * FROM TBL_EMPLOYEES WHERE (SALARY BETWEEN 8000 AND 12000 AND COMMISSION_PCT > 0.00) OR (HIRE_DATE < '2003-06-05' AND DEPARTMENT_ID NOT IN (40, 120, 70));

8.	Write a SQL query to find those employees who do not earn any commission.Return full name (first and last name), and salary.
SELECT concat(FIRST_NAME, " ", LAST_NAME) AS FULL_NAME, SALARY, COMMISSION_PCT FROM TBL_EMPLOYEES WHERE COMMISSION_PCT <= 0.00;

9.	Write a SQL query to find those employees whose salary is in the range 9000,17000 (Begin and end values are included). Return full name, contact details and salary.
SELECT getFullName(FIRST_NAME, LAST_NAME) AS FULL_NAME, EMAIL, PHONE_NUMBER, SALARY FROM TBL_EMPLOYEES WHERE SALARY BETWEEN 9000 AND 17000;

10.	Write a SQL query to find those employees whose first name ends with the letter ‘m’. Return the first and last name, and salary.
SELECT FIRST_NAME, LAST_NAME, SALARY FROM TBL_EMPLOYEES WHERE FIRST_NAME LIKE '%M';

11.	Write a SQL query to find those employees whose salary is not in the range 7000 and 15000 (Begin and end values are included). Sort the result-set in ascending order by the full name (first and last). Return full name and salary.
SELECT getFullName(FIRST_NAME, LAST_NAME) AS FULL_NAME, SALARY FROM TBL_EMPLOYEES WHERE SALARY NOT BETWEEN 7000 AND 15000 ORDER BY FULL_NAME;

12.	Write a SQL query to find those employees who were hired during November 5th, 2007 and July 5th, 2009. Return full name (first and last), job id and hire date. Go to the editor
SELECT getFullName(FIRST_NAME, LAST_NAME) AS FULL_NAME, JOB_ID, HIRE_DATE FROM TBL_EMPLOYEES WHERE HIRE_DATE BETWEEN '2007-11-05' AND '2009-07-05' ORDER BY HIRE_DATE ASC;

13.	Write a SQL query to find those employees who works either in department 70 or 90. Return full name (first and last name), department id.
SELECT getFullName(FIRST_NAME, LAST_NAME) AS FULL_NAME, DEPARTMENT_ID FROM TBL_EMPLOYEES WHERE DEPARTMENT_ID IN (70, 90);

14.	Write a SQL query to find those employees who work under a manager. Return full name (first and last name), salary, and manager ID.
SELECT EMPLOYEE_ID, getFullName(FIRST_NAME, LAST_NAME) AS FULL_NAME, SALARY, MANAGER_ID FROM TBL_EMPLOYEES WHERE MANAGER_ID != 0 AND MANAGER_ID != EMPLOYEE_ID;

15.	Write a SQL query to find those employees who were hired before June 21st, 2002. Return all fields.
SELECT * FROM TBL_EMPLOYEES WHERE HIRE_DATE < '2002-06-21';

16.	Write a SQL query to find those employees whose managers hold the ID 120 or 103 or 145. Return first name, last name, email, salary and manager ID.
SELECT FIRST_NAME, LAST_NAME, EMAIL, SALARY, MANAGER_ID FROM TBL_EMPLOYEES WHERE MANAGER_ID IN (120, 103, 145);

17.	Write a SQL query to find those employees whose first name contains the letters D, S, or N. Sort the result-set in descending order by salary. Return all fields.
SELECT * FROM TBL_EMPLOYEES WHERE FIRST_NAME LIKE "%D%" OR FIRST_NAME LIKE "%S%" OR FIRST_NAME LIKE "%N%";

18.	Write a SQL query to find those employees who earn above 11000 or the seventh character in their phone number is 3. Sort the result-set in descending order by first name. Return full name (first name and last name), hire date, commission percentage, email, and telephone separated by '-', and salary.
SELECT 
getFullName(FIRST_NAME, LAST_NAME) AS FULL_NAME, 
HIRE_DATE, COMMISSION_PCT, EMAIL, 
REPLACE(PHONE_NUMBER, "-", "") AS PHONE, SALARY 
FROM TBL_EMPLOYEES WHERE SALARY > 11000 OR SUBSTRING(PHONE_NUMBER, 7, 1) = '3' ORDER BY FIRST_NAME DESC;

19.	Write a SQL query to find those employees whose first name contains a character ‘s’ in 3rd position. Return first name, last name and department id. Go to the editor
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM TBL_EMPLOYEES where SUBSTRING(FIRST_NAME, 3, 1) = "s";

20.	Write a SQL query to find those employees who are working in the departments, which are not included in the department number 50 or 30 or 80. Return employee_id, first_name, job_id, department_id.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID FROM TBL_EMPLOYEES WHERE DEPARTMENT_ID NOT IN (50,30,80);

21.	Write a SQL query to find those employees whose department numbers are included in 30 or 40 or 90. Return employee id, first name, job id, department id.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID FROM TBL_EMPLOYEES WHERE DEPARTMENT_ID IN (30,40,90);

22.	Write a SQL query to find those employees who worked more than two jobs in the past. Return employee id.
SELECT EMPLOYEE_ID FROM TBL_JOBHISTORY GROUP BY EMPLOYEE_ID HAVING COUNT(EMPLOYEE_ID) >= 2; 

23.	Write a SQL query to count the number of employees, sum of all salary, and difference between the highest salary and lowest salary by each job id. Return job_id, count, sum, salary_difference.
SELECT 
    e.JOB_ID, 
    j.JOB_TITLE,
    COUNT(e.EMPLOYEE_ID) AS employee_count, 
    SUM(e.SALARY) AS total_salary, 
    j.max_salary - j.min_salary AS salary_difference
FROM Tbl_Employees e
JOIN Tbl_Jobs j ON e.JOB_ID = j.JOB_ID
GROUP BY e.JOB_ID, j.JOB_TITLE;

24.	Write a SQL query to find each job ids where two or more employees worked for more than 300 days. Return job id.
SELECT JOB_ID FROM TBL_JOBHISTORY WHERE datediff(END_DATE, START_DATE) > 300 GROUP BY JOB_ID HAVING COUNT(EMPLOYEE_ID) >= 2;

25.	Write a SQL query to count the number of cities in each country has. Return country ID and number of cities.
SELECT COUNTRY_ID, COUNT(CITY) FROM TBL_LOCATIONS GROUP BY COUNTRY_ID;

26.	Write a SQL query to count the number of employees worked under each manager. Return manager ID and number of employees.
SELECT MANAGER_ID, COUNT(EMPLOYEE_ID) FROM TBL_EMPLOYEES WHERE MANAGER_ID != 0 AND EMPLOYEE_ID != MANAGER_ID group by MANAGER_ID;

27.	Write a SQL query to find all jobs. Sort the result-set in descending order by job title. Return all fields.
SELECT * FROM TBL_JOBS ORDER BY JOB_TITLE DESC;

28.	Write a SQL query to find all those employees who are either Sales Representative or Salesman. Return first name, last name and hire date.
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE FROM TBL_EMPLOYEES WHERE JOB_ID IN ('SA_MAN', 'SA_REP');

29.	Write a SQL query to calculate average salary of those employees for each department who get a commission percentage. Return department id, average salary.
SELECT DEPARTMENT_ID, AVG(SALARY) FROM TBL_EMPLOYEES WHERE COMMISSION_PCT > 0.00 GROUP BY DEPARTMENT_ID;

30.	Write a SQL query to find those departments where a manager can manage four or more employees. Return department_id.
SELECT DEPARTMENT_ID FROM TBL_EMPLOYEES GROUP BY DEPARTMENT_ID HAVING COUNT(EMPLOYEE_ID) >= 4;

31.	Write a SQL query to find those departments where more than ten employees work, who got a commission percentage. Return department id.
SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID) FROM TBL_EMPLOYEES WHERE COMMISSION_PCT > 0.00 GROUP BY DEPARTMENT_ID HAVING COUNT(EMPLOYEE_ID) >= 10; 

32.	Write a SQL query to find those employees who have completed their previous jobs. Return employee ID, end_date.
SELECT EMPLOYEE_ID, END_DATE FROM TBL_JOBHISTORY WHERE END_DATE IS NOT NULL;

33.	Write a SQL query to find those employees who have no commission percentage and salary within the range 7000, 12000 (Begin and end values are included.) and works in the department number 50. Return all the fields of employees.
SELECT * FROM TBL_EMPLOYEES WHERE COMMISSION_PCT = 0.00 AND SALARY BETWEEN 7000 AND 12000 AND DEPARTMENT_ID = 50;

34.	Write a SQL query to compute the average salary of each job ID. Exclude those records where average salary is higher than 8000. Return job ID, average salary.
SELECT JOB_ID, AVG(SALARY) FROM TBL_EMPLOYEES GROUP BY JOB_ID HAVING AVG(SALARY) <= 8000;

35.	Write a SQL query to find those job titles where the difference between minimum and maximum salaries is in the range the range 12000, 18000 (Begin and end values are included.). Return job_title, max_salary-min_salary.
SELECT JOB_TITLE, MAX_SALARY - MIN_SALARY AS DIFFERENCE FROM TBL_JOBS WHERE MAX_SALARY - MIN_SALARY BETWEEN 12000 AND 18000;

36.	Write a SQL query to find those employees whose first name or last name starts with the letter ‘D’. Return first name, last name.
SELECT FIRST_NAME, LAST_NAME FROM TBL_EMPLOYEES WHERE FIRST_NAME LIKE "d%" OR LAST_NAME LIKE "d%";

37.	Write a SQL query to find details of those jobs where minimum salary exceeds 9000. Return all the fields of jobs.
SELECT * FROM TBL_JOBS WHERE MIN_SALARY > 9000;


38.	Write a SQL query to find those employees who joined after 7th September 1987. Return all the fields.
SELECT * FROM TBL_EMPLOYEES WHERE HIRE_DATE > "1987-09-07";


39.	Write a SQL query to find those employees who get higher salary than the employee whose ID is 163. Return first name, last name.
SELECT FIRST_NAME, LAST_NAME, SALARY FROM TBL_EMPLOYEES 
WHERE SALARY > (SELECT SALARY FROM TBL_EMPLOYEES WHERE EMPLOYEE_ID = "163");

40.	Write a SQL query to find those employees whose designation is the same as the employee whose ID is 169. Return first name, last name, department ID and job ID.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, JOB_ID FROM TBL_EMPLOYEES 
WHERE JOB_ID = (SELECT JOB_ID FROM TBL_EMPLOYEES WHERE EMPLOYEE_ID = "169");

41.	Write a SQL query to find those employees whose salary matches the smallest salary of any of the departments. Return first name, last name and department ID.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM TBL_EMPLOYEES 
WHERE SALARY = (SELECT MIN(SALARY) FROM TBL_EMPLOYEES);

42.	Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM TBL_EMPLOYEES 
WHERE SALARY > (SELECT AVG(SALARY) FROM TBL_EMPLOYEES);

43.	Write a SQL query to find those employees who report that manager whose first name is ‘Payam’. Return first name, last name, employee ID and salary.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, manager_id FROM TBL_EMPLOYEES WHERE MANAGER_ID = (SELECT employee_id FROM TBL_EMPLOYEES WHERE FIRST_NAME = "Payam");

44.	Write a SQL query to find all those employees who work in the Finance department. Return department ID, name (first), job ID and department name.
SELECT E.FIRST_NAME, E.DEPARTMENT_ID, E.JOB_ID, D.DEPARTMENT_NAME FROM TBL_EMPLOYEES E 
JOIN TBL_DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID WHERE D.DEPARTMENT_NAME = "FINANCE";

45.	Write a SQL query to find the employee whose salary is 3000 and reporting person’s ID is 121. Return all fields.
SELECT * FROM TBL_EMPLOYEES WHERE SALARY = 3000 AND MANAGER_ID = 121;

46.	Write a SQL query to find those employees whose ID matches any of the number 134, 159 and 183. Return all the fields. 
SELECT * FROM TBL_EMPLOYEES WHERE EMPLOYEE_ID IN ('134', '159', '183');

47.	Write a SQL query to find those employees whose salary is in the range 1000, and 3000 (Begin and end values have included.). Return all the fields.
SELECT * FROM TBL_EMPLOYEES WHERE SALARY BETWEEN 1000 AND 3000;


48. From the following table and write a SQL query to find those employees whose salary is in the range of smallest salary, and 2500. Return all the fields.
SELECT * FROM TBL_EMPLOYEES WHERE SALARY IN ((SELECT MIN(SALARY) FROM TBL_EMPLOYEES), '2500');

49.	Write a SQL query to find those employees who do not work in those departments where manager ids are in the range 100, 200 (Begin and end values are included.) Return all the fields of the employees.
SELECT * FROM TBL_EMPLOYEES WHERE DEPARTMENT_ID 
NOT IN (SELECT DEPARTMENT_ID FROM TBL_DEPARTMENTS 
WHERE MANAGER_ID BETWEEN 100 AND 200);

50.	Write a SQL query to find those employees who get second-highest salary. Return all the fields of the employees.
-- SELECT * FROM TBL_EMPLOYEES WHERE SALARY < 
-- (SELECT MAX(SALARY) FROM TBL_EMPLOYEES) ORDER BY SALARY DESC LIMIT 1;
SELECT * FROM TBL_EMPLOYEES WHERE SALARY = 
(SELECT SALARY FROM TBL_EMPLOYEES ORDER BY SALARY DESC LIMIT 1 OFFSET 1);

51.	Write a SQL query to find those employees who work in the same department where ‘Clara’ works. Exclude all those records where first name is ‘Clara’. Return first name, last name and hire date.
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE FROM TBL_EMPLOYEES WHERE DEPARTMENT_ID = 
(SELECT DEPARTMENT_ID FROM TBL_EMPLOYEES WHERE FIRST_NAME = "Clara") 
AND FIRST_NAME != 'Clara';

52.	Write a SQL query to find those employees who work in a department where the employee’s first name contains a letter 'T'. Return employee ID, first name and last name.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE FROM TBL_EMPLOYEES WHERE FIRST_NAME LIKE "%T%";

53.	Write a SQL query to find those employees who earn more than the average salary and work in a department with any employee whose first name contains a character a 'J'. Return employee ID, first name and salary.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM TBL_EMPLOYEES WHERE FIRST_NAME LIKE "%J%" AND SALARY > (SELECT AVG(SALARY) FROM TBL_EMPLOYEES);

54.	Write a SQL query to find those employees whose department located at 'Toronto'. Return first name, last name, employee ID, job ID.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID 
FROM TBL_EMPLOYEES WHERE DEPARTMENT_ID = 
(SELECT DEPARTMENT_ID FROM TBL_DEPARTMENTS 
WHERE LOCATION_ID = (SELECT LOCATION_ID FROM TBL_LOCATIONS WHERE CITY = "Toronto"));

55.	Write a SQL query to find those employees whose salary is lower than any salary of those employees whose job title is ‘MK_MAN’. Return employee ID, first name, last name, job ID.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID 
FROM TBL_EMPLOYEES WHERE SALARY < (SELECT SALARY FROM TBL_EMPLOYEES WHERE JOB_ID = "MK_MAN");

56.	Write a SQL query to find those employees whose salary is lower than any salary of those employees whose job title is 'MK_MAN'. Exclude employees of Job title ‘MK_MAN’. Return employee ID, first name, last name, job ID.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID 
FROM TBL_EMPLOYEES WHERE SALARY < (SELECT SALARY FROM TBL_EMPLOYEES WHERE JOB_ID = "MK_MAN") AND JOB_ID != "MK_MAN";

57.	Write a SQL query to find those employees whose salary is more than any salary of those employees whose job title is 'PU_MAN'. Exclude job title 'PU_MAN'. Return employee ID, first name, last name, job ID.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID 
FROM TBL_EMPLOYEES WHERE SALARY > (SELECT SALARY FROM TBL_EMPLOYEES 
WHERE JOB_ID = "PU_MAN") AND JOB_ID != "PU_MAN";

58.	Write a SQL query to find those employees whose salary is more than average salary of any department. Return employee ID, first name, last name, job ID.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY 
FROM TBL_EMPLOYEES 
WHERE SALARY > ANY (SELECT AVG(SALARY) FROM TBL_EMPLOYEES 
GROUP BY DEPARTMENT_ID);

59.	Write a SQL query to find any existence of those employees whose salary exceeds 3700. Return first name, last name and department ID.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID 
FROM TBL_EMPLOYEES WHERE SALARY > 3700;

60.	Write a SQL query to find total salary of those departments where at least one employee works. Return department ID, total salary.
SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL_SALARY
FROM TBL_EMPLOYEES GROUP BY DEPARTMENT_ID HAVING COUNT(EMPLOYEE_ID) >= 1;

61. Write a query to display the employee id, name ( first name and last name ) and the job id column with a modified title SALESMAN for those employees whose job title is ST_MAN and DEVELOPER for whose job title is IT_PROG.
SELECT EMPLOYEE_ID, getFullName(FIRST_NAME, LAST_NAME) AS FULL_NAME, 
CASE 
WHEN JOB_ID = "ST_MAN" THEN 'SALESMAN'
WHEN JOB_ID = "IT_PROG" THEN 'DEVELOPER'
ELSE JOB_ID
END AS MODIFIED_JOB_TITLE
FROM TBL_EMPLOYEES;

62. Write a query to display the employee id, name ( first name and last name ), salary and the SalaryStatus column with a title HIGH and LOW respectively for those employees whose salary is more than and less than the average salary of all employees.
SELECT EMPLOYEE_ID, getFullName(FIRST_NAME, LAST_NAME) AS FULL_NAME, 
CASE 
WHEN SALARY > (SELECT AVG(SALARY) FROM TBL_EMPLOYEES) THEN 'HIGH'
WHEN SALARY < (SELECT AVG(SALARY) FROM TBL_EMPLOYEES) THEN 'LOW'
END AS SALARYSTATUS
FROM TBL_EMPLOYEES;

63. Write a query to display the employee id, name ( first name and last name ), SalaryDrawn, AvgCompare (salary - the average salary of all employees) and the SalaryStatus column with a title HIGH and LOW respectively for those employees whose salary is more than and less than the average salary of all employees.
SELECT EMPLOYEE_ID, getFullName(FIRST_NAME, LAST_NAME) AS FULL_NAME, 
SALARY, SALARY - (SELECT AVG(SALARY) FROM TBL_EMPLOYEES) AS AVGCOMPARE,
CASE
WHEN SALARY > (SELECT AVG(SALARY) FROM TBL_EMPLOYEES) THEN 'HIGH'
WHEN SALARY < (SELECT AVG(SALARY) FROM TBL_EMPLOYEES) THEN 'LOW'
END AS SALARYSTATUS
FROM TBL_EMPLOYEES;

64.	Write a SQL query to find all those departments where at least one or more employees work.Return department name.
SELECT DEPARTMENT_NAME FROM TBL_DEPARTMENTS WHERE 
DEPARTMENT_ID IN 
(SELECT DEPARTMENT_ID FROM TBL_EMPLOYEES 
GROUP BY DEPARTMENT_ID HAVING COUNT(EMPLOYEE_ID) >= 1);

65.	Write a SQL query to find those employees who work in departments located at 'United Kingdom'. Return first name.
SELECT FIRST_NAME, DEPARTMENT_ID
FROM TBL_EMPLOYEES WHERE DEPARTMENT_ID in 
(SELECT DEPARTMENT_ID FROM TBL_DEPARTMENTS 
WHERE LOCATION_ID 
IN (SELECT LOCATION_ID FROM TBL_LOCATIONS 
WHERE COUNTRY_ID = (SELECT COUNTRY_ID FROM TBL_COUNTRIES 
WHERE COUNTRY_NAME = "United Kingdom")));

66.	Write a SQL query to find those employees who earn more than average salary and who work in any of the 'IT' departments. Return last name.
SELECT LAST_NAME, DEPARTMENT_ID
FROM TBL_EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY) FROM TBL_EMPLOYEES)
AND DEPARTMENT_ID in 
(SELECT DEPARTMENT_ID FROM TBL_DEPARTMENTS WHERE DEPARTMENT_NAME LIKE "%IT%");

67.	Write a SQL query to find all those employees who earn more than an employee whose last name is 'Ozer'. Sort the result in ascending order by last name. Return first name, last name and salary.
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM TBL_EMPLOYEES WHERE SALARY > 
(SELECT SALARY FROM TBL_EMPLOYEES WHERE LAST_NAME = "Ozer") 
ORDER BY LAST_NAME ASC;

68.	Write a SQL query to find those employees who work under a manager based in ‘US’. Return first name, last name.
SELECT FIRST_NAME, LAST_NAME, MANAGER_ID, DEPARTMENT_ID
FROM TBL_EMPLOYEES WHERE MANAGER_ID in 
(SELECT MANAGER_ID FROM TBL_DEPARTMENTS WHERE LOCATION_ID 
IN (SELECT LOCATION_ID FROM TBL_LOCATIONS WHERE COUNTRY_ID LIKE "%US%"));

69.	Write a SQL query to find those employees whose salary is greater than 50% of their departments total salary bill. Return first name, last name.
SELECT FIRST_NAME, LAST_NAME
FROM TBL_EMPLOYEES E WHERE SALARY > 
(SELECT 0.5 * SUM(SALARY) FROM TBL_EMPLOYEES 
WHERE DEPARTMENT_ID = E.DEPARTMENT_ID GROUP BY DEPARTMENT_ID);

70.	Write a SQL query to find those employees who are managers. Return all the fields of employees table.
SELECT * FROM TBL_EMPLOYEES WHERE EMPLOYEE_ID IN (SELECT MANAGER_ID FROM TBL_EMPLOYEES);

71.	Write a SQL query to find those employees who manage a department. Return all the fields of employees table.
SELECT * FROM TBL_EMPLOYEES WHERE EMPLOYEE_ID IN (SELECT MANAGER_ID FROM TBL_DEPARTMENTS);

72.	Write a SQL query to find those employees who get such a salary, which is the maximum of salaried employee, joining within January 1st, 2002 and December 31st, 2003. Return employee ID, first name, last name, salary, department name and city.
SELECT E.EMPLOYEE_ID, E.FIRST_NAME, E.LAST_NAME, E.SALARY, D.DEPARTMENT_NAME, L.CITY
FROM TBL_EMPLOYEES E 
JOIN TBL_DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN TBL_LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE E.HIRE_DATE BETWEEN '2002-01-01' AND '2003-12-31' 
AND E.SALARY = (SELECT MAX(SALARY) FROM TBL_EMPLOYEES);

73.	Write a SQL query to find those departments, located in the city ‘London’. Return department ID, department name.
SELECT DEPARTMENT_ID, DEPARTMENT_NAME FROM TBL_DEPARTMENTS WHERE LOCATION_ID 
= (SELECT LOCATION_ID FROM TBL_LOCATIONS WHERE CITY = "LONDON");

74.	Write a SQL query to find those employees who earn more than the average salary. Sort the result-set in descending order by salary. Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM TBL_EMPLOYEES 
WHERE SALARY > (SELECT AVG(SALARY) FROM TBL_EMPLOYEES) ORDER BY SALARY DESC;

75.	Write a SQL query to find those employees who earn more than the maximum salary of a department of ID 40. Return first name, last name and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM TBL_EMPLOYEES 
WHERE SALARY > (SELECT MAX(SALARY) FROM TBL_EMPLOYEES WHERE DEPARTMENT_ID = "40");

76.	Write a SQL query to find departments for a particular location. The location matches the location of the department of ID 30. Return department name and department ID.
SELECT DEPARTMENT_ID, DEPARTMENT_NAME FROM TBL_DEPARTMENTS WHERE LOCATION_ID 
= (SELECT LOCATION_ID FROM TBL_DEPARTMENTS WHERE DEPARTMENT_ID = '30');

77.	Write a SQL query to find those employees who work in that department where the employee works of ID 201. Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM TBL_EMPLOYEES 
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM TBL_EMPLOYEES WHERE MANAGER_ID = "201");

78.	Write a SQL query to find those employees whose salary matches to the salary of the employee who works in that department of ID 40. Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM TBL_EMPLOYEES 
WHERE SALARY = (SELECT SALARY FROM TBL_EMPLOYEES WHERE DEPARTMENT_ID = "40");

79.	Write a SQL query to find those employees who work in the department 'Marketing'. Return first name, last name and department ID.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM TBL_EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM TBL_DEPARTMENTS WHERE DEPARTMENT_NAME = 'Marketing');

80.	Write a SQL query to find those employees who earn more than the minimum salary of a department of ID 40. Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM TBL_EMPLOYEES 
WHERE SALARY > (SELECT MIN(SALARY) FROM TBL_EMPLOYEES WHERE DEPARTMENT_ID = "40");

81.	Write a SQL query to find those employees who joined after the employee whose ID is 165. Return first name, last name and hire date.
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE FROM TBL_EMPLOYEES
WHERE HIRE_DATE > (SELECT HIRE_DATE FROM TBL_EMPLOYEES WHERE EMPLOYEE_ID = '165');

82.	Write a SQL query to find those employees who earn less than the minimum salary of a department of ID 70. Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM TBL_EMPLOYEES 
WHERE SALARY < (SELECT MIN(SALARY) FROM TBL_EMPLOYEES WHERE DEPARTMENT_ID = "70");

83.	Write a SQL query to find those employees who earn less than the average salary, and work at the department where the employee 'Laura' (first name) works. Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM TBL_EMPLOYEES 
WHERE SALARY < (SELECT AVG(SALARY) FROM TBL_EMPLOYEES) AND 
DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM TBL_EMPLOYEES WHERE FIRST_NAME = "Laura");

84.	Write a SQL query to find those employees whose department is located in the city 'London'. Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM TBL_EMPLOYEES WHERE DEPARTMENT_ID = 
(SELECT DEPARTMENT_ID FROM TBL_DEPARTMENTS WHERE LOCATION_ID 
= (SELECT LOCATION_ID FROM TBL_LOCATIONS WHERE CITY = "LONDON"));

85.	Write a SQL query to find the city of the employee of ID 134. Return city.
SELECT CITY FROM TBL_LOCATIONS WHERE LOCATION_ID = 
(SELECT LOCATION_ID FROM TBL_DEPARTMENTS WHERE DEPARTMENT_ID = 
(SELECT DEPARTMENT_ID FROM TBL_EMPLOYEES WHERE EMPLOYEE_ID = '134'));

86.	Write a SQL query to find those departments where maximum salary is 7000 and above. The employees worked in those departments have already completed one or more jobs. Return all the fields of the departments.
SELECT * FROM TBL_DEPARTMENTS WHERE DEPARTMENT_ID IN 
(SELECT DEPARTMENT_ID FROM TBL_EMPLOYEES WHERE (SELECT MAX(SALARY) FROM TBL_EMPLOYEES) >= 7000
 AND EMPLOYEE_ID IN 
(SELECT EMPLOYEE_ID FROM TBL_JOBHISTORY 
GROUP BY EMPLOYEE_ID HAVING COUNT(EMPLOYEE_ID) >= 1));

87.	Write a SQL query to find those departments where starting salary is at least 8000. Return all the fields of departments.
SELECT * FROM TBL_DEPARTMENTS WHERE DEPARTMENT_ID IN 
(SELECT DEPARTMENT_ID FROM TBL_EMPLOYEES GROUP BY DEPARTMENT_ID HAVING MIN(SALARY) >= 8000);

88.	Write a SQL query to find those managers who supervise four or more employees. Return manager name, department ID.
SELECT getFullName(FIRST_NAME, LAST_NAME) AS MANAGER_NAME, DEPARTMENT_ID FROM TBL_EMPLOYEES E
WHERE MANAGER_ID IN (SELECT MANAGER_ID FROM TBL_EMPLOYEES 
GROUP BY MANAGER_ID HAVING COUNT(EMPLOYEE_ID) >= 4);

89.	Write a SQL query to find those employees who worked as a 'Sales Representative' in the past. Return all the fields of jobs.
SELECT * FROM TBL_EMPLOYEES WHERE EMPLOYEE_ID = 
(SELECT EMPLOYEE_ID FROM TBL_JOBHISTORY 
WHERE JOB_ID = (SELECT JOB_ID FROM TBL_JOBS 
WHERE JOB_TITLE = "Sales Representative")););

90.	Write a SQL query to find those employees who earn second-lowest salary of all the employees. Return all the fields of employees.
SELECT * FROM TBL_EMPLOYEES
WHERE SALARY = (SELECT SALARY FROM TBL_EMPLOYEES ORDER BY SALARY ASC LIMIT 1 OFFSET 1);

// for debugging
SELECT SALARY FROM TBL_EMPLOYEES ORDER BY SALARY ASC LIMIT 1 OFFSET 1;

91.	Write a SQL query to find those departments managed by ‘Susan’. Return all the fields of departments.
SELECT * FROM TBL_DEPARTMENTS WHERE MANAGER_ID = 
(SELECT EMPLOYEE_ID FROM TBL_EMPLOYEES WHERE FIRST_NAME = "SUSAN");

92.	Write a SQL query to find those employees who earn highest salary in a department. Return department ID, employee name, and salary.
SELECT DEPARTMENT_ID, getFullName(FIRST_NAME, LAST_NAME) AS EMPLOYEE_NAME, SALARY 
FROM TBL_EMPLOYEES E WHERE SALARY IN (SELECT MAX(SALARY) FROM TBL_EMPLOYEES 
WHERE DEPARTMENT_ID = E.DEPARTMENT_ID) ORDER BY DEPARTMENT_ID;

// for debugging
SELECT MAX(SALARY), DEPARTMENT_ID FROM TBL_EMPLOYEES GROUP BY DEPARTMENT_ID;

93.	Write a SQL query to find those employees who did not have any job in the past. Return all the fields of employees.
SELECT * FROM TBL_EMPLOYEES WHERE EMPLOYEE_ID NOT IN (SELECT EMPLOYEE_ID FROM TBL_JOBHISTORY);

94.	Write a SQL query to find the first name, last name, department number, and department name for each employee.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME 
FROM TBL_EMPLOYEES E JOIN TBL_DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

// for debugging
SELECT * FROM TBL_EMPLOYEES WHERE DEPARTMENT_ID NOT IN (SELECT DEPARTMENT_ID FROM TBL_DEPARTMENTS);

95.	Write a SQL query to find the first name, last name, department, city, and state province for each employee.
SELECT E.FIRST_NAME, E.LAST_NAME, D.*, L.CITY, L.STATE_PROVINCE
FROM TBL_EMPLOYEES E JOIN TBL_DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
JOIN TBL_LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;

96.	Write a SQL query to find the first name, last name, salary, and job grade for all employees.
SELECT E.FIRST_NAME, E.LAST_NAME, E.SALARY, J.*
FROM TBL_EMPLOYEES E JOIN TBL_JOBS J ON E.JOB_ID = J.JOB_ID;

97.	Write a SQL query to find all those employees who work in department ID 80 or 40 Return first name, last name, department number and department name.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME 
FROM TBL_EMPLOYEES E JOIN TBL_DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
WHERE E.DEPARTMENT_ID IN ('80', '40');

98.	Write a SQL query to find those employees whose first name contains a letter ‘z’. Return first name, last name, department, city, and state province.
SELECT E.FIRST_NAME, E.LAST_NAME, D.*, L.CITY, L.STATE_PROVINCE
FROM TBL_EMPLOYEES E JOIN TBL_DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID 
JOIN TBL_LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID WHERE E.FIRST_NAME LIKE "%Z%";

99.	Write a SQL query to find all departments including those without any employee. Return first name, last name, department ID, department name.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME 
FROM TBL_EMPLOYEES E RIGHT JOIN TBL_DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

100. Write a SQL query to find those employees who earn less than the employee of ID 182. Return first name, last name and salary.
SELECT E1.FIRST_NAME, E1.LAST_NAME, E1.SALARY
FROM TBL_EMPLOYEES E1 JOIN TBL_EMPLOYEES E2 ON E2.EMPLOYEE_ID = 182
WHERE E1.SALARY < E2.SALARY;

101. Write a SQL query to find the employees and their managers. Return the first name of the employee and manager.
SELECT E1.*, E2.FIRST_NAME AS MANAGER_NAME
FROM TBL_EMPLOYEES E1 JOIN TBL_EMPLOYEES E2 
ON E2.EMPLOYEE_ID = E1.MANAGER_ID WHERE E1.MANAGER_ID != 0;

102. Write a SQL query to display the department name, city, and state province for each department.
SELECT D.DEPARTMENT_NAME, L.CITY, L.STATE_PROVINCE
FROM TBL_DEPARTMENTS D JOIN TBL_LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;

103. Write a SQL query to find those employees who have or not any department. Return first name, last name, department ID, department name.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME 
FROM TBL_EMPLOYEES E LEFT JOIN TBL_DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

104. Write a SQL query to find the employees and their managers. These managers do not work under any manager. Return the first name of the employee and manager.
SELECT E1.*, E2.FIRST_NAME AS MANAGER_NAME
FROM TBL_EMPLOYEES E1 JOIN TBL_EMPLOYEES E2 
ON E2.MANAGER_ID = E1.MANAGER_ID WHERE E1.MANAGER_ID = 0;

105. Write a SQL query to find those employees who work in a department where the employee of last name 'Taylor' works. Return first name, last name and department ID.
SELECT E1.FIRST_NAME, E1.LAST_NAME, E1.DEPARTMENT_ID
FROM TBL_EMPLOYEES E1 JOIN TBL_EMPLOYEES E2 
ON E2.DEPARTMENT_ID = E1.DEPARTMENT_ID WHERE E2.LAST_NAME = "TAYLOR";

106. Write a SQL query to find those employees who joined between 1st January 1993 and 31 August 1997. Return job title, department name, employee name, and joining date of the job.
SELECT 
J.JOB_TITLE, D.DEPARTMENT_NAME, 
JH.START_DATE AS JOINING_DATE, 
getFullName(E.FIRST_NAME, E.LAST_NAME) AS EMPLOYEE_NAME
FROM TBL_EMPLOYEES E 
JOIN TBL_JOBS J ON E.JOB_ID = J.JOB_ID 
JOIN TBL_JOBHISTORY JH ON E.EMPLOYEE_ID = JH.EMPLOYEE_ID
JOIN TBL_DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE JH.START_DATE BETWEEN '1993-01-01' AND '1997-12-31';

107. Write a SQL query to find the difference between maximum salary of the job and salary of the employees. Return job title, employee name, and salary difference.
SELECT
J.JOB_TITLE, 
getFullName(E.FIRST_NAME, E.LAST_NAME) AS EMPLOYEE_NAME,
J.MAX_SALARY - E.SALARY AS SALARY_DIFFERENCE
FROM TBL_EMPLOYEES E 
JOIN TBL_JOBS J ON E.JOB_ID = J.JOB_ID;

108. Write a SQL query to compute the average salary, number of employees received commission in that department. Return department name, average salary and number of employees.
SELECT AVG(E.SALARY) AS AVERAGE_SALARY, COUNT(E.EMPLOYEE_ID), D.DEPARTMENT_NAME, D.DEPARTMENT_ID
FROM TBL_EMPLOYEES E 
JOIN TBL_DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.COMMISSION_PCT > 0.00 GROUP BY E.DEPARTMENT_ID;

109. Write a SQL query to compute the difference between maximum salary and salary of all the employees who works the department of ID 80. Return job title, employee name and salary difference.
SELECT
J.JOB_TITLE, 
getFullName(E.FIRST_NAME, E.LAST_NAME) AS EMPLOYEE_NAME,
J.MAX_SALARY - E.SALARY AS SALARY_DIFFERENCE
FROM TBL_EMPLOYEES E 
JOIN TBL_JOBS J ON E.JOB_ID = J.JOB_ID WHERE E.DEPARTMENT_ID = 80;

110. Write a SQL query to find the name of the country, city, and departments, which are running there.
SELECT
D.DEPARTMENT_NAME,
L.CITY,
C.COUNTRY_NAME
FROM TBL_COUNTRIES C
JOIN TBL_LOCATIONS L ON L.COUNTRY_ID = C.COUNTRY_ID
JOIN TBL_DEPARTMENTS D ON D.LOCATION_ID = L.LOCATION_ID;

111. Write a SQL query to find the department name and the full name (first and last name) of the manager.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME 
FROM TBL_EMPLOYEES E JOIN TBL_DEPARTMENTS D ON E.EMPLOYEE_ID = D.MANAGER_ID;

112. Write a SQL query to compute the average salary of employees for each job title.
SELECT AVG(E.SALARY), J.JOB_TITLE 
FROM TBL_EMPLOYEES E JOIN TBL_JOBS J ON E.JOB_ID = J.JOB_ID GROUP BY E.JOB_ID;

113. Write a SQL query to find those employees who earn $12000 and above. Return employee ID, starting date, end date, job ID and department ID.
SELECT 
E.EMPLOYEE_ID,
J.JOB_ID, D.DEPARTMENT_ID, 
JH.START_DATE, JH.END_DATE
FROM TBL_EMPLOYEES E 
JOIN TBL_JOBS J ON E.JOB_ID = J.JOB_ID 
JOIN TBL_JOBHISTORY JH ON E.EMPLOYEE_ID = JH.EMPLOYEE_ID
JOIN TBL_DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.SALARY >= 12000;

114. Write a SQL query to find those departments where at least 2 employees work. Group the result set on country name and city. Return country name, city, and number of departments.
SELECT 
C.COUNTRY_NAME, L.CITY, COUNT(D.DEPARTMENT_ID) AS DEPARTMENTS_COUNT
FROM
TBL_COUNTRIES C
JOIN TBL_LOCATIONS L ON C.COUNTRY_ID = L.COUNTRY_ID
JOIN TBL_DEPARTMENTS D ON L.LOCATION_ID = D.LOCATION_ID 
JOIN TBL_EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY C.COUNTRY_NAME, L.CITY HAVING COUNT(EMPLOYEE_ID) >= 2;

115. Write a SQL query to find the department name, full name (first and last name) of the manager and their city.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
FROM TBL_EMPLOYEES E 
JOIN TBL_DEPARTMENTS D ON E.EMPLOYEE_ID = D.MANAGER_ID
JOIN TBL_LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID;


116. Write a SQL query to compute the number of days worked by employees in a department of ID 80. Return employee ID, job title, number of days worked.
SELECT 
E.EMPLOYEE_ID,
J.JOB_TITLE,
DATEDIFF(JH.END_DATE, JH.START_DATE) AS NUMBER_OF_DAYS_WORKED
FROM 
TBL_EMPLOYEES E
JOIN 
Tbl_JobHistory jh ON e.EMPLOYEE_ID = jh.EMPLOYEE_ID
JOIN 
Tbl_Jobs j ON jh.JOB_ID = j.JOB_ID
WHERE 
e.DEPARTMENT_ID = 80;

117. Write a SQL query to find full name (first and last name), and salary of those employees who work in any department located in 'London' city.
SELECT E.FIRST_NAME, E.LAST_NAME, E.SALARY
FROM TBL_EMPLOYEES E 
JOIN TBL_DEPARTMENTS D ON E.EMPLOYEE_ID = D.MANAGER_ID
JOIN TBL_LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID WHERE L.CITY = "LONDON";

118. Write a SQL query to find full name (first and last name), job title, starting and ending date of last jobs of employees who worked without a commission percentage.
SELECT 
    E.EMPLOYEE_ID,
    J.JOB_TITLE,
    JH.START_DATE, JH.END_DATE
FROM 
    TBL_EMPLOYEES E
JOIN 
    Tbl_JobHistory jh ON e.EMPLOYEE_ID = jh.EMPLOYEE_ID
JOIN 
    Tbl_Jobs j ON jh.JOB_ID = j.JOB_ID
WHERE 
    e.COMMISSION_PCT = 0.00;

119. Write a SQL query to find the department name, department ID, and number of employees in each department.
SELECT
D.DEPARTMENT_NAME, D.DEPARTMENT_ID,
COUNT(E.EMPLOYEE_ID) AS NUMBER_OF_EMPS
FROM TBL_EMPLOYEES E
JOIN TBL_DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY E.DEPARTMENT_ID;

120. Write a SQL query to find the full name (first and last name) of the employee with ID and name of the country presently where he/she is working.
SELECT 
E.FIRST_NAME, E.LAST_NAME, E.EMPLOYEE_ID, C.COUNTRY_NAME
FROM
TBL_EMPLOYEES E
JOIN TBL_DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN TBL_LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID 
JOIN TBL_COUNTRIES C ON C.COUNTRY_ID = L.COUNTRY_ID;