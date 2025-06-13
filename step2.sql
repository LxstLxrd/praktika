INSERT INTO Authors (name, nationality) VALUES
('Джордж Оруэлл', 'Британец'),
('Федор Достоевский', 'Русский'),
('Джейн Остин', 'Британка'),
('Габриэль Гарсиа Маркес', 'Колумбиец'),
('Илья Ильф', 'Русский'),
('Евгений Петров', 'Русский');

INSERT INTO Readers (name, email, library_card_id) VALUES
('Иван Иванов', 'ivan.ivanov@example.com', 'LIB-001'),
('Мария Петрова', 'maria.petrova@example.com', 'LIB-002'),
('Алексей Сидоров', 'alex.sidorov@example.com', 'LIB-003'),
('Елена Смирнова', 'elena.smirnova@example.com', 'LIB-004');

INSERT INTO Books (title, publication_year, isbn) VALUES
('1984', 1949, '978-5-17-080104-7'),
('Преступление и наказание', 1866, '978-5-389-04922-9'),
('Гордость и предубеждение', 1813, '978-5-389-06213-6'),
('Сто лет одиночества', 1967, '978-5-17-078519-4'),
('Двенадцать стульев', 1928, '978-5-17-084933-9'),
('Скотный двор', 1945, '978-5-17-094520-8');

INSERT INTO BookAuthors (book_id, author_id) VALUES
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5), 
(5, 6), 
(6, 1); 

INSERT INTO Borrows (book_id, reader_id, borrow_date, return_date) VALUES
(1, 1, '2025-04-01', '2025-04-20'),
(3, 1, CURRENT_DATE - INTERVAL '10 days', NULL),
(5, 2, CURRENT_DATE - INTERVAL '5 days', NULL),
(2, 3, '2025-03-15', '2025-04-10'),
(4, 4, CURRENT_DATE - INTERVAL '45 days', NULL),
(1, 2, '2025-05-01', '2025-05-25'),
(1, 3, '2025-05-26', NULL),
(5, 1, '2025-02-01', '2025-02-28');
