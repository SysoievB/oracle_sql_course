-- Выведите в одном репорте информацию о суммах з/п групп,
-- объединённых по employee_id, по job_id, по id департамента. Репорт
-- должен содержать 4 столбца: employee_id, job_id,  id департамента,
-- суммированная з/п.
select DEPARTMENT_ID,
       sum(SALARY) as sum_salary
from EMPLOYEES
group by DEPARTMENT_ID
union
select JOB_ID,
       sum(SALARY) as sum_salary
from EMPLOYEES
group by JOB_ID
union
select EMPLOYEE_ID,
       sum(SALARY) as sum_salary
from EMPLOYEES
group by EMPLOYEE_ID;

-- Используя SET операторы и не используя логические операторы,
-- выведите уникальную информацию о именах, фамилиях и з/п
-- сотрудников, второй символ в именах которых буква «а», и фамилия
-- содержит букву «s» вне зависимости от регистра. Отсортируйте
-- результат по з/п по убыванию.
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE LOWER(FIRST_NAME) LIKE '%a%'
UNION
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE LOWER(LAST_NAME) LIKE '%s%'
ORDER BY SALARY DESC;

-- Используя SET операторы и не используя логические операторы,
-- выведите информацию о id локаций, почтовом коде и городе для
-- локаций, которые находятся в Италии или Германии. А также для
-- локаций, почтовый код которых содержит цифру «9».
SELECT LOCATION_ID, POSTAL_CODE, CITY
FROM LOCATIONS
WHERE COUNTRY_ID IN ('IT', 'DE')
UNION
SELECT LOCATION_ID, POSTAL_CODE, CITY
FROM LOCATIONS
WHERE POSTAL_CODE LIKE '%9%';

-- Используя SET операторы и не используя логические операторы,
-- выведите всю уникальную информацию для стран, длина имён
-- которых больше 8 символов. А также для стран, которые находятся не в
-- европейском регионе. Столбцы аутпута должны называться id, country,
-- region. Аутпут отсортируйте по названию стран по убывающей.
select c.COUNTRY_ID as id,
       c.COUNTRY_NAME as country,
       c.REGION_ID as region
from COUNTRIES c
         left join REGIONS r on r.REGION_ID = c.REGION_ID
where length(r.REGION_NAME) > 8
union
select c.COUNTRY_ID as id,
       c.COUNTRY_NAME as country,
       c.REGION_ID as region
from COUNTRIES c
         left join REGIONS r on r.REGION_ID = c.REGION_ID
where r.REGION_NAME not like 'Europe';