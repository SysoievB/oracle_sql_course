-- Выведите информацию о регионах и количестве сотрудников в каждом регионе.
select r.region_name,
       count(distinct e.EMPLOYEE_ID) as employee_count
from REGIONS r
         left join COUNTRIES c on r.REGION_ID = c.REGION_ID
         left join LOCATIONS l on l.COUNTRY_ID = c.COUNTRY_ID
         left join DEPARTMENTS d on l.LOCATION_ID = d.DEPARTMENT_ID
         left join EMPLOYEES e on d.DEPARTMENT_ID = e.DEPARTMENT_ID
group by r.region_name
order by employee_count;

-- Выведите детальную информацию о каждом сотруднике: имя,
-- фамилия, название департамента, job_id, адрес, страна и регион.
select e.FIRST_NAME,
       e.LAST_NAME,
       d.DEPARTMENT_NAME,
       e.JOB_ID,
       COALESCE(l.STREET_ADDRESS, '') || ' ' || COALESCE(l.POSTAL_CODE, '') AS ADDRESS,
       c.COUNTRY_NAME,
       r.REGION_NAME
from EMPLOYEES e
         left join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
         left join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID
         left join COUNTRIES c on c.COUNTRY_ID = l.COUNTRY_ID
         left join REGIONS r on c.REGION_ID = r.REGION_ID;

-- Выведите информацию о имени менеджеров
SELECT DISTINCT m.FIRST_NAME,
                m.LAST_NAME,
                j.JOB_TITLE
FROM EMPLOYEES m
         LEFT JOIN JOBS j ON j.JOB_ID = m.JOB_ID
WHERE j.JOB_TITLE LIKE '%Manager%'
ORDER BY m.LAST_NAME, m.FIRST_NAME;

-- Выведите информацию о названии всех департаментов и о количестве
-- работников, если в департаменте работают больше 0 сотрудников.
-- Используйте технологию «USING» для объединения по id департамента.
select d.DEPARTMENT_NAME,
       COUNT(e.EMPLOYEE_ID) as employees_count
from EMPLOYEES e
         left join DEPARTMENTS d using (DEPARTMENT_ID)
group by d.DEPARTMENT_NAME
having count(e.EMPLOYEE_ID) > 0;

-- Выведите названия всех департаментов, в которых нет ни одного сотрудника.
SELECT d.DEPARTMENT_NAME,
       COUNT(e.EMPLOYEE_ID) as employees_count
FROM DEPARTMENTS d
         LEFT JOIN EMPLOYEES e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_NAME
HAVING COUNT(e.EMPLOYEE_ID) = 0;

-- Выведите название страны и название региона этой страны, используя natural join.
select COUNTRY_NAME,
       REGION_NAME
from COUNTRIES
         natural join REGIONS;

-- Выведите имена, фамилии и з/п сотрудников, которые получают
-- меньше, чем (минимальная з/п по их специальности + 10000).
select e.FIRST_NAME,
       e.LAST_NAME,
       e.SALARY,
       j.MIN_SALARY
from EMPLOYEES e
         left join JOBS j on e.JOB_ID = j.JOB_ID
where j.MIN_SALARY + 10000 > e.SALARY;

-- Выведите уникальные имена и фамилии сотрудников, названия стран,
-- в которых они работают. Также выведите информацию о сотрудниках,
-- о странах которых нет информации. А также выведите все страны, в
-- которых нет сотрудников компании.
SELECT DISTINCT e.FIRST_NAME,
                e.LAST_NAME,
                c.COUNTRY_NAME
FROM EMPLOYEES e
         FULL OUTER JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
         FULL OUTER JOIN LOCATIONS l ON d.LOCATION_ID = l.LOCATION_ID
         FULL OUTER JOIN COUNTRIES c ON l.COUNTRY_ID = c.COUNTRY_ID;

-- Выведите имена и фамилии всех сотрудников, а также названия стран,
-- которые мы получаем при объединении работников со всеми
-- странами без какой-либо логики.
select FIRST_NAME,
       LAST_NAME,
       COUNTRY_NAME
from EMPLOYEES
         cross join COUNTRIES;

-- Решите задачу (Выведите информацию о регионах и количестве сотрудников в каждом регионе.)
-- используя Oracle Join синтаксис.
select r.REGION_NAME,
       count(e.EMPLOYEE_ID)
from REGIONS r, EMPLOYEES e, DEPARTMENTS d, LOCATIONS l, COUNTRIES c
where r.REGION_ID = c.REGION_ID
  and c.COUNTRY_ID = l.COUNTRY_ID
  and l.LOCATION_ID = d.LOCATION_ID
  and d.DEPARTMENT_ID = e.DEPARTMENT_ID
group by r.REGION_NAME;

-- Решите задачу (Выведите названия всех департаментов, в которых нет ни одного сотрудника. ),
-- используя Oracle Join синтаксис.
select DEPARTMENT_NAME,
       count(EMPLOYEE_ID)
from DEPARTMENTS d, EMPLOYEES e
where d.DEPARTMENT_ID = e.DEPARTMENT_ID (+)
group by DEPARTMENT_NAME
having count(EMPLOYEE_ID) = 0;