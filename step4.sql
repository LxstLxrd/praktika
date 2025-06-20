--Добавление новой книги вместе с её автором

BEGIN TRANSACTION;

INSERT INTO Authors (name, nationality)
VALUES ('Новый Автор Имя', 'Новая Национальность')
RETURNING author_id;

INSERT INTO Books (title, publication_year, isbn)
VALUES ('Новое Название Книги', 2025, '978-0-000000-00-1')
RETURNING book_id;

INSERT INTO BookAuthors (book_id, author_id)
VALUES (id книги, id автора);

COMMIT;




-- Обновление email-адоеса одного из читателей

UPDATE Readers
SET email = 'new.email@example.com'
WHERE library_card_id = 'ID_Читательского_Билета';





-- Удаление книги,которой больше нет в библиотеке, предварительно обработав связанные с ней выдачи

DO $$
DECLARE
    book_to_delete_id INT;
BEGIN
book_to_delete_id := id удаляемой книги;
UPDATE Borrows
    SET return_date = CURRENT_DATE
    WHERE book_id = book_to_delete_id AND return_date IS NULL;
    DELETE FROM Books
    WHERE book_id = book_to_delete_id;

    RAISE NOTICE 'Книга с ID % удалена, а все связанные с ней незавершенные выдачи отмечены как возвращенные.', book_to_delete_id;

EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Произошла ошибка при удалении книги: %', SQLERRM;
END $$;
