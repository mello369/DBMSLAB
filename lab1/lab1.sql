create database Insurance;
use Insurance;
create table PERSON(
driver_id varchar(10),
name varchar(30),
address varchar(50),
Primary key(driver_id)
);
create table CAR(
Regno varchar(30),
model varchar(30),
manu_year int,
PRIMARY KEY(Regno)
);
create table ACCIDENT
(
report_number int,
acc_date date,
location varchar(30),
PRIMARY KEY(report_number)
);
create table OWNS(
driver_id varchar(10),
Regno varchar(30),
FOREIGN KEY(driver_id) REFERENCES PERSON(driver_id) on delete cascade,
FOREIGN KEY(Regno) REFERENCES CAR(Regno) on delete cascade,
PRIMARY KEY(driver_id,Regno)
);
create table PARTICIPATED(
driver_id varchar(10),
Regno varchar(30),
report_number int,
damage_amount int,
FOREIGN KEY(driver_id) REFERENCES PERSON(driver_id) on delete cascade ,
FOREIGN KEY(Regno) REFERENCES CAR(Regno) on delete cascade,
FOREIGN KEY (report_number) REFERENCES ACCIDENT(report_number) on delete cascade,
PRIMARY KEY(driver_id,Regno,report_number)
);

insert into PERSON values ('1111','Ramesh','K.S.LAYOUT');
insert into PERSON values ('2222','JOHN','INDIRANAGAR');
insert into PERSON values ('3333','PRIYA','JAYANAGAR');
insert into PERSON values ('4444','GOPAL','WHITEFIELD');
insert into PERSON values ('5555','LATHA','VIJAYANAGAR');

insert into CAR values ('KA04Q2301','MARUTHI-DX',2000);
insert into CAR values ('KA04Q2302','FORD',2000);
insert into CAR values ('KA04Q2303','JEEP',2000);
insert into CAR values ('KA04Q2304','HYUNDAI',2000);
insert into CAR values ('KA04Q2305','TESLA',2000);

insert into ACCIDENT values(1,'2008-05-19','bangalore');
insert into ACCIDENT values(2,'2008-01-29','bangalore');
insert into ACCIDENT values(3,'2008-09-22','delhi');
insert into ACCIDENT values(4,'2016-05-19','mumbai');
insert into ACCIDENT values(5,'2012-05-19','mumbai');

insert into OWNS values ('1111','KA04Q2301');
insert into OWNS values ('2222','KA04Q2302');
insert into OWNS values ('1111','KA04Q2303');
insert into OWNS values ('5555','KA04Q2304');
insert into OWNS values ('4444','KA04Q2305');

insert into PARTICIPATED values('1111','KA04Q2301',1,20000);
insert into PARTICIPATED values('2222','KA04Q2302',2,50000);
insert into PARTICIPATED values('1111','KA04Q2303',3,1000);
insert into PARTICIPATED values('4444','KA04Q2305',4,12000);
insert into PARTICIPATED values('5555','KA04Q2304',5,15000);

update PARTICIPATED 
set damage_amount=100000
where report_number=3 AND REGNO = 'KA04Q2303';

select count(*) from ACCIDENT
where acc_date like '2016%';

SELECT COUNT(distinct A.REPORT_NUMBER)
FROM ACCIDENT A, PARTICIPATED P, CAR C
WHERE A.REPORT_NUMBER=P.REPORT_NUMBER
AND
P.REGNO=C.REGNO
AND
C.MODEL='MARUTHI-DX';


