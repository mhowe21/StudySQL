-- For the SQL flavor I used sqlite as the database could be set up locally is portable, and does not require a server configuration.  Some commands might differ from other DBMSs, however they should be similar.

-- Part A: Create Tables

-- Create Author Table with autoincrement primary key author id

CREATE TABLE "Author_Table" (
	"AuthorID"	INTEGER NOT NULL UNIQUE,
	"AuthorFirstName"	TEXT NOT NULL,
	"AuthorLastName"	TEXT NOT NULL,
	"AuthorNationality"	TEXT NOT NULL,
	PRIMARY KEY("AuthorID" AUTOINCREMENT)
);


-- Create Book Table with autoincrement primary key book id and a foreign key author id
CREATE TABLE "Book_Table" (
	"BookID"	INTEGER NOT NULL,
	"BookTitle"	TEXT NOT NULL,
	"BookAuthor"	INTEGER NOT NULL,
	"Genre"	TEXT NOT NULL,
	PRIMARY KEY("BookID" AUTOINCREMENT),
	FOREIGN KEY("BookAuthor") REFERENCES "Author_Table"("AuthorID")
);

-- Create Client Table with autoincrement primary key client id

CREATE TABLE "Client_Table" (
	"ClientID"	INTEGER NOT NULL,
	"ClientFirstName"	TEXT NOT NULL,
	"ClientLastName"	TEXT NOT NULL,
	"ClientDoB"	INTEGER NOT NULL,
	"Occupation"	TEXT,
	PRIMARY KEY("ClientID" AUTOINCREMENT)
);

-- Create Borrower Table with autoincrement primary key borrow id and foreign key client id
CREATE TABLE "Borrower_Table" (
	"BorrowID"	INTEGER NOT NULL UNIQUE,
	"ClientID"	INTEGER NOT NULL,
	"BookID"	INTEGER NOT NULL,
	"BorrowDate"	TEXT NOT NULL,
	PRIMARY KEY("BorrowID" AUTOINCREMENT),
	FOREIGN KEY("ClientID") REFERENCES "Client_Table"("ClientID")
);


-- Part B: Add data to tables

-- add data to Author Table

INSERT INTO Author_Table (AuthorFirstName, AuthorLastName, AuthorNationality)
VALUES
('Sofia', 'Smith', 'Canada'),
('Maria', 'Brown', 'Brazil'),
('Elena', 'Martin', 'Mexico'),
('Zoe', 'Roy', 'France'),
('Sebastian', 'Lavoie', 'Canada'),
('Dylan', 'Garcia', 'Spain'),
('Ian', 'Cruz', 'Mexico'),
('Lucas', 'Smith', 'USA'),
('Fabian', 'Wilson', 'USA'),
('Liam', 'Taylor', 'Canada'),
('William', 'Thomas', 'Great Britain'),
('Logan', 'Moore', 'Canada'),
('Oliver', 'Martin', 'France'),
('Alysha', 'Thompson', 'Canada'),
('Isabelle', 'Lee', 'Canada'),
('Emily', 'Clark', 'USA'),
('John', 'Young', 'China'),
('David', 'Wright', 'Canada'),
('Thomas', 'Scott', 'Canada'),
('Helena', 'Adams', 'Canada'),
('Sofia', 'Carter', 'USA'),
('Liam', 'Parker', 'Canada'),
('Emily', 'Murphy', 'USA');

-- create index for Author Table
-- Author ID should be unique and is the primary key so adding an unique index
CREATE UNIQUE INDEX "AuthorID_Index" ON "Author_Table" (
	"AuthorID"	ASC
)
-- Nationality likely to be grouped/orded by and used in where clauses so adding an index but will not be unique. 
CREATE INDEX "Author_Index" ON "Author_Table" (
	"AuthorNationality"
)


-- Add data to Book Table
INSERT INTO Book_table (BookTitle, BookAuthor, Genre) VALUES
('Build your database system', '1', 'Science'),
('The red wall', '2', 'Fiction'),
('The perfect match', '3', 'Fiction'),
('Digital Logic', '4', 'Science'),
('How to be a great lawyer', '5', 'Law'),
('Manage successful negotiations', '6', 'Society'),
('Pollution today', '7', 'Science'),
('A gray park', '2', 'Fiction'),
('How to be rich in one year', '8', 'Humor'),
('Their bright fate', '9', 'Fiction'),
('Black lines', '10', 'Fiction'),
('History of theater', '11', 'Literature'),
('Electrical transformers', '12', 'Science'),
('Build your big data system', '1', 'Science'),
('Right and left', '13', 'Children'),
('Programming using Python', '1', 'Science'),
('Computer networks', '14', 'Science'),
('Performance evaluation', '15', 'Science'),
('Daily exercise', '16', 'Well being'),
('The silver uniform', '17', 'Fiction'),
('Industrial revolution', '18', 'History'),
('Green nature', '19', 'Well being'),
('Perfect football', '20', 'Well being'),
('The chocolate love', '21', 'Humor'),
('Director and leader', '22', 'Society'),
('Play football every week', '20', 'well being'),
('Maya the bee', '13', 'Children'),
('Perfect rugby', '20', 'Well being'),
('The end', '23', 'Fiction'),
('Computer security', '1', 'Science'),
('Participate', '22', 'Society'),
('Positive figures', '3', 'Fiction');

