create database OrderProccessing;
use OrderProccessing;
create table customer(cust_no int,
cname varchar(50),
city varchar(50),
primary key(cust_no)
 );
 
 create table order_details(order_no int,
 odate date,
 cust_no int,
 ord_amt int,
 foreign key(cust_no) references customer(cust_no) on delete cascade,
 primary key(order_no)
 );
  create table item(item_no int,
  unit_price int,
  primary key(item_no)
  );
  
  create table order_item(
  order_no int,
  item_no int,
  qty int,
  foreign key(item_no) references item(item_no) on delete set null,
  foreign key(order_no) references order_details(order_no) on delete set null
  );
  
  create table warehouse(
  warehouse_no int,
  city varchar(50),
  primary key(warehouse_no)
  );
  
  create table shipment(
  order_no int,
  warehouse_no int,
  ship_date date,
  foreign key(order_no) references order_details(order_no) on delete cascade,
  foreign key(warehouse_no) references warehouse(warehouse_no) on delete cascade
  );
 
 insert into customer values (771,'PUSHPA K','BANGALORE');
 insert into customer values (772,'SUMAN','MUMBAI');
 insert into customer values (773,'SOURAV','CALICUT');
 insert into customer values (774,'LAILA','HYDERABAD');
 insert into customer values (775,'FAIZAL','BANGALORE');
 
 insert into  order_details values (111,'2002-01-22',771,18000);
 insert into  order_details values (112,'2002-07-30',774,6000);
 insert into  order_details values (113,'2003-04-03',775,9000);
 insert into  order_details values (114,'2003-11-03',775,29000);
 insert into  order_details values (115,'2003-12-10',773,29000);
 
 insert into item values(5001,503);
 insert into item values(5002,750);
 insert into item values(5003,150);
 insert into item values(5004,600);
 insert into item values(5005,890);
 
insert into order_item values(111,5001,50);
insert into order_item values(112,5003,20);
insert into order_item values(113,5002,50);
insert into order_item values(114,5005,60);
insert into order_item values(115,5004,90);

insert into warehouse values (1,'DELHI');
insert into warehouse values (2,'BOMBAY');
insert into warehouse values (3,'CHENNAI');
insert into warehouse values (4,'BANGALORE');
insert into warehouse values (5,'BANGALORE');

insert into shipment values (111,1,'2002-02-10');
insert into shipment values (112,5,'2002-09-10');
insert into shipment values (113,1,'2004-09-20');
insert into shipment values (114,3,'2003-12-10');
insert into shipment values (112,5,'2004-09-10');


select city,count(*) from order_details o,warehouse w,shipment s where(o.order_no = s.order_no and s.warehouse_no=w.warehouse_no) group by(city);

select cname as 'CUSTNAME', count(*) as '#oforders',avg(ord_amt) from customer c,order_details o where(c.cust_no = o.cust_no) group by(o.cust_no) LIMIT 0, 1000;
delete from item where(item_no=5001);
select * from order_item;
