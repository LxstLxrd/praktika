-- Найти все книги, написанные определённым автором

SELECT b.title, b.publication_year, b.isbn
FROM Books b
JOIN BookAuthors ba ON b.book_id = ba.book_id
JOIN Authors a ON ba.author_id = a.author_id
WHERE a.name = 'Имя Автора';



-- Показать все книги, которые сейчас на руках у читателей (т.е. выдачи без даты возврата)

SELECT b.title, r.name AS reader_name, br.borrow_date
FROM Books b
JOIN Borrows br ON b.book_id = br.book_id
JOIN Readers r ON br.reader_id = r.reader_id
WHERE br.return_date IS NULL;


-- Вывести список из 5 самых популярных книг по количеству выдач

SELECT b.title, COUNT(br.borrow_id) AS number_of_borrows
FROM Books b
JOIN Borrows br ON b.book_id = br.book_id
GROUP BY b.book_id, b.title
ORDER BY number_of_borrows DESC
LIMIT 5;


-- Найти читателей, у которых есть просроченные книги (считайте, что срок выдачи — 30 дней)

SELECT DISTINCT r.name, r.email, b.title AS overdue_book_title, br.borrow_date
FROM Readers r
JOIN Borrows br ON r.reader_id = br.reader_id
JOIN Books b ON br.book_id = b.book_id
WHERE br.return_date IS NULL AND (CURRENT_DATE - br.borrow_date) > 30;