-- create index for Book Table
-- Book ID should be unique and is a primary key so adding an index
CREATE UNIQUE INDEX "BookID_Index" ON "Book_Table" (
	"BookID"	ASC
)

-- Book Author and Genre are likely to be used in group/order by joins and where clauses so adding an index. Book author is also a foreign key
CREATE INDEX "BookTable_Index" ON "Book_Table" (
	"BookAuthor",
	"Genre"
)

-- add data to Client Table

INSERT INTO Client_Table (ClientFirstName, ClientLastName, ClientDob, Occupation) VALUES
('Kaiden', 'Hill', '2006', 'Student'),
('Alina', 'Morton', '2010', 'Student'),
('Fania', 'Brooks', '1983', 'Food Scientist'),
('Courtney', 'Jensen', '2006', 'Student'),
('Brittany', 'Hill', '1983', 'Firefighter'),
('Max', 'Rogers', '2005', 'Student'),
('Margaret', 'McCarthy', '1981', 'School Psychologist'),
('Julie', 'McCarthy', '1973', 'Professor'),
('Ken', 'McCarthy', '1974', 'Securities Clerk'),
('Britany', "O'Quinn", '1984', 'Violinist'),
('Conner', 'Gardner', '1998', 'Licensed Massage Therapist'),
('Mya', 'Austin', '1960', 'Parquet Floor Layer'),
('Thierry', 'Rogers', '2004', 'Student'),
('Eloise', 'Rogers', '1984', 'Computer Security Manager'),
('Gerard', 'Jackson', '1979', 'Oil Exploration Engineer'),
('Randy', 'Day', '1986', 'Aircraft Electrician'),
('Jodie', 'Page', '1990', 'Manufacturing Director'),
('Coral', 'Rice', '1996', 'Window Washer'),
('Ayman', 'Austin', '2002', 'Student'),
('Jaxson', 'Austin', '1999', 'Repair Worker'),
('Joel', 'Austin', '1973', 'Police Officer'),
('Alina', 'Austin', '2010', 'Student'),
('Elin', 'Austin', '1962', 'Payroll Clerk'),
('Ophelia', 'Wolf', '2004', 'Student'),
('Eliot', 'McGuire', '1967', 'Dentist'),
('Peter', 'McKinney', '1968', 'Professor'),
('Annabella', 'Henry', '1974', 'Nurse'),
('Anastasia', 'Baker', '2001', 'Student'),
('Tyler', 'Baker', '1984', 'Police Officer'),
('Lilian', 'Ross', '1983', 'Insurance Agent'),
('Thierry', 'Arnold', '1975', 'Bus Driver'),
('Angelina', 'Rowe', '1979', 'Firefighter'),
('Marcia', 'Rowe', '1974', 'Health Educator'),
('Martin', 'Rowe', '1976', 'Ship Engineer'),
('Adeline', 'Rowe', '2005', 'Student'),
('Colette', 'Rowe', '1963', 'Professor'),
('Diane', 'Clark', '1975', 'Payroll Clerk'),
('Caroline', 'Clark', '1960', 'Dentist'),
('Dalton', 'Clayton', '1982', 'Police Officer'),
('Steve', 'Clayton', '1990', 'Bus Driver'),
('Melanie', 'Clayton', '1987', 'Computer Engineer'),
('Alana', 'Wilson', '2007', 'Student'),
('Carson', 'Byrne', '1995', 'Food Scientist'),
('Conrad', 'Byrne', '2007', 'Student'),
('Ryan', 'Porter', '2008', 'Student'),
('Elin', 'Porter', '1978', 'Computer Programmer'),
('Tyler', 'Harvey', '2007', 'Student'),
('Arya', 'Harvey', '2008', 'Student'),
('Serena', 'Harvey', '1978', 'School Teacher'),
('Lilly', 'Franklin', '1976', 'Doctor'),
('Mai', 'Franklin', '1994', 'Dentist'),
('John', 'Franklin', '1999', 'Firefighter'),
('Judy', 'Franklin', '1995', 'Firefighter'),
('Katy', 'Lloyd', '1992', 'School Teacher'),
('Tamara', 'Allen', '1963', 'Ship Engineer'),
('Maxim', 'Lyons', '1985', 'Police Officer'),
('Allan', 'Lyons', '1983', 'Computer Engineer'),
('Marc', 'Harris', '1980', 'School Teacher'),
('Elin', 'Young', '2009', 'Student'),
('Diana', 'Young', '2008', 'Student'),
('Diane', 'Young', '2006', 'Student'),
('Alana', 'Bird', '2003', 'Student'),
('Anna', 'Becker', '1979', 'Security Agent'),
('Katie', 'Grant', '1977', 'Manager'),
('Joan', 'Grant', '2010', 'Student'),
('Bryan', 'Bell', '2001', 'Student'),
('Belle', 'Miller', '1970', 'Professor'),
('Peggy', 'Stevens', '1990', 'Bus Driver'),
('Steve', 'Williamson', '1975', 'HR Clerk'),
('Tyler', 'Williamson', '1999', 'Doctor'),
('Izabelle', 'Williamson', '1990', 'Systems Analyst'),
('Annabel', 'Williamson', '1960', 'Cashier'),
('Mohamed', 'Waters', '1966', 'Insurance Agent'),
('Marion', 'Newman', '1970', 'Computer Programmer'),
('Ada', 'Williams', '1986', 'Computer Programmer'),
('Sean', 'Scott', '1983', 'Bus Driver'),
('Farrah', 'Scott', '1974', 'Ship Engineer'),
('Christine', 'Lambert', '1973', 'School Teacher'),
('Alysha', 'Lambert', '2007', 'Student'),
('Maia', 'Grant', '1984', 'School Teacher');

