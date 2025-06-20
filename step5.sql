-- Анализ производительности запросов с EXPLAIN 

EXPLAIN ANALYZE
SELECT b.title, b.publication_year, b.isbn
FROM Books b
JOIN BookAuthors ba ON b.book_id = ba.book_id
JOIN Authors a ON ba.author_id = a.author_id
WHERE a.name = 'Имя Автора';



-- Создание индексов

CREATE INDEX idx_authors_name ON Authors(name);
CREATE INDEX idx_bookauthors_book_id ON BookAuthors(book_id);
CREATE INDEX idx_bookauthors_author_id ON BookAuthors(author_id);
CREATE INDEX idx_borrows_return_date ON Borrows(return_date);
CREATE INDEX idx_borrows_on_loan ON Borrows(book_id, reader_id) WHERE return_date IS NULL; 
CREATE INDEX idx_borrows_book_id ON Borrows(book_id);
CREATE INDEX idx_borrows_reader_id ON Borrows(reader_id);
CREATE INDEX idx_borrows_borrow_date ON Borrows(borrow_date);


