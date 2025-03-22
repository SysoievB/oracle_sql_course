-- returns title of used DB
SELECT sys_context('USERENV', 'DB_NAME') AS database_name FROM dual;

-- Выведите всю информацию о регионах.
select * from REGIONS;

-- Выведите информацию о имени, id департамента, зарплате и фамилии для всех работников.
select FIRST_NAME, DEPARTMENT_ID, SALARY, LAST_NAME from EMPLOYEES;

-- Выведите информацию о id работника, электронной почте и дату, которая была за неделю до
-- трудоустройства для всех работников. Столбец, который будет содержать дату назовите
-- One week before hire date.
select EMPLOYEE_ID, EMAIL, HIRE_DATE - 7 "One week before hire date" from EMPLOYEES;

-- Выведите информацию о работниках с их позициями в формате: Donald(last name). Назовите столбец our_employees
select FIRST_NAME || '(' || EMPLOYEES.LAST_NAME || ')' as our_employees  from EMPLOYEES;

-- Выведите список уникальных имён среди работников.
select distinct FIRST_NAME from EMPLOYEES;

-- Выведите следующую информацию из таблицы jobs:
--  job_title,
--  выражение в формате:  «min = 20080, max = 40000»
-- , где 20080 – это минимальная з/п, а 40000 – максимальная.
-- Назовите этот столбец info.
--  максимальную з/п и назовите столбец max,
--  новую з/п, которая будет называться new_salary и вычисляться по
-- формуле: max_salary*2-2000.
select JOB_TITLE,
       'min = ' || MIN_SALARY || ', max = ' || MAX_SALARY as info,
       MAX_SALARY as max,
       MIN_SALARY*2-2000 as new_salary
from JOBS;

-- Выведите на экран предложение «Peter's dog is very clever», используя одну из двух техник работы с одинарными кавычками.
select 'Peter"s dog is very clever' from DUAL;

-- Выведите на экран предложение «Peter's dog is very clever», используя, отличную от предыдущего примера, технику работы с одинарными кавычками.
select q'<Peter's dog is very clever>' from DUAL;

-- Выведите на экран количество минут в одном веке (1 год = 365.25 дней).
select 'There are ' || 100 * 365.25 * 24 * 60 || ' minutes in one year' from DUAL;