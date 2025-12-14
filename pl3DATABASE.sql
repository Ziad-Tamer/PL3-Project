


CREATE TABLE category (
    id INT PRIMARY KEY,
    category_name NVARCHAR(255) NOT NULL
);


CREATE TABLE author (
    id INT PRIMARY KEY,
    first_name NVARCHAR(255) NOT NULL,
    last_name NVARCHAR(255) NOT NULL
);

CREATE TABLE member_status (
    id INT PRIMARY KEY,
    status_value NVARCHAR(255) NOT NULL
);


CREATE TABLE member (
    id INT PRIMARY KEY,
    first_name NVARCHAR(255) NOT NULL,
    last_name NVARCHAR(255) NOT NULL,
    joined_date DATE NOT NULL,
    active_status_id INT NOT NULL,
    FOREIGN KEY (active_status_id) REFERENCES member_status(id)
);


CREATE TABLE book (
    id INT PRIMARY KEY,
    title NVARCHAR(255) NOT NULL,
    category_id INT NOT NULL,
    publication_date DATE NOT NULL,
    copies_owned INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category(id)
);


CREATE TABLE book_author (
    book_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(id),
    FOREIGN KEY (author_id) REFERENCES author(id)
);


CREATE TABLE reservation_status (
    id INT PRIMARY KEY,
    status_value NVARCHAR(255) NOT NULL
);


CREATE TABLE reservation (
    id INT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    reservation_date DATE NOT NULL,
    reservation_status_id INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES book(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (reservation_status_id) REFERENCES reservation_status(id)
);


CREATE TABLE loan (
    id INT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    returned_date DATE NULL,
    FOREIGN KEY (book_id) REFERENCES book(id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);


CREATE TABLE fine (
    id INT PRIMARY KEY,
    member_id INT NOT NULL,
    loan_id INT NOT NULL,
    fine_date DATE NOT NULL,
    fine_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (loan_id) REFERENCES loan(id)
);


CREATE TABLE fine_payment (
    id INT PRIMARY KEY,
    fine_id INT NOT NULL, 
    member_id INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (fine_id) REFERENCES fine(id), 
    FOREIGN KEY (member_id) REFERENCES member(id)
);