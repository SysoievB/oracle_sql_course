-- Создать таблицу emp1000 с помощью subquery так, чтобы она после
-- создания содержала значения следующих столбцов из таблицы
-- employees: first_name, last_name, salary, department_id.
create table emp1000 as (
    select first_name, last_name, salary, department_id from EMPLOYEES where 1=1
);

-- Создать view v1000 на основе select-а, который объединяет таблицы
-- emp1000 и departments по столбцу department_id. View должен
-- содержать следующие столбцы: first_name, last_name, salary,
-- department_name, department_id
create view v1000 as
select e.first_name,
       e.last_name,
       e.salary,
       e.DEPARTMENT_ID,
       d.department_name
from EMPLOYEES e left join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

-- Добавьте в таблицу emp1000 столбец department_name
alter table emp1000 add (department_name varchar(255));

-- Откомпилируйте view v1000.
alter view v1000 compile;

-- Создайте синоним syn1000 для v1000.
create public synonym syn1000 for v1000;

-- Удалите v1000.
drop view v1000;

-- Удалите syn1000.
drop public synonym syn1000;

-- Удалите emp1000.
drop table emp1000;

-- Создайте последовательность seq1000, которая начинается с 12,
-- увеличивается на 4, имеет максимальное значение 200 и цикличность.
create sequence seq1000 increment by 4 start with 12 maxvalue 200 cycle;

-- Измените эту последовательность. Удалите максимальное значение и цикличность.
alter sequence seq1000 nomaxvalue nocycle;

-- Добавьте 2 строки в таблицу employees, используя минимально
-- возможное количество столбцов. Воспользуйтесь
-- последовательностью seq1000 при добавлении значений в столбец
-- employee_id.
INSERT INTO employees(employee_id) VALUES (seq1000.NEXTVAL);
INSERT INTO employees(employee_id) VALUES (seq1000.NEXTVAL);

-- Совершите commit.
commit;