-- Index for table Client_Table
-- Client ID is unique and a primary key so using a unique index
CREATE UNIQUE INDEX "ClientID_Index" ON "Client_Table" (
	"ClientID"	ASC
)

-- client doB and occupation likely to be used for searching and ordering so using an index
CREATE INDEX "ClientTable_Index" ON "Client_Table" (
	"ClientDoB",
	"Occupation"
)



-- Add data to Borrower_Table

INSERT INTO Borrower_Table (ClientID, BookID, BorrowDate) VALUES
(35, 17, '2016-07-20'),
(1, 3, '2017-04-19'),
(42, 8, '2016-10-03'),
(62, 16, '2016-04-05'),
(53, 13, '2017-01-17'),
(33, 15, '2015-11-26'),
(40, 14, '2015-01-21'),
(64, 2, '2017-09-10'),
(56, 30, '2017-08-02'),
(23, 2, '2018-06-28'),
(46, 19, '2015-11-18'),
(61, 20, '2015-11-24'),
(58, 7, '2017-06-17'),
(46, 16, '2017-02-12'),
(80, 21, '2018-03-18'),
(51, 23, '2015-09-01'),
(49, 18, '2015-07-28'),
(43, 18, '2015-11-04'),
(30, 2, '2018-08-10'),
(48, 24, '2015-05-13'),
(71, 5, '2016-09-05'),
(35, 3, '2016-07-03'),
(57, 1, '2015-03-17'),
(23, 25, '2017-08-16'),
(20, 12, '2018-07-24'),
(25, 7, '2015-01-31'),
(72, 29, '2016-04-10'),
(74, 20, '2017-07-31'),
(53, 14, '2016-02-20'),
(32, 10, '2017-07-24'),
(12, 15, '2018-04-25'),
(77, 13, '2017-06-09'),
(30, 4, '2017-10-24'),
(37, 24, '2016-01-14'),
(27, 26, '2017-06-05'),
(1, 16, '2018-05-06'),
(21, 9, '2016-03-19'),
(69, 28, '2017-03-29'),
(17, 19, '2017-03-14'),
(8, 9, '2016-04-22'),
(63, 18, '2015-01-25'),
(65, 20, '2016-10-10'),
(51, 19, '2015-07-28'),
(23, 12, '2017-01-25'),
(17, 4, '2017-04-18'),
(68, 5, '2016-09-06'),
(46, 13, '2017-09-30'),
(15, 13, '2017-07-05'),
(11, 19, '2017-12-14'),
(78, 15, '2017-01-26'),
(47, 9, '2015-03-03'),
(68, 7, '2016-05-26'),
(37, 26, '2017-02-06'),
(48, 27, '2015-12-30'),
(9, 21, '2017-10-21'),
(29, 8, '2018-04-01'),
(64, 18, '2017-08-29'),
(61, 26, '2018-02-21'),
(39, 28, '2016-07-26'),
(73, 18, '2018-08-22'),
(11, 13, '2018-01-17'),
(45, 6, '2016-07-20'),
(33, 13, '2018-03-18'),
(10, 17, '2016-06-06'),
(28, 18, '2017-02-17'),
(51, 3, '2016-12-09'),
(29, 2, '2015-09-18'),
(28, 30, '2017-09-14'),
(74, 20, '2015-12-12'),
(15, 22, '2015-01-14'),
(57, 8, '2017-08-20'),
(2, 5, '2015-01-18'),
(74, 12, '2018-04-14'),
(51, 10, '2016-02-25'),
(25, 17, '2015-02-24'),
(45, 21, '2017-02-10'),
(27, 25, '2016-08-03'),
(32, 28, '2016-06-15'),
(71, 21, '2017-05-21'),
(75, 26, '2016-05-03'),
(56, 32, '2015-12-23'),
(26, 32, '2015-05-16'),
(66, 32, '2015-05-30'),
(57, 18, '2017-09-15'),
(40, 15, '2016-09-02'),
(65, 4, '2017-08-17'),
(54, 7, '2015-12-19'),
(29, 4, '2017-07-22'),
(44, 9, '2017-12-31'),
(56, 31, '2015-06-13'),
(17, 4, '2015-04-01'),
(35, 16, '2018-07-19'),
(22, 18, '2017-06-22'),
(39, 24, '2015-05-29'),
(63, 14, '2018-01-20'),
(53, 21, '2016-07-31'),
(40, 9, '2016-07-10'),
(52, 4, '2017-04-05'),
(27, 20, '2016-09-04'),
(72, 29, '2015-12-06'),
(49, 16, '2017-12-19'),
(6, 12, '2016-12-04'),
(74, 31, '2016-07-27'),
(48, 32, '2016-06-29'),
(69, 2, '2016-12-27'),
(60, 32, '2017-10-29'),
(45, 22, '2017-06-12'),
(42, 15, '2017-05-14'),
(79, 8, '2016-10-13'),
(70, 18, '2016-12-04'),
(34, 8, '2016-03-06'),
(43, 8, '2015-12-19'),
(42, 32, '2016-04-20'),
(67, 5, '2017-03-06'),
(80, 25, '2015-06-23'),
(54, 11, '2017-05-03'),
(34, 28, '2017-08-30'),
(65, 20, '2017-08-26'),
(61, 19, '2018-01-05'),
(38, 12, '2018-01-17'),
(51, 4, '2016-05-13'),
(7, 16, '2016-03-17'),
(46, 16, '2016-11-25'),
(75, 30, '2018-08-12'),
(72, 32, '2015-03-12'),
(44, 17, '2015-06-15'),
(68, 15, '2016-02-21'),
(21, 1, '2016-06-19'),
(14, 25, '2016-10-10'),
(68, 21, '2016-05-27'),
(35, 20, '2015-03-19'),
(16, 27, '2016-08-08'),
(79, 31, '2018-03-07'),
(14, 17, '2018-04-28'),
(29, 28, '2018-03-11'),
(41, 4, '2018-08-08'),
(42, 3, '2016-02-23'),
(45, 3, '2017-07-10'),
(36, 16, '2018-07-19'),
(36, 30, '2015-08-07'),
(54, 32, '2018-03-14'),
(61, 15, '2017-03-28'),
(1, 13, '2018-05-17'),
(43, 1, '2015-05-14'),
(37, 14, '2015-07-30'),
(62, 17, '2015-09-19'),
(50, 22, '2016-12-02'),
(45, 1, '2016-07-24'),
(32, 17, '2018-03-10'),
(13, 28, '2016-02-14'),
(15, 9, '2018-08-11'),
(10, 19, '2018-08-29'),
(66, 3, '2016-11-27'),
(68, 29, '2017-07-12'),
(21, 14, '2018-06-27'),
(35, 9, '2016-01-22'),
(17, 24, '2016-08-25'),
(40, 21, '2015-07-09'),
(1, 24, '2016-03-28'),
(70, 27, '2015-07-10'),
(80, 26, '2016-04-24'),
(29, 5, '2015-10-18'),
(76, 12, '2018-04-25'),
(22, 4, '2016-12-24'),
(2, 2, '2017-10-26'),
(35, 13, '2016-02-28'),
(40, 8, '2017-10-02'),
(68, 9, '2016-01-03'),
(32, 5, '2016-11-13'),
(34, 17, '2016-09-15'),
(34, 16, '2018-04-13'),
(80, 30, '2016-10-13'),
(20, 32, '2015-11-17'),
(36, 10, '2017-09-01'),
(78, 12, '2018-06-27'),
(57, 8, '2016-03-22'),
(75, 11, '2017-06-27'),
(71, 10, '2015-08-01'),
(48, 22, '2015-09-29'),
(19, 16, '2016-02-21'),
(79, 30, '2018-08-20'),
(70, 13, '2016-09-16'),
(30, 6, '2017-02-10'),
(45, 12, '2017-10-12'),
(30, 27, '2016-11-23'),
(26, 3, '2016-08-13'),
(66, 6, '2017-01-14'),
(47, 15, '2016-02-10'),
(53, 30, '2018-08-08'),
(80, 16, '2016-03-31'),
(70, 13, '2018-02-03'),
(14, 25, '2016-03-27'),
(46, 22, '2016-01-13'),
(30, 32, '2015-08-06'),
(60, 14, '2016-11-27'),
(14, 13, '2018-05-23'),
(71, 15, '2016-06-22'),
(38, 21, '2015-12-27'),
(69, 30, '2017-04-29'),
(49, 31, '2018-06-03'),
(28, 28, '2015-05-29'),
(49, 3, '2016-08-30'),
(75, 1, '2015-10-29'),
(78, 3, '2017-05-12'),
(43, 18, '2015-03-25'),
(27, 21, '2016-02-22'),
(64, 22, '2015-04-03'),
(21, 11, '2017-12-09'),
(66, 29, '2016-12-20'),
(45, 13, '2017-04-15'),
(48, 30, '2015-01-31'),
(20, 25, '2017-12-20'),
(41, 20, '2018-01-29'),
(51, 12, '2015-07-05'),
(5, 1, '2015-04-12'),
(40, 3, '2018-02-24'),
(79, 4, '2018-06-27'),
(15, 10, '2016-11-01'),
(42, 22, '2016-12-28'),
(17, 9, '2018-01-29'),
(38, 13, '2016-05-09'),
(79, 2, '2017-12-06'),
(74, 3, '2015-12-07'),
(46, 8, '2016-06-05'),
(78, 22, '2018-08-11'),
(45, 2, '2015-04-20'),
(72, 31, '2015-11-11'),
(18, 17, '2015-03-21'),
(29, 3, '2017-08-13'),
(66, 11, '2018-06-05'),
(36, 16, '2016-04-28'),
(26, 2, '2016-10-23'),
(32, 1, '2017-10-31'),
(62, 14, '2017-07-25'),
(12, 4, '2015-07-08'),
(38, 32, '2015-02-24'),
(29, 16, '2016-07-28'),
(36, 25, '2017-05-07'),
(76, 7, '2015-06-13'),
(28, 16, '2016-08-15'),
(60, 13, '2016-08-26'),
(8, 3, '2017-07-28'),
(25, 1, '2016-07-30'),
(62, 29, '2018-08-24'),
(51, 8, '2016-09-01'),
(27, 23, '2015-02-08'),
(69, 12, '2018-06-25'),
(51, 12, '2015-07-04'),
(7, 4, '2015-05-01'),
(31, 15, '2017-10-29'),
(14, 23, '2015-01-15'),
(14, 1, '2018-05-21'),
(39, 25, '2015-12-26'),
(79, 24, '2016-05-31'),
(40, 15, '2016-03-18'),
(51, 13, '2018-04-13'),
(61, 1, '2015-02-11'),
(15, 24, '2018-03-02'),
(10, 22, '2018-01-21'),
(67, 10, '2017-07-08'),
(79, 11, '2016-12-11'),
(19, 32, '2016-05-04'),
(35, 11, '2017-08-01'),
(27, 13, '2017-12-15'),
(30, 22, '2015-12-22'),
(8, 7, '2015-06-26'),
(70, 9, '2016-03-20'),
(56, 18, '2016-01-29'),
(13, 19, '2015-03-06'),
(61, 2, '2016-06-18'),
(47, 13, '2017-09-18'),
(30, 22, '2016-02-19'),
(18, 22, '2016-12-31'),
(34, 29, '2017-10-27'),
(32, 21, '2015-06-03'),
(9, 28, '2016-03-30'),
(62, 24, '2015-03-23'),
(44, 22, '2017-04-29'),
(27, 5, '2015-03-25'),
(61, 28, '2017-07-14'),
(5, 13, '2016-12-04'),
(43, 19, '2018-03-15'),
(34, 19, '2016-06-05'),
(35, 5, '2018-02-19'),
(13, 12, '2016-09-23'),
(74, 18, '2016-12-26'),
(70, 31, '2017-08-15'),
(42, 17, '2016-06-15'),
(51, 24, '2018-07-30'),
(45, 30, '2015-01-15'),
(70, 17, '2017-10-07'),
(77, 7, '2017-01-06'),
(74, 25, '2015-09-25'),
(47, 14, '2018-02-01'),
(10, 2, '2017-04-18'),
(16, 21, '2016-10-03'),
(48, 5, '2016-09-17'),
(72, 3, '2017-02-10'),
(26, 23, '2016-03-01'),
(49, 23, '2016-10-25');

