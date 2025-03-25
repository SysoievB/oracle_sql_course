-- Получите список всех сотрудников, у которых длина имени больше 5 букв.
select * from EMPLOYEES where LENGTH(FIRST_NAME) > 5;

-- Получите список всех сотрудников, зарплата которых кратна 1000.
select * from EMPLOYEES where MOD(SALARY, 1000) = 0;

-- Выведите телефонный номер и первое 3х значное число телефонного
-- номера сотрудника, если его номер представлен в формате ХХХ.ХХХ.ХХХХ
select PHONE_NUMBER, SUBSTR(PHONE_NUMBER, 0, 3) from EMPLOYEES where PHONE_NUMBER LIKE '___.___.____';

-- Получите список всех сотрудников, у которых последняя буква в фамилии
-- равна 'n' и длина фамилии больше 5ти.
select * from EMPLOYEES where LENGTH(LAST_NAME) > 5 AND LAST_NAME LIKE '%n';

-- Выведите дату следующей пятницы.
select NEXT_DAY(SYSDATE, 5) from dual;

-- Получите список всех сотрудников, которые работают в компании больше 6 лет.
select * from EMPLOYEES where MONTHS_BETWEEN(SYSDATE, HIRE_DATE) > 72;

-- Выведите телефонный номер, заменив в значении PHONE_NUMBER все '.' на '-'.
select REPLACE(PHONE_NUMBER, '.', '-') from EMPLOYEES;

-- Выведите имя, email для всех работников в формате:  STEVEN sking
select UPPER(FIRST_NAME), SUBSTR(EMAIL, 1, INSTR(EMAIL, '@') - 1) from EMPLOYEES;

-- Выведите информацию о имени работника и его з/п, не используя
-- символ || , в таком виде: Steven24000
select  CONCAT(FIRST_NAME, SALARY) as name_salary from EMPLOYEES;

-- Выведите информацию о дате приёма сотрудника на работу,
-- округлённой дате приёма на работу до месяца и первом дне года
-- приёма на работу.
select TRUNC(HIRE_DATE, 'MM') from EMPLOYEES;

-- Выведите информацию о имени и фамилии всех работников. Имя
-- должно состоять из 10 символов и если длина имени меньше 10, то
-- дополняйте до 10 символов знаком $. Фамилия должна состоять из 15
-- символов и если длина фамилии меньше 15, то перед фамилией
-- ставьте столько знаков ! сколько необходимо.
SELECT
    RPAD(FIRST_NAME, 10, '$') AS padded_first_name,
    LPAD(LAST_NAME, 15, '!') AS padded_last_name
FROM EMPLOYEES;

-- Выведите имя сотрудника и позицию второй буквы ‘d’ в его имени.
select FIRST_NAME, INSTR(LOWER(FIRST_NAME), 'd', 1, 2) as second_d_occurence from EMPLOYEES;

-- Выведите на экран текст '!!!HELLO!! MY FRIEND!!!!!!!!'  и тот же текст, но
-- без символа восклицательный знак в начале и конце текста.
SELECT
    '!!!HELLO!! MY FRIEND!!!!!!!!' AS original_text,
    TRIM('!' FROM '!!!HELLO!! MY FRIEND!!!!!!!!') AS trimmed_text
FROM dual;

-- Выведите информацию о:
--   з/п работника,
--   з/п умноженной на коэффициент 3.1415 ,
--   округлённый до целого значения вариант увеличенной з/п-ты,
--   целое количество тысяч из увеличенной з/п.
SELECT
    SALARY,
    SALARY * 3.1415 AS updated_salary,
    ROUND(SALARY * 3.1415) AS rounded_salary,
    ROUND(SALARY * 3.1415 / 1000) AS rounded_thousands_salary
FROM EMPLOYEES;

-- Выведите информацию о:
--   дате приёма сотрудника на работу,
--   дате, которая была через пол года, после принятия сотрудника на работу,
--   дате последнего дня в месяце принятия сотрудника на работу.
select HIRE_DATE, ADD_MONTHS(HIRE_DATE, 6), LAST_DAY(HIRE_DATE) from EMPLOYEES;

-- Используя функции, получите список всех сотрудников у которых в
-- имени есть буква 'b' (без учета регистра).
select * from EMPLOYEES where lower(FIRST_NAME) like '%b%';

-- Используя функции, получите список всех сотрудников у которых в
-- имени содержатся минимум 2 буквы 'a'.
select * from EMPLOYEES where lower(FIRST_NAME) like '%a%a%';

