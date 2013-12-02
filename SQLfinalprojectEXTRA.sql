-- Books --
DROP TABLE IF EXISTS books;
CREATE TABLE books (
  bid  char(4) not null,
  title TEXT,
  author TEXT,
  publisher TEXT,
  description TEXT check (description='fiction' or description='nonfiction'),
  quantity INT not null,
primary key(bid)
);

--Occupation--
DROP TABLE IF EXISTS occupation;
CREATE TABLE occupation (
  oid char(4) not null,
  name TEXT not null,
primary key(oid)
);

--People--
DROP TABLE IF EXISTS people;
CREATE TABLE people (
  pid char(4) not null,
  fname TEXT not null,
  lname TEXT not null,
  dob DATE not null,
  oid char(4) not null references occupation(oid),
primary key(pid)
);



-- Alive Books--
DROP TABLE IF EXISTS aliveBooks;
CREATE TABLE aliveBooks (
  bid char(4) not null references Books(bid),
  action TEXT,
primary key(bid)
);

--Regular Books --
DROP TABLE IF EXISTS regBooks;
CREATE TABLE regBooks (
  bid char(4) not null references Books(bid),
primary key(bid)
);

-- lost Books --
DROP TABLE IF EXISTS lostBooks;
CREATE TABLE lostBooks (
  bid char(4) not null references Books(bid),
  pid char(4) not null references people(pid),
primary key(bid,pid)
);

-- RentedAliveBooks --
DROP TABLE IF EXISTS rentedAliveBooks;
CREATE TABLE rentedAliveBooks (
  hid char(4) not null,
  bid char(4) not null references aliveBooks(bid),
  pid char(4) not null references people(pid),
  dateRented DATE not null,
  dateReturned DATE,
  check (dateRented <= dateReturned),
primary key(hid)
);

-- RentedRegBooks --
DROP TABLE IF EXISTS rentedRegBooks;
CREATE TABLE rentedRegBooks (
  hid char(4) not null,
  bid char(4) not null references regBooks(bid),
  pid char(4) not null references people(pid),
  dateRented DATE not null,
  dateReturned DATE,
  check (dateRented <= dateReturned),
primary key(hid)
);



-- DVDs --
DROP TABLE IF EXISTS dvds;
CREATE TABLE dvds (
  did char(4) not null,
  title TEXT not null,
  director TEXT not null,
  quantity INT not null,
primary key(did)
);

-- Lost Dvds --
DROP TABLE IF EXISTS lostDvds;
CREATE TABLE lostDvds (
  did char(4) not null references dvds(did),
  pid char(4) not null references people(pid),
primary key(did,pid)
);

-- Rented Dvds --
DROP TABLE IF EXISTS rentedDvds;
CREATE TABLE rentedDvds (
  hid char(4) not null,
  did char(4) not null references dvds(did),
  pid char(4) not null references people(pid),
  dateRented DATE not null,
  dateReturned DATE,
  check (dateRented <= dateReturned),
primary key(hid)
);


--DROP ALL TABLES IN ORDER --
DROP TABLE IF EXISTS rentedDvds;
DROP TABLE IF EXISTS lostDvds;
DROP TABLE IF EXISTS dvds;
DROP TABLE IF EXISTS rentedRegBooks;
DROP TABLE IF EXISTS rentedAliveBooks;
DROP TABLE IF EXISTS lostBooks;
DROP TABLE IF EXISTS regBooks;
DROP TABLE IF EXISTS aliveBooks;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS occupation;


--Adding in test data --
--Books--
INSERT INTO Books( bid, title, author, publisher, description, quantity)
  VALUES('b001', 'Wonderful World of Hogwarts', 'Dumbledore','Witch Digest', 'nonfiction', 3);
INSERT INTO Books( bid, title, author, publisher, description, quantity)
  VALUES('b002', 'Dark Arts for all ages', 'Kathy Pinpimple','Magicial Cycle', 'nonfiction', 2);
INSERT INTO Books( bid, title, author, publisher, description, quantity)
  VALUES('b003', 'The Lost Witch', 'Angus McSnuffles','SNAS', 'fiction', 2);
