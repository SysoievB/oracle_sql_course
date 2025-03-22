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

-- Получите список всех сотрудников с именем David.
select * from EMPLOYEES where FIRST_NAME = 'David';

-- Получите список всех сотрудников, у которых job_id равен 2.
select * from EMPLOYEES where JOB_ID = 2;

-- Выведите информацию о имени, фамилии, з/п и номере департамента
-- для сотрудников из 3го департамента с зарплатой, большей 70000.
select FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID from EMPLOYEES where DEPARTMENT_ID = 3 AND SALARY > 70000;

-- Получите список всех сотрудников, которые работают или в 2м, или в
-- 3м департаменте.
select * from EMPLOYEES where DEPARTMENT_ID = 2 OR DEPARTMENT_ID = 3;

-- Получите список всех сотрудников, у которых вторая - 'a' и последняя буква
-- в имени равна 'd'.
select * from EMPLOYEES where FIRST_NAME LIKE '_a%d';

-- Получите список всех сотрудников из 3го и из 2го департамента. Отсортируйте строки по email
-- (возрастающий порядок), используя его порядковый номер.
select * from EMPLOYEES where DEPARTMENT_ID = 3 OR DEPARTMENT_ID = 2 ORDER BY EMAIL;

-- Получите список всех сотрудников, у которых в имени содержатся
-- минимум 2 буквы 'b'.
select * from EMPLOYEES where LOWER(FIRST_NAME) LIKE '%b%b%';

-- Получить список всех сотрудников, у которых длина имени больше 4
-- букв. Отсортируйте строки по номеру департамента (убывающий
-- порядок) так, чтобы значения “null” были в самом конце.
select * from EMPLOYEES where LENGTH(FIRST_NAME) > 4 ORDER BY DEPARTMENT_ID DESC NULLS LAST;

-- Получите список всех сотрудников, у которых зарплата находится в
-- промежутке от 30000 до 70000 (включительно).
select * from EMPLOYEES where SALARY >= 30000 AND SALARY <= 70000;

-- Получите список всех сотрудников у которых в имени содержится
-- символ '%'.
SELECT *FROM EMPLOYEES WHERE FIRST_NAME LIKE '%\%%' ESCAPE '\';

-- Выведите информацию о job_id, имене и з/п для работников, job_id не равен 2 и 4.
-- Отсортируйте строки по job_id (возрастающий порядок) и именам (убывающий порядок).
SELECT JOB_ID, FIRST_NAME, SALARY FROM EMPLOYEES
WHERE JOB_ID NOT IN (2, 4) ORDER BY JOB_ID, FIRST_NAME DESC;