-- Получите первое слово из имени департамента, для тех
-- департаментов, у которых название состоит больше, чем из одного слова.
select DEPARTMENT_NAME,
       substr(DEPARTMENT_NAME, 1, instr(DEPARTMENT_NAME, ' ')) as FIRST_WORD
from DEPARTMENTS where instr(DEPARTMENT_NAME, ' ') > 0;

-- Получите имена сотрудников без первой и последней буквы в имени.
SELECT FIRST_NAME,
       SUBSTR(FIRST_NAME, 2, LENGTH(FIRST_NAME) - 2) AS trimmed_first_last_letters
FROM EMPLOYEES;

-- Получите список всех сотрудников, у которых в значении job_title после
-- знака ' ' как минимум 3 символа, но при этом это значение после ' ' не равно 'Engineer'
SELECT JOB_TITLE FROM JOBS
WHERE LENGTH(SUBSTR(JOB_TITLE, INSTR(JOB_TITLE, ' ') + 1)) > 3
AND SUBSTR(JOB_TITLE, INSTR(JOB_TITLE, ' ') + 1) <> 'Engineer';

-- Получите список всех сотрудников, которые пришли на работу в первый день любого месяца.
SELECT HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE = TRUNC(HIRE_DATE, 'MM');

-- Получите список всех сотрудников, которые пришли на работу в 2019ом году.
select HIRE_DATE from EMPLOYEES
where TO_CHAR(HIRE_DATE, 'YYYY') = '2019';

-- Покажите завтрашнюю дату в формате:
-- Tomorrow is Second day of January
SELECT 'Tomorrow is ' || TO_CHAR(SYSDATE + 1, 'fmDay "day of" Month') AS formatted_date FROM dual;

-- Выведите имя сотрудника и дату его прихода на работу в формате:
-- 21st of June, 2007
SELECT FIRST_NAME,
       HIRE_DATE,
       TO_CHAR(HIRE_DATE, 'DD') ||
       CASE
           WHEN TO_CHAR(HIRE_DATE, 'DD') IN ('11', '12', '13') THEN 'th'
           WHEN TO_CHAR(HIRE_DATE, 'DD') LIKE '%1' THEN 'st'
           WHEN TO_CHAR(HIRE_DATE, 'DD') LIKE '%2' THEN 'nd'
           WHEN TO_CHAR(HIRE_DATE, 'DD') LIKE '%3' THEN 'rd'
           ELSE 'th'
           END ||
       ' of ' || TO_CHAR(HIRE_DATE, 'Month') || ', ' || TO_CHAR(HIRE_DATE, 'YYYY')
           AS formatted_date
FROM EMPLOYEES;

-- Получите список работников с увеличенными зарплатами на 20%.
-- Зарплату показать в формате:     $28,800.00
select SALARY,
       TO_CHAR(SALARY * 1.2, 'FM$999,999,999.00') as increased_salary
from EMPLOYEES;

-- Выведите актуальную дату (нынешнюю), + секунда, + минута, + час, +
-- день, + месяц, + год. (Всё это по отдельности прибавляется к
-- актуальной дате).
SELECT SYSDATE AS current_date,
       SYSDATE + (1/86400) AS added_second,  -- 1 second = 1/86400 of a day
       SYSDATE + (1/1440) AS added_minute,  -- 1 minute = 1/1440 of a day
       SYSDATE + (1/24) AS added_hour,      -- 1 hour = 1/24 of a day
       SYSDATE + 1 AS added_day,            -- 1 day
       ADD_MONTHS(SYSDATE, 1) AS added_month, -- Adding 1 month
       ADD_MONTHS(SYSDATE, 12) AS added_year -- Adding 1 year
FROM dual;

-- Выведите имя сотрудника, его з/п и новую з/п, которая равна старой
-- плюс это значение текста «$12,345.55».
select FIRST_NAME,
       SALARY,
       SALARY + TO_NUMBER('$12,345.55','$999,999.99') as updated_salary
from EMPLOYEES;

-- Выведите имя сотрудника, день его трудоустройства, а также
-- количество месяцев между днём его трудоустройства и датой, которую
-- необходимо получить из текста «SEP, 18:45:00 18 2009».
SELECT FIRST_NAME,
       HIRE_DATE,
       ROUND(MONTHS_BETWEEN(
                     HIRE_DATE,
                     TO_DATE('18-SEP-2009 18:45:00', 'DD-MON-YYYY HH24:MI:SS', 'NLS_DATE_LANGUAGE=ENGLISH')
             ), 0) AS months_between
