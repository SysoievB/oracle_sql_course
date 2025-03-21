-- returns title of used DB
SELECT sys_context('USERENV', 'DB_NAME') AS database_name FROM dual;
