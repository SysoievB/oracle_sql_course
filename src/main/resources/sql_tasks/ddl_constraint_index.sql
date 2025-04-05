-- Primary Key (PK) and Unique Constraints:
-- Both automatically create indexes under the hood in most relational database
-- systems (like Oracle, PostgreSQL, MySQL, SQL Server, etc.).
-- This index helps to quickly find users by their email.
-- It avoids full table scans by using a B-tree structure.
CREATE INDEX idx_users_email ON users(email);

-- Composite index: useful when filtering or sorting by BOTH first_name and last_name.
-- Only effective when the WHERE clause uses the **leading column(s)**.
CREATE INDEX idx_users_name ON users(first_name, last_name);
-- Query	                                Composite Index Needed?
-- WHERE col1 = ?	                        ✅ Use idx_col1 or idx_col1_col2
-- WHERE col2 = ?	                        ❌ idx_col1_col2 not helpful (use idx_col2)
-- WHERE col1 = ? AND col2 = ?	            ✅ idx_col1_col2 best
-- WHERE col2 = ? AND col1 = ?	            ✅ still works (order in WHERE doesn't matter, order in INDEX matters)
-- WHERE col1 = ? AND col2 = ? AND col3 = ?	✅ You can create a 3-column index if query always filters that way

-- 💡 Why idx_col1_col2 doesn’t help WHERE col2 = ??
-- Let's say you have this composite (multi-column) index:
--
-- CREATE INDEX idx_col1_col2 ON my_table(col1, col2);
-- This index is ordered first by col1, then by col2 within each value of col1, like this:
--
-- (col1, col2)
-- --------------
--   A     10
--   A     11
--   A     12
--   B     8
--   B     9
--   C     4
-- So this index is very helpful if your query uses:
--
-- WHERE col1 = ?
--
-- WHERE col1 = ? AND col2 = ?
--
-- WHERE col1 = ? AND col2 BETWEEN ...
--
-- But if your query is only:
--
-- WHERE col2 = ?
-- Then this index is useless because:
--
-- The database cannot jump directly to the correct col2 values.
--
-- It needs to start scanning from the beginning of the index, but the index is organized by col1 first, so it can't efficiently find col2 values.
--
-- 🔍 Think of it like a phone book:
-- It’s sorted by last name, then first name.
--
-- If you know the last name = "Smith" → super fast.
--
-- If you only know first name = "John" → the book is not sorted by first name, so you'd need to scan the whole thing.
--
-- ✅ Solution?
-- If you want to speed up WHERE col2 = ?, you need:
--
-- CREATE INDEX idx_col2 ON my_table(col2);
-- Or, if sometimes you filter both col1 and col2, and sometimes just col2:
--
-- You may consider having both idx_col1_col2 and idx_col2.


-- Создать таблицу address со следующими столбцами: id, country, city.
-- При создании таблицы создайте на inline уровне unique constraint с
-- именем ad_id_un на столбец id.
CREATE TABLE address
(
    id      INT,
    country VARCHAR2(255),
    city    VARCHAR2(255),
    CONSTRAINT ad_id_un UNIQUE (id)
);

-- Создать таблицу friends со следующими столбцами: id, name, email,
-- address_id, birthday. При создании таблицы создайте на inline уровне
-- foreign key constraint на столбец address_id, который ссылается на
-- столбец id из таблицы address, используйте опцию «on delete set null».
-- Также при создании таблицы создайте на table уровне check constraint
-- для проверки того, что длина имени должна быть больше 3-х.
-- Создаём таблицу friends с внешним ключом и проверкой длины имени
CREATE TABLE friends
(
    id         INT,
    name       VARCHAR2(255) CHECK (LENGTH(name) > 3),
    email      VARCHAR2(255),
    address_id INT,
    birthday   VARCHAR2(255),
    CONSTRAINT fk_address FOREIGN KEY (address_id) REFERENCES address (id)
        ON DELETE SET NULL
);

-- Создайте уникальный индекс на столбец id из таблицы friends.
create unique index un_index_id on friends(id);

-- С помощью функционала «add» команды «alter table» создайте
-- constraint primary key с названием fr_id_pk на столбец id из таблицы friends.
ALTER TABLE friends ADD CONSTRAINT fr_id_pk PRIMARY KEY (id);


-- Создайте индекс с названием fr_email_in на столбец email из таблицы
-- friends.
create index fr_email_in on friends(email);

-- С помощью функционала «modify» команды «alter table» создайте
-- constraint not null с названием fr_email_nn на столбец email из таблицы friends.
ALTER TABLE friends MODIFY email VARCHAR(255) CONSTRAINT fr_email_nn NOT NULL;


-- Удалите таблицу friends.
drop table friends;

-- Удалите таблицу address.
drop table address;