-- Index for table Borrower_Table
-- Index for column BorrowerID should be unique and is a primary key so creating a unique index
CREATE UNIQUE INDEX "BorrowerID_Index" ON "Borrower_Table" (
	"BorrowID"
)

-- ClientID, BookID are both foreign keys so creating an index for each in addtion adding borrow date as it will likely be grouped by/ordered by. 
CREATE INDEX "BorrowerTable_Index" ON "Borrower_Table" (
	"ClientID",
	"BookID",
	"BorrowDate"
)



-- Part C: Queries

-- 1. Display all contents of the Clients table
SELECT *
FROM Client_Table;

-- Output
"ClientID ClientFirstName ClientLastName ClientDob ClientOccupation
1	Kaiden	Hill	2006	Student
2	Alina	Morton	2010	Student
3	Fania	Brooks	1983	Food Scientist
4	Courtney	Jensen	2006	Student
5	Brittany	Hill	1983	Firefightr
6	Max	Rogers	2005	Student
7	Margaret	McCarthy	1981	School Psychologist
8	Julie	McCarthy	1973	Professor
9	Ken	McCarthy	1974	Securities Clerk
10	Britany	O'Quinn	1984	Violinist
11	Conner	Gardner	1998	Licensed Massage Therapist
12	Mya	Austin	1960	Parquet Floor Layer
13	Thierry	Rogers	2004	Student
14	Eloise	Rogers	1984	Computer Security Manager
15	Gerard	Jackson	1979	Oil Exploration Engineer
16	Randy	Day	1986	Aircraft Electrician
17	Jodie	Page	1990	Manufacturing Director
18	Coral	Rice	1996	Window Washer
19	Ayman	Austin	2002	Student
20	Jaxson	Austin	1999	Repair Worker
21	Joel	Austin	1973	Police Officer
22	Alina	Austin	2010	Student
23	Elin	Austin	1962	Payroll Clerk
24	Ophelia	Wolf	2004	Student
25	Eliot	McGuire	1967	Dentist
26	Peter	McKinney	1968	Professor
27	Annabella	Henry	1974	Nurse
28	Anastasia	Baker	2001	Student
29	Tyler	Baker	1984	Police Officer
30	Lilian	Ross	1983	Insurance Agent
31	Thierry	Arnold	1975	Bus Driver
32	Angelina	Rowe	1979	Firefighter
33	Marcia	Rowe	1974	Health Educator
34	Martin	Rowe	1976	Ship Engineer
35	Adeline	Rowe	2005	Student
36	Colette	Rowe	1963	Professor
37	Diane	Clark	1975	Payroll Clerk
38	Caroline	Clark	1960	Dentist
39	Dalton	Clayton	1982	Police Officer
40	Steve	Clayton	1990	Bus Driver
41	Melanie	Clayton	1987	Computer Engineer
42	Alana	Wilson	2007	Student
43	Carson	Byrne	1995	Food Scientist
44	Conrad	Byrne	2007	Student
45	Ryan	Porter	2008	Student
46	Elin	Porter	1978	Computer Programmer
47	Tyler	Harvey	2007	Student
48	Arya	Harvey	2008	Student
49	Serena	Harvey	1978	School Teacher
50	Lilly	Franklin	1976	Doctor
51	Mai	Franklin	1994	Dentist
52	John	Franklin	1999	Firefighter
53	Judy	Franklin	1995	Firefighter
54	Katy	Lloyd	1992	School Teacher
55	Tamara	Allen	1963	Ship Engineer
56	Maxim	Lyons	1985	Police Officer
57	Allan	Lyons	1983	Computer Engineer
58	Marc	Harris	1980	School Teacher
59	Elin	Young	2009	Student
60	Diana	Young	2008	Student
61	Diane	Young	2006	Student
62	Alana	Bird	2003	Student
63	Anna	Becker	1979	Security Agent
64	Katie	Grant	1977	Manager
65	Joan	Grant	2010	Student
66	Bryan	Bell	2001	Student
67	Belle	Miller	1970	Professor
68	Peggy	Stevens	1990	Bus Driver
69	Steve	Williamson	1975	HR Clerk
70	Tyler	Williamson	1999	Doctor
71	Izabelle	Williamson	1990	Systems Analyst
72	Annabel	Williamson	1960	Cashier
73	Mohamed	Waters	1966	Insurance Agent
74	Marion	Newman	1970	Computer Programmer
75	Ada	Williams	1986	Computer Programmer
76	Sean	Scott	1983	Bus Driver
77	Farrah	Scott	1974	Ship Engineer
78	Christine	Lambert	1973	School Teacher
79	Alysha	Lambert	2007	Student
80	Maia	Grant	1984	School Teacher"

