create database movie;
use movie;
create table actor(
act_id int,
act_name varchar(30),
act_gender varchar(10),
primary key(act_id)
);
create table director(
dir_id int,
dir_name varchar(30),
dir_phone varchar(10),
primary key(dir_id)
);
create table movie(
mov_id int,
mov_title varchar(30),
mov_year year,
mov_lang varchar(30),
dir_id int,
primary key(mov_id),
foreign key(dir_id) references director(dir_id) on delete set null
);
create table movie_cast(
act_id int,
mov_id int,
act_role varchar(30),
foreign key(act_id) references actor(act_id),
foreign key(mov_id)references movie(mov_id)
);
create table rating(
mov_id int,
stars int,
foreign key(mov_id) references movie(mov_id)
);


insert into actor values(1,'Anthony','male');
insert into actor values(2,'Janet','female');
insert into actor values(3,'Cary','male');
insert into actor values(4,'Grace','female');
insert into actor values(5,'DiCaprio','male');
insert into actor values(6,'Tom','male');

insert into director values(1,'Hitchcock','1100010101');
insert into director values(2,'Nolan','1234567890');
insert into director values(3,'Martin','9999221');
insert into director values(4,'Steven','3456372');



insert into movie values(1,'psycho',1960,'english',1);
insert into movie values(2,'To Catch a Thief',1955,'english',1);
insert into movie values(3,'Inception',2010,'english',2);
insert into movie values(4,'Shutter Island',2010,'english',3);
insert into movie values(5,'War of the worlds',2005,'english',4);
insert into movie values(6,'The Birds',1965,'english',1);

insert into movie_cast values(1,1,'lead actor');
insert into movie_cast values(2,1,'lead actress');
insert into movie_cast values(3,2,'lead actor');
insert into movie_cast values(4,2,'lead actress');
insert into movie_cast values(5,3,'lead actor');
insert into movie_cast values(5,4,'lead actor');
insert into movie_cast values(6,5,'lead actor');


insert into rating values(1,9);
insert into rating values(2,7);
insert into rating values(3,9);
insert into rating values(4,7);
insert into rating values(5,6);

SELECT mov_title FROM movie m,director d WHERE m.dir_id = d.dir_id AND d.dir_name = 'Hitchcock'; 
UPDATE rating r ,director d,movie m SET r.stars = 5 WHERE r.mov_id = m.mov_id AND m.dir_id = d.dir_id AND dir_name = 'Nolan';
SELECT * FROM rating;

SELECT mov_title 
FROM movie 
WHERE mov_id IN (SELECT mov_id FROM movie_cast WHERE act_id IN (SELECT act_id FROM actor WHERE act_id IN (SELECT act_id FROM movie_cast GROUP BY act_id HAVING COUNT(act_id)>1)));

SELECT act_name, mov_title, mov_year
FROM actor
JOIN movie_cast 
ON actor.act_id=movie_cast.act_id
JOIN movie 
ON movie_cast.mov_id=movie.mov_id
WHERE mov_year NOT BETWEEN 2000 and 2015;

SELECT mov_title, MAX(stars)
FROM movie
INNER JOIN rating USING(mov_id)
GROUP BY mov_title 
HAVING MAX(stars)>0
ORDER BY mov_title;

