CREATE DATABASE my_library;

\c my_library

CREATE TABLE Authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    nationality VARCHAR(100)
);

CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_year INT,
    isbn VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE BookAuthors (
    book_id INT REFERENCES Books(book_id) ON DELETE CASCADE,
    author_id INT REFERENCES Authors(author_id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, author_id)
);

CREATE TABLE Readers (
    reader_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    library_card_id VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Borrows (
    borrow_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES Books(book_id) ON DELETE RESTRICT,
    reader_id INT REFERENCES Readers(reader_id) ON DELETE RESTRICT,
    borrow_date DATE NOT NULL DEFAULT CURRENT_DATE,
    return_date DATE,
    CONSTRAINT chk_return_date CHECK (return_date IS NULL OR return_date >= borrow_date)
);