-- output


-- 2. First names, last names, ages and occupations of all clients
-- age as an integer of current year minus dob. Note that this calculation is slightly different for SQLite than MySQL
-- refrence https://www.w3resource.com/sqlite/sqlite-strftime.php#:~:text=Example%2D1%3A,Here%20is%20the%20result.&text=Here%20in%20the%20above%20example,current%20date%20in%20text%20format.
SELECT ClientFirstName, ClientLastName, CAST((strftime('%Y', 'now') - ClientDob) as INTEGER) as age, Occupation
FROM Client_Table;

-- output
"ClientFirstName ClientLastName age Occupation
Kaiden	Hill	18	Student
Alina	Morton	14	Student
Fania	Brooks	41	Food Scientist
Courtney	Jensen	18	Student
Brittany	Hill	41	Firefighter
Max	Rogers	19	Student
Margaret	McCarthy	43	School Psychologist
Julie	McCarthy	51	Professor
Ken	McCarthy	50	Securities Clerk
Britany	O'Quinn	40	Violinist
Conner	Gardner	26	Licensed Massage Therapist
Mya	Austin	64	Parquet Floor Layer
Thierry	Rogers	20	Student
Eloise	Rogers	40	Computer Security Manager
Gerard	Jackson	45	Oil Exploration Engineer
Randy	Day	38	Aircraft Electrician
Jodie	Page	34	Manufacturing Director
Coral	Rice	28	Window Washer
Ayman	Austin	22	Student
Jaxson	Austin	25	Repair Worker
Joel	Austin	51	Police Officer
Alina	Austin	14	Student
Elin	Austin	62	Payroll Clerk
Ophelia	Wolf	20	Student
Eliot	McGuire	57	Dentist
Peter	McKinney	56	Professor
Annabella	Henry	50	Nurse
Anastasia	Baker	23	Student
Tyler	Baker	40	Police Officer
Lilian	Ross	41	Insurance Agent
Thierry	Arnold	49	Bus Driver
Angelina	Rowe	45	Firefighter
Marcia	Rowe	50	Health Educator
Martin	Rowe	48	Ship Engineer
Adeline	Rowe	19	Student
Colette	Rowe	61	Professor
Diane	Clark	49	Payroll Clerk
Caroline	Clark	64	Dentist
Dalton	Clayton	42	Police Officer
Steve	Clayton	34	Bus Driver
Melanie	Clayton	37	Computer Engineer
Alana	Wilson	17	Student
Carson	Byrne	29	Food Scientist
Conrad	Byrne	17	Student
Ryan	Porter	16	Student
Elin	Porter	46	Computer Programmer
Tyler	Harvey	17	Student
Arya	Harvey	16	Student
Serena	Harvey	46	School Teacher
Lilly	Franklin	48	Doctor
Mai	Franklin	30	Dentist
John	Franklin	25	Firefighter
Judy	Franklin	29	Firefighter
Katy	Lloyd	32	School Teacher
Tamara	Allen	61	Ship Engineer
Maxim	Lyons	39	Police Officer
Allan	Lyons	41	Computer Engineer
Marc	Harris	44	School Teacher
Elin	Young	15	Student
Diana	Young	16	Student
Diane	Young	18	Student
Alana	Bird	21	Student
Anna	Becker	45	Security Agent
Katie	Grant	47	Manager
Joan	Grant	14	Student
Bryan	Bell	23	Student
Belle	Miller	54	Professor
Peggy	Stevens	34	Bus Driver
Steve	Williamson	49	HR Clerk
Tyler	Williamson	25	Doctor
Izabelle	Williamson	34	Systems Analyst
Annabel	Williamson	64	Cashier
Mohamed	Waters	58	Insurance Agent
Marion	Newman	54	Computer Programmer
Ada	Williams	38	Computer Programmer
Sean	Scott	41	Bus Driver
Farrah	Scott	50	Ship Engineer
Christine	Lambert	51	School Teacher
Alysha	Lambert	17	Student
Maia	Grant	40	School Teacher"



