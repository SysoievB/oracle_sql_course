-- Перепишите и запустите данный statemenet для создания таблицы
-- locations2, которая будет содержать такие же столбцы, что и locations:
-- CREATE TABLE locations2 AS (SELECT * FROM locations WHERE 1=2);
create table locations2 as (select  * from locations where 1=2);

-- Добавьте в таблицу locations2  2 строки с информацией о id локации,
-- адресе, городе, id страны. Пусть данные строки относятся к стране AU & ZA.
insert into locations2(location_id, street_address, postal_code, city, state_province, country_id)
SELECT location_id, street_address, postal_code, city, state_province, country_id
FROM locations
WHERE country_id IN ('AU', 'ZA');

-- Совершите commit.
commit;

-- Добавьте в таблицу locations2 ещё 1 строку, не используя
-- перечисления имён столбцов, в которые заносится информация. Пусть
-- данные строки относятся к стране Франция. При написании значений,
-- где возможно, используйте функции.
INSERT INTO locations2
SELECT * FROM locations
WHERE country_id = 'FR';

-- Совершите commit.
commit;

-- Добавьте в таблицу locations2  строки из таблицы locations, в которых
-- длина значения столбца state_province not null.
insert into locations2
select * from LOCATIONS
where STATE_PROVINCE is null;

-- Совершите commit.
commit;

-- Перепишите и запустите данный statemenet для создания таблицы
-- locations4europe, которая будет содержать такие же столбцы, что и
-- locations:
-- CREATE TABLE locations4europe AS (SELECT * FROM locations WHERE 1=2);
-- What does WHERE 1=2 mean?
-- The condition 1=2 is always false (since 1 is never equal to 2).
-- Because of this, the SELECT statement returns no rows from the locations table.
-- However, the structure (schema) of the locations table
-- (i.e., column names and data types) is still copied into
-- the new table locations4europe.
CREATE TABLE locations4europe AS (SELECT * FROM locations WHERE 1=2);

-- Одним statement-ом добавьте в таблицу locations2  всю информацию
-- для всех строк из таблицы locations, а в таблицу locations4europe
-- добавьте информацию о id локации, адресе, городе, id страны только
-- для тех строк из таблицы locations, где города находятся в Европе.
insert all when 1=1 then
    into locations2 values(location_id, street_address, postal_code, city, state_province, country_id)
    when COUNTRY_ID in
         (select COUNTRY_ID from COUNTRIES where REGION_ID = 1)
    then
into locations4europe (location_id, street_address, city, country_id)
values (location_id, street_address, city, country_id)
select * from LOCATIONS;

-- the same
INSERT ALL
    WHEN 1=1 THEN
    INTO locations2
    WHEN COUNTRY_ID IN (SELECT COUNTRY_ID FROM COUNTRIES WHERE REGION_ID = 1) THEN
    INTO locations4europe (location_id, street_address, city, country_id)
SELECT location_id, street_address, postal_code, city, state_province, country_id
FROM LOCATIONS;

-- Совершите commit.
commit;

-- В таблице locations2 измените почтовый код на любое значение в тех
-- строках, где сейчас нет информации о почтовом коде.
update locations2 set POSTAL_CODE = 'new_postal_code' where POSTAL_CODE is null;

-- Совершите rollback.
rollback;

-- В таблице locations2 измените почтовый код в тех строках, где сейчас
-- нет информации о почтовом коде. Новое значение должно быть кодом
-- из таблицы locations для строки с id 1.
UPDATE locations2
SET POSTAL_CODE = (SELECT POSTAL_CODE FROM locations WHERE LOCATION_ID = 1)
WHERE POSTAL_CODE IS NULL;

-- Совершите commit.
commit;

-- Удалите строки из таблицы locations2, где id страны «US».
delete from locations2 where COUNTRY_ID = 'US';

-- Создайте первый savepoint.
savepoint s1;

-- В таблице locations2 измените адрес в тех строках, где id локации
-- больше 5. Новое значение должно быть «Sezam st. 18»
update locations2
set STREET_ADDRESS = 'Sezam st. 18'
where LOCATION_ID > 5;

-- Создайте второй savepoint.
savepoint s2;

-- Удалите строки из таблицы locations2, где адрес равен «Sezam st. 18».
delete from locations2
where STREET_ADDRESS = 'Sezam st. 18';

-- Откатите изменения до первого savepoint.
rollback to savepoint s1;

-- Совершите commit.
commit;