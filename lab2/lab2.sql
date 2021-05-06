create database BookDealer ;
use BookDealer;
create table Author(
author_id int,
name varchar(30),
city varchar(30),
country varchar(30),
primary key(author_id)
);

create table Publisher(
	publisher_id int,
    name varchar(30),
    city varchar(30),
    Country varchar(30),
    primary key(publisher_id)
    );


create table Category(
category_id int,
description varchar(30),
primary key(category_id)
);

create table Catalog(
	book_id int,
    title varchar(30),
    author_id int,
    publisher_id int,
    category_id int,
    Pyear int,
    price int,
    foreign key(author_id) references Author(author_id) on delete cascade,
    foreign key(publisher_id) references Publisher(publisher_id) on delete cascade,
    foreign key(category_id) references Category(category_id) on delete cascade ,
    primary key(book_id)
);

create table order_details(
	order_no int,
    book_id int,
    quantity int,
    foreign key(book_id) references Catalog(book_id) on delete cascade,
    primary key(order_no)
);

insert into Author values(1001,'TERAS CHAN','CA','USA');
insert into Author values(1002,'STEVENS','ZOMBI','UGANDA');
insert into Author values(1003,'M MANO','CAIR','CANADA');
insert into Author values(1004,'KARTHIK B.P.','New York','USA');
insert into Author values(1005,'WILLIAM STALLINGS','Las Vegas','USA');


insert into Publisher values(1,'PEARSON','NEW YORK','USA');
insert into Publisher values(2,'EEE','NEW SOUTH VALES','USA');
insert into Publisher values(3,'PHI','DELHI','INDIA');
insert into Publisher values(4,'WILEY','BERLIN','GERMANY');
insert into Publisher values(5,'MGH','NEW YORK','USA');

insert into Category values(1001,'COMPUTER SCIENCE');
insert into Category values(1002,'ALGORITHM DESIGN');
insert into Category values(1003,'ELECTRONICS');
insert into Category values(1004,'PROGRAMMING');
insert into Category values(1005,'OPERATING SYSTEMS');

insert into Catalog values (11,'Unix System Prg',1001,1,1001,2000,251);
insert into Catalog values (12,'Digital Signals',1002,2,1003,2001,425);
insert into Catalog values (13,'Logic Design',1003,3,1002,1999,225);
insert into Catalog values (14,'Server Prg',1004,4,1004,2001,333);
insert into Catalog values (15,'Linux OS',1005,5,1005,2003,326);
insert into Catalog values (16,'C++ Bible',1005,5,1005,2000,526);
insert into Catalog values (17,'COBOL Handbook',1005,4,1005,2000,658);
insert into Catalog values (17,'CS FUNDAMENTALS',1005,4,1005,2001,618);
insert into Catalog values (17,'PYTHON',1005,4,1005,2002,758);

insert into order_details values (1,11,5);
insert into order_details values (2,12,8);
insert into order_details values (3,13,13);
insert into order_details values (4,14,22);
insert into order_details values (5,15,3);

select name,a.author_id,city,country,count(*) from Author a, Catalog c where(a.author_id = c.author_id and c.Pyear>=2000) group by(c.author_id) having (count(*) >2);

