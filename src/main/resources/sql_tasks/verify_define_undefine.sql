-- variable substitution
-- -- For predefined parameters (set via "Edit Parameters" dialog)
-- select * from EMPLOYEES where EMPLOYEE_ID = :ID;(for Oracle SQL developer EMPLOYEE_ID = &ID)
-- -- For runtime prompts:
-- select * from EMPLOYEES where EMPLOYEE_ID = ?;

-- Создать таблицу test200 со следующими столбцами: id, name1, name2,
-- address1, address2. 1-ый должен быть типа integer, остальные - varchar2.
create table test200
(
    id       integer,
    name1    varchar2(255),
    name2    varchar2(255),
    address1 varchar2(255),
    address2 varchar2(255)
);

-- Напишите такой шаблон для изменения строк, который при каждом
-- запуске будет спрашивать, значение какого столбца меняется, на какое
-- значение меняется и для какого значения id меняется.
select * from test200 where id = ?;

-- Напишите select, в котором требуется вывести всю информацию из
-- таблицы test200 для строк, у которых столбцы name1 и name2 равны
-- одному и тому же значению, а также столбцы address1 и address2 тоже
-- равны одному и тому же значению. Напишите такой шаблон для этого
-- statement-а, который при запуске один раз спросит всего 2 значения –
-- одно для первых 2х столбцов и второе для других 2х столбцов.
SELECT *
FROM test200
WHERE name1 = name2
  AND address1 = address2
  AND name1 = :name_val
  AND address1 = :addr_val;

-- Напишите команду/ды, которая удаляет сессионные значения для
-- наших переменных.
UNDEFINE name_val;
UNDEFINE addr_val;
