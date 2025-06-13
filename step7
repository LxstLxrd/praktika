-- Создание полной резервной копии с pg_dump
-- Bash

cd "C:\Program Files\PostgreSQL\17\bin"

pg_dump -U postgres -W -F p -f "E:\library_backup.sql" my_library






DROP DATABASE my_library;

CREATE DATABASE my_library;





-- Восстановление из текстового SQL-файла
-- Bash

psql -U postger -W -d my_library -f "E:\library_backup.sql"