INSERT INTO Books( bid, title, author, publisher, description, quantity)
  VALUES('b004', 'Muggles lost in diagon alley', 'James Matches','Children CO.', 'fiction', 1);
INSERT INTO Books( bid, title, author, publisher, description, quantity)
  VALUES('b005', 'Beginning of Magic', 'Lady Lollipop','Maches Matience', 'nonfiction', 5);

-- Occupation --
INSERT INTO Occupation(oid, name)
  VALUES('o001', 'Student');
INSERT INTO Occupation(oid, name)
  VALUES('o002', 'Professor');
INSERT INTO Occupation(oid, name)
  VALUES('o003', 'Janitor');

--People --
INSERT INTO People(pid,fname,lname,dob,oid)
  VALUES('p001', 'Mark','Mason', '1994-10-15', 'o001');
INSERT INTO People(pid,fname,lname,dob,oid)
  VALUES('p002', 'Jennifer','Stranson', '1995-12-07', 'o001');
INSERT INTO People(pid,fname,lname,dob,oid)
  VALUES('p003', 'Alan','Labouseur', '1990-02-12', 'o002');
INSERT INTO People(pid,fname,lname,dob,oid)
  VALUES('p004', 'Bob','Nisco', '1994-09-17', 'o001');
INSERT INTO People(pid,fname,lname,dob,oid)
  VALUES('p005', 'Kate','Thompson', '1992-02-01', 'o001');
INSERT INTO People(pid,fname,lname,dob,oid)
  VALUES('p006', 'Stephanie','Smith', '1970-09-29', 'o002');
INSERT INTO People(pid,fname,lname,dob,oid)
  VALUES('p007', 'India','Lepoard', '1980-11-02', 'o002');
INSERT INTO People(pid,fname,lname,dob,oid)
  VALUES('p008', 'Jack','James', '1955-01-17', 'o003');

-- Alive Books --
INSERT INTO aliveBooks(bid, action)
  VALUES('b003', 'Flying Witch');
INSERT INTO aliveBooks(bid, action)
  VALUES('b001', 'Animated Pictures');

-- Regular Books --
INSERT INTO regBooks(bid)
  VALUES('b002');
INSERT INTO regBooks(bid)
  VALUES('b004');
INSERT INTO regBooks(bid)
  VALUES('b005');

-- Lost Books --
INSERT INTO lostBooks(bid,pid)
  VALUES('b001','p002');
INSERT INTO lostBooks(bid,pid)
  VALUES('b004','p007');
  
-- Rented Alive Books --
INSERT INTO rentedAliveBooks(hid,bid,pid,dateRented,dateReturned)
  VALUES('h001','b001','p001','2013-09-09','2013-09-16');
INSERT INTO rentedAliveBooks(hid,bid,pid,dateRented)
  VALUES('h002','b001','p002','2013-09-11');
INSERT INTO rentedAliveBooks(hid,bid,pid,dateRented,dateReturned)
  VALUES('h003','b001','p002','2013-10-01','2013-11-10');
INSERT INTO rentedAliveBooks(hid,bid,pid,dateRented,dateReturned)
  VALUES('h004','b003','p006','2013-08-15','2013-08-20');
INSERT INTO rentedAliveBooks(hid,bid,pid,dateRented)
  VALUES('h005','b001','p005','2013-11-25');
INSERT INTO rentedAliveBooks(hid,bid,pid,dateRented)
  VALUES('h006','b003','p007','2013-11-27');
INSERT INTO rentedAliveBooks(hid,bid,pid,dateRented)
  VALUES('h007','b001','p008','2013-11-26');
INSERT INTO rentedAliveBooks(hid,bid,pid,dateRented)
  VALUES('h008','b003','p001','2013-11-25');

-- Rented Regular Books --
INSERT INTO rentedRegBooks(hid,bid,pid,dateRented,dateReturned)
  VALUES('h001','b004','p001','2013-09-01','2013-09-18');
INSERT INTO rentedRegBooks(hid,bid,pid,dateRented)
  VALUES('h002','b004','p007','2013-10-10');
INSERT INTO rentedRegBooks(hid,bid,pid,dateRented,dateReturned)
  VALUES('h003','b005','p004','2013-11-10','2013-11-17');