-- 3.First and last names of clients that borrowed books in March 2018
SELECT Client_Table.ClientFirstName, Client_Table.ClientLastName
FROM Client_Table
JOIN Borrower_Table ON Client_Table.ClientID = Borrower_Table.ClientID
WHERE Borrower_Table.BorrowDate BETWEEN '2018-03-01' AND '2018-03-31';

-- output
"ClientFirstName	ClientLastName
Maia	Grant
Marcia	Rowe
Alysha	Lambert
Tyler	Baker
Katy	Lloyd
Angelina	Rowe
Gerard	Jackson
Carson	Byrne"


-- 4. First and last names of the top 5 authors clients borrowed in 2017
SELECT Author_Table.AuthorFirstName, Author_Table.AuthorLastName
FROM Author_Table
JOIN Book_Table ON Author_Table.AuthorID = Book_Table.BookAuthor
JOIN Borrower_Table ON Book_Table.BookID = Borrower_Table.BookID
WHERE Borrower_Table.BorrowDate BETWEEN '2017-01-01' AND '2017-12-31'
GROUP BY Author_Table.AuthorID
ORDER BY COUNT(Borrower_Table.BookID) DESC
LIMIT 5;

-- output
"AuthorFirstName	AuthorLastName
Logan	Moore
Elena	Martin
Sofia	Smith
Maria	Brown
Helena	Adams"

