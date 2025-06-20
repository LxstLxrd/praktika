-- Создание ролей

CREATE ROLE librarian;
CREATE ROLE reader_role;



-- Предоставление прав ролям

GRANT USAGE ON SCHEMA public TO librarian; 
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Books TO librarian;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Authors TO librarian;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE BookAuthors TO librarian;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Borrows TO librarian;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE Readers TO librarian; 
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO librarian;


GRANT USAGE ON SCHEMA public TO reader_role;
GRANT SELECT ON TABLE Books TO reader_role;
GRANT SELECT ON TABLE Authors TO reader_role;
GRANT SELECT ON TABLE BookAuthors TO reader_role;
GRANT SELECT ON TABLE Borrows TO reader_role;
GRANT SELECT ON TABLE Readers TO reader_role;



-- Создание пользователей и назначение им ролей

CREATE USER lib_user WITH PASSWORD 'StrongPassword123';
GRANT librarian TO lib_user;


CREATE USER reader_user WITH PASSWORD 'AnotherSecurePwd456';
GRANT reader_role TO reader_user;