INSERT INTO rentedRegBooks(hid,bid,pid,dateRented,dateReturned)
  VALUES('h004','b002','p008','2013-11-10', '2013-12-01');
INSERT INTO rentedRegBooks(hid,bid,pid,dateRented,dateReturned)
  VALUES('h005','b004','p007','2013-11-15','2013-12-01');
INSERT INTO rentedRegBooks(hid,bid,pid,dateRented)
  VALUES('h006','b002','p002','2013-11-27');
INSERT INTO rentedRegBooks(hid,bid,pid,dateRented)
  VALUES('h007','b005','p003','2013-11-29');
INSERT INTO rentedRegBooks(hid,bid,pid,dateRented)
  VALUES('h008','b005','p006','2013-12-01');
INSERT INTO rentedRegBooks(hid,bid,pid,dateRented)
  VALUES('h009','b002','p005','2013-11-29');

-- DVDS --
INSERT INTO dvds(did,title,director,quantity)
  VALUES('d001','Magic 101','Corning Corny',1);
INSERT INTO dvds(did,title,director,quantity)
  VALUES('d002','How to Kill in 10 easy steps','Magic Hanson',2);
INSERT INTO dvds(did,title,director,quantity)
  VALUES('d003','The one who shall not be named','Lou Kingston',1);
INSERT INTO dvds(did,title,director,quantity)
  VALUES('d004','Poition that up','Isibell Mickel',1);  

-- Lost Dvds --
INSERT INTO lostDvds(did,pid)
  VALUES('d002','p005');
INSERT INTO lostDvds(did,pid)
  VALUES('d004','p001');

-- Rented Dvds --
INSERT INTO rentedDvds(hid,did,pid,dateRented,dateReturned)
  VALUES('h001','d002','p008','2013-10-09', '2013-10-16');
INSERT INTO rentedDvds(hid,did,pid,dateRented)
  VALUES('h002','d004','p001','2013-10-10');
INSERT INTO rentedDvds(hid,did,pid,dateRented,dateReturned)
  VALUES('h003','d001','p003','2013-11-08', '2013-11-13');
INSERT INTO rentedDvds(hid,did,pid,dateRented,dateReturned)
  VALUES('h004','d002','p005','2013-11-23', '2013-11-29');



-- Test Table Data --
select * from Books;
select * from Occupation;
select * from People;
select * from aliveBooks;
select * from regBooks;
select * from rentedAliveBooks;
select * from rentedRegBooks;
select * from dvds;
select * from lostDvds;
select * from rentedDvds;

-- Create Stored Procedures --
CREATE FUNCTION listAliveBookPeople(bookTitle text)
RETURNS TABLE(People_Fname text, People_lname text, occupation text) AS $$
BEGIN
	RETURN QUERY SElECT p.fname,p.lname,o.name
		     FROM people p,
		          occupation o,
		          books b,
		          rentedAliveBooks rab 
		     WHERE b.title = bookTitle 
		       and o.oid = p.oid
		       and rab.pid = p.pid
		       and rab.bid = b.bid;
END;
$$ LANGUAGE PLPGSQL
SELECT listAliveBookPeople('Wonderful World of Hogwarts')

CREATE FUNCTION listRegularBookPeople(bookTitle text)
RETURNS TABLE(People_Fname text, Student_lname text, occupation text) AS $$
BEGIN
	RETURN QUERY SElECT p.fname,p.lname,o.name
		     FROM people p,
		          occupation o,
		          books b,
		          rentedRegBooks rrb 
		     WHERE b.title = bookTitle 
		       and o.oid = p.oid
		       and rrb.pid = p.pid
		       and rrb.bid = b.bid;
END;
$$ LANGUAGE PLPGSQL
SELECT listRegularBookPeople('Beginning of Magic')

CREATE FUNCTION peopleRegularListBooks(studentFName text, studentLName text)
RETURNS TABLE(BookTitle text, author text) AS $$
BEGIN
	RETURN QUERY SElECT b.title, b.author
		     FROM people p,
		          books b,
		          rentedRegBooks rrb
		     WHERE p.fname = studentFName
		       and p.lname = studentLName
		       and rrb.pid = p.pid
		       and rrb.bid = b.bid;