-- 5. Nationalities of the least 5 authors that clients borrowed during the years 2015-2017
SELECT Author_Table.AuthorNationality as least_popular_authors_nationality
FROM Author_Table
JOIN Book_Table ON Author_Table.AuthorID = Book_Table.BookAuthor
JOIN Borrower_Table ON Book_Table.BookID = Borrower_Table.BookID
WHERE Borrower_Table.BorrowDate BETWEEN '2015-01-01' AND '2017-12-31'
GROUP BY Author_Table.AuthorID, Author_Table.AuthorNationality
ORDER BY COUNT(Borrower_Table.BookID) ASC
LIMIT 5;



-- note if you want to see the full output, of which authors are the least popular in 2015-2017 in ascending order this should work
-- SELECT Author_Table.AuthorFirstName, Author_Table.AuthorLastName, Author_Table.AuthorNationality as most_popular_author_nationality, COUNT(Borrower_Table.BookID) as borrow_count
-- FROM Author_Table
-- JOIN Book_Table ON Author_Table.AuthorID = Book_Table.BookAuthor
-- JOIN Borrower_Table ON Book_Table.BookID = Borrower_Table.BookID
-- WHERE Borrower_Table.BorrowDate BETWEEN '2015-01-01' AND '2017-12-31'
-- GROUP BY Author_Table.AuthorID, Author_Table.AuthorNationality
-- ORDER BY borrow_count ASC


-- output
"least_popular_authors_nationality
Spain
Canada
USA
USA
Great Britain"



-- 6. The book that was most borrowed during the years 2015-2017
SELECT Book_Table.BookTitle
FROM Book_Table
JOIN Borrower_Table ON Book_Table.BookID = Borrower_Table.BookID
WHERE Borrower_Table.BorrowDate BETWEEN '2015-01-01' AND '2017-12-31'
GROUP BY Book_Table.BookTitle
ORDER BY COUNT(Borrower_Table.BookID) DESC
LIMIT 1;

-- output
"BookTitle
The perfect match"

-- 7. Top borrowed genres for client born in years 1970-1980
SELECT Book_Table.Genre
FROM Book_Table
JOIN Borrower_Table ON Book_Table.BookID = Borrower_Table.BookID
JOIN Client_Table ON Borrower_Table.ClientID = Client_Table.ClientID
WHERE Client_Table.ClientDob BETWEEN '1970' AND '1980'
GROUP BY Book_Table.Genre
ORDER BY COUNT(Borrower_Table.BookID) DESC
LIMIT 10;

-- output
"Genre
Science
Fiction
Well being
Humor
Society
Literature
Law
History
Children
well being"



-- 8. Top 5 occupations that borrowed the most in 2016
SELECT Client_Table.Occupation as Top_Borrowers_Occupation
FROM Client_Table
JOIN Borrower_Table ON Client_Table.ClientID = Borrower_Table.ClientID
WHERE Borrower_Table.BorrowDate BETWEEN '2016-01-01' AND  '2016-12-31'
GROUP BY Client_Table.Occupation
ORDER BY COUNT(Borrower_Table.BookID) DESC
LIMIT 5;

-- output

"Top_Borrowers_Occupation
Student
Bus Driver
Dentist
Computer Programmer
School Teacher"


-- 9. The average number of borrowed books by job title
SELECT Occupation, AVG(number_of_borrowed_books) as average_number_of_borrowed_books
FROM
(SELECT Client_Table.Occupation, COUNT(Borrower_Table.BookID) as number_of_borrowed_books
FROM Client_Table
JOIN Borrower_Table ON Client_Table.ClientID = Borrower_Table.ClientID
GROUP BY Client_Table.ClientID, Client_Table.Occupation) as borrows_per_occupation
GROUP BY Occupation
ORDER BY average_number_of_borrowed_books DESC;

