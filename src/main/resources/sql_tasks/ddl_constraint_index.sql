-- Создать таблицу address со следующими столбцами: id, country, city.
-- При создании таблицы создайте на inline уровне unique constraint с
-- именем ad_id_un на столбец id.

-- Создать таблицу friends со следующими столбцами: id, name, email,
-- address_id, birthday. При создании таблицы создайте на inline уровне
-- foreign key constraint на столбец address_id, который ссылается на
-- столбец id из таблицы address, используйте опцию «on delete set null».
-- Также при создании таблицы создайте на table уровне check constraint
-- для проверки того, что длина имени должна быть больше 3-х.

-- Создайте уникальный индекс на столбец id из таблицы friends.

-- С помощью функционала «add» команды «alter table» создайте
-- constraint primary key с названием fr_id_pk на столбец id из таблицы
-- friends.

-- Создайте индекс с названием fr_email_in на столбец email из таблицы
-- friends.

-- С помощью функционала «modify» команды «alter table» создайте
-- constraint not null с названием fr_email_nn на столбец email из таблицы
-- friends.

-- Удалите таблицу friends.

-- Удалите таблицу address.
