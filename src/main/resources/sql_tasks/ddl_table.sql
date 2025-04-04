-- Создать таблицу friends с помощью subquery так, чтобы она после
-- создания содержала значения следующих столбцов из таблицы
-- employees: employee_id, first_name, last_name для тех строк, где
-- имеются комиссионные. Столбцы в таблице friends должны называться id, name, surname
create table friends(id, name, surname)
as
select employee_id, first_name, last_name
from EMPLOYEES
where 1 = 1;

-- Добавить в таблицу friends новый столбец email
alter table friends
    add (email varchar(255));

-- Изменить столбец email так, чтобы его значение по умолчанию было «no email».
alter table friends
    modify (email varchar(255) default 'no email');

-- Проверить добавлением новой строки, работает ли дефолтное
-- значение столбца email.
insert into friends(id, name, surname)
values (999, 'Vasia', 'Pupkin');

-- Изменить название столбца с id на friends_id
alter table friends rename column id to friends_id;

-- Удалить таблицу friends.
drop table friends;

-- Создание таблицы friends с указанными столбцами
CREATE TABLE friends
(
    id       INT,
    name     VARCHAR(255),
    surname  VARCHAR(255),
    email    VARCHAR(255),
    salary   INT DEFAULT 0,
    city     VARCHAR(255) DEFAULT 'no city',
    birthday DATE DEFAULT CURRENT_DATE
);

-- Добавление строки со всеми значениями
INSERT INTO friends (id, name, surname, email, salary, city, birthday)
VALUES (1, 'Vasia', 'Pupkin', 'vasia@mail.com', 3000, 'Warsaw',
        TO_DATE('2000-09-23', 'YYYY-MM-DD'));

-- Добавить 1 строку в таблицу friends со всеми значениями кроме salary
-- и birthday.
INSERT INTO friends (id, name, surname, email, salary)
VALUES (2, 'Petia', 'Pupkin', 'petia@mail.com', 5000);

-- Совершить commit.
commit;

-- Удалить столбец salary.
alter table friends drop column salary;

-- Сделать столбец email неиспользуемым (unused).
-- Why Use Unused Columns?
-- ✅ Non-blocking operation – Unlike DROP COLUMN, marking a column as unused does not require restructuring the table immediately.
-- ✅ Faster than dropping – The column is only hidden, avoiding expensive disk operations.
-- ✅ Deferred deletion – You can drop all unused columns at a later time when it's convenient.
-- 🔹 Marking a column as unused is faster than ALTER TABLE DROP COLUMN, especially on large tables.
-- 🔹 You cannot query, update, or modify an unused column.
-- 🔹 Unused columns still exist internally in the database until dropped.
-- 🔹 Dropping unused columns is the final step to remove them permanently.
alter table friends set unused column email;

-- Сделать столбец birthday неиспользуемым (unused).
alter table friends set unused column birthday;

-- Удалить из таблицы friends неиспользуемые столбцы.
alter table friends drop unused columns;

-- Сделать таблицу friends пригодной только для чтения.
alter table friends read only;

-- Проверить предыдущее действие любой DML командой.
INSERT INTO friends (id, name, surname)
VALUES (3, 'Petia', 'Pupkin');

-- Опустошить таблицу friends.
truncate table friends;

-- Удалить таблицу friends.
drop table friends;