"Occupation	average_number_of_borrowed_books
Nurse	7.0
Computer Security Manager	6.0
Dentist	5.66666666666667
Computer Programmer	5.66666666666667
Oil Exploration Engineer	5.0
Manufacturing Director	5.0
Food Scientist	5.0
Cashier	5.0
Police Officer	4.5
Student	4.42105263157895
Violinist	4.0
Systems Analyst	4.0
Ship Engineer	4.0
Insurance Agent	4.0
HR Clerk	4.0
Doctor	4.0
Bus Driver	4.0
School Teacher	3.6
Professor	3.5
Firefighter	3.25
Repair Worker	3.0
Payroll Clerk	3.0
Manager	3.0
Computer Engineer	3.0
Window Washer	2.0
Security Agent	2.0
Securities Clerk	2.0
School Psychologist	2.0
Parquet Floor Layer	2.0
Licensed Massage Therapist	2.0
Health Educator	2.0
Aircraft Electrician	2.0"



-- 10. Create a VIEW and display the titles that were borrowed by at least 20% of clients.
CREATE VIEW Borrowed_Books_View as
SELECT Book_Table.BookTitle, COUNT(Borrower_Table.BookID) as number_of_times_borrowed
FROM Book_Table
JOIN Borrower_Table ON Book_Table.BookID = Borrower_Table.BookID
GROUP BY Book_Table.BookTitle
HAVING COUNT(Borrower_Table.BookID) >= 0.2 * (SELECT COUNT(ClientID) FROM Client_Table); -- this creates the view. 

-- this will dispaly the output of the view. 
select * from Borrowed_Books_View

-- output
"BookTitle	number_of_times_borrowed
Electrical transformers	18"


-- 11. The top month of borrows in 2017
SELECT 
    CASE strftime('%m', Borrower_Table.BorrowDate)
        WHEN '01' THEN 'January'
        WHEN '02' THEN 'February'
        WHEN '03' THEN 'March'
        WHEN '04' THEN 'April'
        WHEN '05' THEN 'May'
        WHEN '06' THEN 'June'
        WHEN '07' THEN 'July'
        WHEN '08' THEN 'August'
        WHEN '09' THEN 'September'
        WHEN '10' THEN 'October'
        WHEN '11' THEN 'November'
        WHEN '12' THEN 'December'
    END as Most_Popular_Borrow_Month
FROM Borrower_Table
WHERE strftime('%Y', Borrower_Table.BorrowDate) = '2017'
GROUP BY strftime('%m', Borrower_Table.BorrowDate)
ORDER BY COUNT(Borrower_Table.BookID) DESC
LIMIT 1;

-- output
"Most_Popular_Borrow_Month
October"

-- 12. Average number of borrows by age group
-- this query will show the average number of borrows by people of a particular age. And output the average number of borrowed books by age. 
-- Note that this query will be slightly diffrent from what it would be in MYSQL.
SELECT age_group, AVG(number_of_borrows) as average_number_of_borrows
FROM
(SELECT CAST((strftime('%Y', 'now') - ClientDob) AS INTEGER) AS age_group, COUNT(Borrower_Table.BookID) as number_of_borrows
FROM Client_Table
JOIN Borrower_Table ON Client_Table.ClientID = Borrower_Table.ClientID
GROUP BY Client_Table.ClientID) as borrows_per_age
GROUP BY age_group;

-- output
"age_group	average_number_of_borrows
14	2.33333333333333
16	6.0
17	5.0
18	5.5
19	4.5
20	3.0
21	5.0
22	2.0
23	4.5
25	3.66666666666667
26	2.0
28	2.0
29	4.5
30	10.0
32	3.0
34	5.5
37	2.0
38	3.0
39	4.0
40	5.5
41	3.75
42	3.0
43	2.0
44	1.0
45	4.33333333333333
46	5.5
47	3.0
48	3.5
49	2.66666666666667
50	3.25
51	3.66666666666667
54	4.5
56	4.0
57	3.0
58	1.0
61	5.0
62	3.0
64	3.66666666666667"




-- 13. The oldest and the youngest clients of the library
-- subquery to find the oldest and youngest clients by subtracting the current year from the clients date of birth and then selecting the minimum and maximum.
-- If there is a tie it will show all of those results.
-- Note that this query will be slightly diffrent from what it would be in MYSQL.
SELECT ClientFirstName, ClientLastName, CAST((strftime('%Y', 'now') - ClientDob) AS INTEGER) AS age
FROM Client_Table
WHERE age = (SELECT MIN(CAST((strftime('%Y', 'now') - ClientDob) AS INTEGER)) FROM Client_Table)
   OR age = (SELECT MAX(CAST((strftime('%Y', 'now') - ClientDob) AS INTEGER)) FROM Client_Table)
ORDER BY age DESC;

-- output
"ClientFirstName	ClientLastName	age
Mya	Austin	64
Caroline	Clark	64
Annabel	Williamson	64
Alina	Morton	14
Alina	Austin	14
Joan	Grant	14"


-- 14. First and last names of authors that wrote books in more than one genre:
SELECT Author_Table.AuthorFirstName, Author_Table.AuthorLastName, COUNT(Book_table.Genre) as number_of_genres_written
FROM Author_Table
JOIN Book_Table ON Author_Table.AuthorID = Book_Table.BookAuthor
GROUP BY Author_Table.AuthorID,Author_Table.AuthorFirstName, Author_Table.AuthorLastName
HAVING COUNT(Book_Table.Genre) > 1
ORDER BY number_of_genres_written DESC;

-- output
"AuthorFirstName	AuthorLastName	number_of_genres_written
Sofia	Smith	4
Helena	Adams	3
Maria	Brown	2
Elena	Martin	2
Oliver	Martin	2
Liam	Parker	2"