-- Выведите всю информацию о сотрудниках, с самым длинным именем.
select FIRST_NAME,
       LAST_NAME,
       max(length(FIRST_NAME)) as max_lenght_name
from EMPLOYEES
group by FIRST_NAME, LAST_NAME
having LENGTH(FIRST_NAME) = max(length(FIRST_NAME));-- returns all names lengths

select FIRST_NAME,
       LAST_NAME
from EMPLOYEES
where LENGTH(FIRST_NAME) = (SELECT MAX(LENGTH(FIRST_NAME)) FROM EMPLOYEES);-- returns just one exact name

-- Выведите всю информацию  о сотрудниках, с зарплатой большей
-- средней зарплаты всех сотрудников.
select FIRST_NAME,
       SALARY
from EMPLOYEES
where SALARY > (select avg(SALARY) from EMPLOYEES);

-- Получить город/города, где сотрудники в сумме зарабатывают меньше всего.
SELECT l.CITY, SUM(e.SALARY) AS TOTAL_SALARY
FROM LOCATIONS l
         JOIN DEPARTMENTS d ON l.LOCATION_ID = d.LOCATION_ID
         JOIN EMPLOYEES e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY l.CITY
HAVING SUM(e.SALARY) = (SELECT MIN(TOTAL_SALARY)
                        FROM (SELECT SUM(e.SALARY) AS TOTAL_SALARY
                              FROM EMPLOYEES e
                                       JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
                                       JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID
                              GROUP BY l.CITY));

-- Выведите всю информацию о департаментах, в которых нет ни одного сотрудника.
SELECT
    d.DEPARTMENT_ID,
    d.DEPARTMENT_NAME
FROM DEPARTMENTS d
WHERE
    d.DEPARTMENT_ID NOT IN (
        SELECT DISTINCT DEPARTMENT_ID
        FROM EMPLOYEES
        WHERE DEPARTMENT_ID IS NOT NULL
    );

-- Выведите всю информацию  о сотрудниках, которые не являются менеджерами.
select e.FIRST_NAME,
       e.LAST_NAME
from EMPLOYEES e
where e.JOB_ID not in(
    select distinct JOB_ID from JOBS j where LOWER(j.JOB_TITLE) like '%manager%'
);

-- Выведите всю информацию  о сотрудниках, которые работают в
-- департаменте с названием IT.
select e.FIRST_NAME,
       e.LAST_NAME
from EMPLOYEES e
where e.DEPARTMENT_ID in (select DEPARTMENT_ID from DEPARTMENTS where DEPARTMENT_NAME = 'IT');
