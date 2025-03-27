-- Получить репорт по department_id с минимальной и максимальной
-- зарплатой, с самой ранней и самой поздней датой прихода на работу и
-- с количеством сотрудников. Сортировать по количеству сотрудников (по убыванию).
SELECT DEPARTMENT_ID,
       MIN(SALARY) AS MIN_SALARY,
       MAX(SALARY) AS MAX_SALARY,
       MIN(HIRE_DATE) AS EARLIEST_HIRE_DATE,
       MAX(HIRE_DATE) AS LATEST_HIRE_DATE,
       COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY EMPLOYEE_COUNT DESC;

-- Выведите информацию о первой букве имени сотрудника и количество
-- имён, которые начинаются с этой буквы. Выводить строки для букв, где
-- количество имён, начинающихся с неё больше 1. Сортировать по количеству.
-- SUBSTR(FIRST_NAME, 1, 1) – извлекает первую букву имени.
-- COUNT(*) – считает количество имён, начинающихся с этой буквы.
-- HAVING COUNT(*) > 1 – оставляет только буквы, у которых больше 1 имени.
-- ORDER BY count_similar_letters DESC – сортирует в порядке убывания количества.
SELECT SUBSTR(FIRST_NAME, 1, 1) AS first_letter,
       COUNT(*) AS count_similar_letters
FROM EMPLOYEES
GROUP BY SUBSTR(FIRST_NAME, 1, 1)
HAVING COUNT(*) > 1
ORDER BY count_similar_letters DESC;

-- Выведите id департамента, з/п и количество сотрудников, которые
-- работают в одном и том же департаменте и получают одинаковую зарплату.
select DEPARTMENT_ID,
       SALARY,
       count(*) as employees_quantity
from EMPLOYEES group by DEPARTMENT_ID, SALARY
having count(*) > 1
order by SALARY;

-- Выведите день недели и количество сотрудников, которых приняли на
-- работу в этот день.
select to_char(HIRE_DATE, 'DAY'),
       count(*)
from EMPLOYEES group by to_char(HIRE_DATE, 'DAY');

-- Выведите id департаментов, в которых работает больше 1
-- сотрудников и сумма их з/п-т больше 150000
select DEPARTMENT_ID
from EMPLOYEES group by DEPARTMENT_ID
having count(DEPARTMENT_ID) > 1 and sum(SALARY) > 150000
order by DEPARTMENT_ID;

-- Из таблицы countries вывести все region_id, для которых сумма всех
-- букв их стран больше 10ти.
SELECT REGION_ID,
       SUM(LENGTH(COUNTRY_NAME)) AS total_letters
FROM COUNTRIES
GROUP BY REGION_ID
HAVING SUM(LENGTH(COUNTRY_NAME)) > 10
ORDER BY REGION_ID;

-- Выведите информацию о job_id и округленную среднюю зарплату
-- работников для каждого job_id.
SELECT JOB_ID,
       ROUND(AVG(SALARY)) AS rounded_avg_salary
FROM EMPLOYEES
GROUP BY JOB_ID;

-- Получить список id департаментов, в которых работают сотрудники
-- нескольких (>1) job_id.
SELECT DEPARTMENT_ID,
       COUNT(DISTINCT JOB_ID) AS job_count
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(DISTINCT JOB_ID) > 1;

-- Выведите информацию о department, job_id, максимальную и
-- минимальную з/п для всех сочетаний department_id - job_id, где
-- средняя з/п больше 70000.
select DEPARTMENT_ID,
       JOB_ID,
       max(SALARY),
       min(SALARY)
from EMPLOYEES
group by DEPARTMENT_ID, JOB_ID
having avg(SALARY) > 70000
order by DEPARTMENT_ID;

-- Получить список JOB_ID, у которых средняя зарплата всех его
-- подчиненных, находится в промежутке от 70000 до 90000.
select JOB_ID,
       round(avg(SALARY), 2)
from EMPLOYEES
group by JOB_ID
having avg(SALARY) between 70000 and 90000;

-- Выведите округлённую до 10 тысяч (не тысячных) максимальную зарплату
-- среди всех средних зарплат по департаментам.
select ROUND(max(SALARY), -4),
       DEPARTMENT_ID
from EMPLOYEES
group by DEPARTMENT_ID
order by DEPARTMENT_ID desc;