FROM EMPLOYEES;

-- Выведите имя сотрудника, его з/п, а также полную salary в формате: $24,000.00
select FIRST_NAME,
       SALARY,
       to_char(SALARY, '$999,999.99') as formatted_salary
from EMPLOYEES;

-- Выведите имя сотрудника, его фамилию, а также выражение «different
-- length», если длина имени не равна длине фамилии или выражение
-- «same length», если длина имени равна длине фамилии. Не
-- используйте conditional functions.
SELECT FIRST_NAME,
       LAST_NAME,
       DECODE(LENGTH(FIRST_NAME), LENGTH(LAST_NAME), 'same length', 'different length') AS length_name
FROM EMPLOYEES;

-- Выведите имя сотрудника, его salary present - Yes else No
select FIRST_NAME,
       SALARY,
       NVL2(SALARY, 'Yes', 'No')
from EMPLOYEES;

-- Выведите имя сотрудника и значение которое его будет
-- характеризовать: значение job_id, если присутствует, если нет,
-- то department_id, если и оно отсутствует, то его з/п.
select FIRST_NAME,
       COALESCE(JOB_ID, DEPARTMENT_ID, SALARY) as characteristics
from EMPLOYEES;

-- Выведите имя сотрудника, его з/п, а также уровень зарплаты каждого
-- сотрудника: Меньше 70000 считается Low level, Больше или равно 70000
-- и меньше 80000 считается Normal level, Больше или равно 80000
-- считается High level.
select FIRST_NAME,
       SALARY,
       DECODE(SALARY,
              SALARY < 70000, 'Low level',
              SALARY >= 70000 and SALARY < 80000, 'Normal level',
              SALARY >= 80000, 'High level'
       )
from EMPLOYEES;

-- Для каждой страны показать регион, в котором она находится: 1-Europe
-- 2-America, 3-Asia, 4-Africa . Выполнить данное задание, не
-- используя функционал JOIN. Используйте DECODE.
SELECT COUNTRY_NAME,
       DECODE(COUNTRY_ID,
              'FR', 'Europe',
              'DE', 'Europe',
              'IT', 'Europe',
              'US', 'America',
              'CA', 'America',
              'BR', 'America',
              'CN', 'Asia',
              'JP', 'Asia',
              'IN', 'Asia',
              'ZA', 'Africa',
              'EG', 'Africa',
              'NG', 'Africa',
              'Unknown'  -- Default value if no match is found
       ) AS REGION
FROM COUNTRIES;

-- Задачу предыдущую решите используя CASE.
SELECT COUNTRY_NAME,
       CASE
           WHEN COUNTRY_ID = 'FR' THEN 'Europe'
           WHEN COUNTRY_ID = 'DE' THEN 'Europe'
           WHEN COUNTRY_ID = 'IT' THEN 'Europe'
           WHEN COUNTRY_ID = 'US' THEN 'America'
           WHEN COUNTRY_ID = 'CA' THEN 'America'
           WHEN COUNTRY_ID = 'BR' THEN 'America'
           WHEN COUNTRY_ID = 'CN' THEN 'Asia'
           WHEN COUNTRY_ID = 'JP' THEN 'Asia'
           WHEN COUNTRY_ID = 'IN' THEN 'Asia'
           WHEN COUNTRY_ID = 'ZA' THEN 'Africa'
           WHEN COUNTRY_ID = 'EG' THEN 'Africa'
           WHEN COUNTRY_ID = 'NG' THEN 'Africa'
           ELSE 'Unknown'  -- Default value if no match is found
           END AS REGION
FROM COUNTRIES;

-- Выведите имя сотрудника, его з/п, а также уровень того, насколько у сотрудника хорошие условия :
--  BAD: з/п меньше 10000 и отсутствие комиссионных;
--  NORMAL: з/п между 10000 и 15000 или, если  присутствуют комиссионные;
--  GOOD: з/п больше или равна 15000.
select FIRST_NAME,
       SALARY,
       CASE
           WHEN SALARY < 70000 THEN 'BAD'
           WHEN SALARY >= 70000 AND SALARY < 80000 THEN 'NORMAL'
           WHEN SALARY >= 80000 THEN 'GOOD'
           END AS salary_characteristics
from EMPLOYEES;