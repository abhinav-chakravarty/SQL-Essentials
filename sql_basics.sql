/*
Introduction to SQL -
SQl (Structured Qurey Language) is a language designed to allow both technical and non-technical users query, manipulate and transform data from a relational database. Due to its simplicity, SQL databases provide safe and scalable storage for millions of websites and mobile applications
*/

/*
What is Database -
A relational database is atype of database that organizes data into tables with rows and columns. It is called "relational" because it establish relationships between these tables based on common data elements.
*/

 -- create table 
create table Students(
  reg_id int,
  name varchar(255),
  city varchar(255),
  marks int,
  grade varchar(255)
);

-- inserting values 
insert into Students (reg_id, name, city, marks, grade) values (201, "Shivam", "Delhi", 89, "B");
insert into Students (reg_id, name, city, marks, grade) values (202, "Ishita", "Hyderabad", 91, "A");
insert into Students (reg_id, name, city, marks, grade) values (203, "Shyam", "Mumbai", 89, "B");
insert into Students (reg_id, name, city, marks, grade) values (204, "Raju", "Pune", 71, "C");
insert into Students (reg_id, name, city, marks, grade) values (205, "Shivani", "Delhi", 98, "A");

-- display table
select * from Students;

-- where clause
select * from Students where name = "Shyam";

-- AND operator
select * from Students where name = "Raju" and city = 'Pune';

-- OR operator
select * from Students where name = "Shivani" or city = "Delhi";

-- BETWEEN operator
select * from Students where marks between 70 and 90;

-- IN operator
select * from Students where city in ("Mumbai","Pune");

-- order by
select name, marks from Students order by marks;
select name, marks from Students order by marks desc;

-- distinct
select distinct(city) from Students;

-- delete
delete from Students where grade = "C";
select * from Students;

-- aggregate function 
-- avg(), count(), lcase(), max(), min(), sum(), round(), substring(), ucase(), replace()
select avg(marks) from Students;
select count(name) from Students;
select max(marks) from Students;

create table orders(
  id int,
  p_name varchar(255),
  item varchar(255),
  price int
);

insert into orders (id, p_name, item, price) values (101, "Shivam", "Earbuds", 890);
insert into orders (id, p_name, item, price) values (201, "Saket", "Mobile", 8190);
insert into orders (id, p_name, item, price) values (301, "Vivek", "Shampoo", 900);
insert into orders (id, p_name, item, price) values (401, "Mia", "Cucumbar", 90);
insert into orders (id, p_name, item, price) values (501, "John", "Earbuds", 1890);
insert into orders (id, p_name, item, price) values (601, "Sanjay", "Trimmer", 1900);
insert into orders (id, p_name, item, price) values (701, "Vivek", "Trimmer", 1900);

-- group by
select p_name, sum(price) from orders group by p_name;

-- having clause
select p_name, sum(price) from orders group by p_name having sum(price)>2000;

-- alter
alter table orders add city varchar(255);
select * from orders;
alter table orders drop column city;
select * from orders;
-- alter table orders modify column price decimal;
-- select * from orders;

-- truncate 
truncate table Students;
select * from Students;

-- drop
drop table Students;

-- update
update orders
set price = 1600
where id = 101;
select * from orders;


-- constraint
create table info(
  id int not null unique,
  name varchar(255),
  location varchar(255),
  age int, check(age >= 20)
);

insert into info (id, name, location, age) values (101, "Shivam", "Mumbai", 21);


drop table info;

-- primary key
create table info(
  id int primary key,
  name varchar(255),
  location varchar(255),
  age int, check(age >= 20)
);

insert into info (id, name, location, age) values (101, "Shivam", "Mumbai", 21);
insert into info (id, name, location, age) values (111, "Manas", "Pune", 24);

create table details(
  dept varchar(255),
  salary int,
  id int,
  foreign key(id) references info(id)
);


-- inner join
create table customers(
  id int,
  name varchar(255),
  location varchar(255)
);

insert into customers (id, name, location) values (23, 'Aanchal', 'Mumbai');
insert into customers (id, name, location) values (21, 'John', 'Pune');
insert into customers (id, name, location) values (91, 'Roy', 'Ambala');
insert into customers (id, name, location) values (89, 'Sumit', 'Goa');

create table products(
  id int,
  pid int,
  pname varchar(255),
  price int
);

insert into products (id, pid, pname, price) values (23,12001 ,'Airpods', 1400);
insert into products (id, pid, pname, price) values (23,15201 ,'Iphone', 74000);
insert into products (id, pid, pname, price) values (21, 21001 ,'Airpods', 1400);
insert into products (id, pid, pname, price) values (1, 19001 ,'Watch', 3400);
insert into products (id, pid, pname, price) values (8, 12051 ,'Airpods', 5400);

select customers.id, customers.name, products.pname, products.price from customers inner join products on customers.id = products.id;

-- left join
select customers.id, customers.name, products.pname, products.price from customers left join products on customers.id = products.id;

-- right join
select customers.id, customers.name, products.pname, products.price from customers right join products on customers.id = products.id;

-- window function
select pname, max(price) as max_price from products group by pname;
select p.*, max(price) over(partition by pname) as max_price from products p;
select p.*, rank() over(partition by pname order by price desc) as max_price from products p;