END;
$$ LANGUAGE PLPGSQL
SELECT peopleRegularListBooks('Bob','Nisco')

CREATE FUNCTION PeopleAliveListBooks(studentFName text, studentLName text)
RETURNS TABLE(BookTitle text, author text) AS $$
BEGIN
	RETURN QUERY SElECT b.title, b.author
		     FROM people p,
		          books b,
		          rentedAliveBooks rab
		     WHERE p.fname = studentFName
		       and p.lname = studentLName
		       and rab.pid = p.pid
		       and rab.bid = b.bid;
END;
$$ LANGUAGE PLPGSQL
SELECT PeopleAliveListBooks('Stephanie','Smith')

CREATE FUNCTION listDVDPeople(dvdTitle text)
RETURNS TABLE(Student_Fname text, Student_lname text, occupation text) AS $$
BEGIN
	RETURN QUERY SElECT p.fname,p.lname,o.name
		     FROM people p,
		          occupation o,
		          dvds d,
		          rentedDvds rd 
		     WHERE d.title = dvdTitle 
		       and o.oid = p.oid
		       and rd.pid = p.pid
		       and d.did = rd.did;
END;
$$ LANGUAGE PLPGSQL
SELECT listDVDPeople('Magic 101')

CREATE FUNCTION peopleDVDList(studentFName text, studentLName text)
RETURNS TABLE(DvdTitle text, director text) AS $$
BEGIN
	RETURN QUERY SElECT d.title, d.director
		     FROM people p,
		          dvds d,
		          rentedDvds rd
		     WHERE p.fname = studentFName
		       and p.lname = studentLName
		       and rd.did = d.did
		       and rd.pid = p.pid;
END;
$$ LANGUAGE PLPGSQL
SELECT peopleDVDList('Jack','James')

-- Create Views --
CREATE VIEW PeopleOccupationReg AS
SELECT distinct p.pid as pid,
       p.fname as First_Name,
       p.lname as Last_Name,
       o.name as Occupation,
       b.title as Book_Title
FROM people p,
     occupation o,
     books b,
     rentedRegBooks rrb
WHERE p.oid = o.oid
  and b.bid = rrb.bid
  and p.pid = rrb.pid
ORDER BY p.lname ASC

DROP VIEW PeopleOccupationReg

SELECT * 
FROM PeopleOccupationReg
WHERE first_name = 'Jack'

CREATE VIEW PeopleOccupationAlive AS
SELECT distinct p.pid as pid,
       p.fname as First_Name,
       p.lname as Last_Name,
       o.name as Occupation,
       b.title as Book_Title
FROM people p,
     occupation o,
     books b,
     rentedAliveBooks rab
WHERE p.oid = o.oid
  and b.bid = rab.bid
  and p.pid = rab.pid
ORDER BY p.lname ASC

SELECT *
FROM PeopleOccupationAlive
WHERE occupation = 'Student'

CREATE VIEW PeopleOccupationDVD AS
SELECT distinct p.pid as pid,
       p.fname as First_Name,
       p.lname as Last_Name,
       o.name as Occupation,
       d.title as DVD_Title
FROM people p,
     occupation o,
     dvds d,
     rentedDvds rd
WHERE p.oid = o.oid
  and p.pid = rd.pid
  and d.did = rd.did
ORDER BY p.lname ASC

SELECT *
FROM PeopleOccupationDVD
WHERE dvd_title = 'How to Kill in 10 easy steps'

--Create Reports --
SELECT p.fname,
       p.lname,
       count(rd.did)
From People p,
     Dvds d,
     rentedDvds rd
WHERE p.pid = rd.pid
  and d.did = rd.did
group by p.fname, p.lname

SELECT p.fname,
       p.lname,
       count(rrb.bid)
From People p,
     books b,
     rentedRegBooks rrb
WHERE p.pid = rrb.pid
  and b.bid = rrb.bid
group by p.fname, p.lname

SELECT p.fname,
       p.lname,
       count(rab.bid)
From People p,
     books b,
     rentedAliveBooks rab
WHERE p.pid = rab.pid
  and b.bid = rab.bid
group by p.fname, p.lname