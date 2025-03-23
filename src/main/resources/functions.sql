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
