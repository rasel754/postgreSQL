-- Active: 1782894386476@@127.0.0.1@5432@my_database
create Table person (
    id serial primary key,
    name varchar(100) not null,
    age int not null,
    email varchar(100) unique not null
);


insert into person (name, age, email) values
('Alice', 30, 'alice@example.com'),
('Bob', 25, 'bob@example.com'),
('Charlie', 35, 'charlie@example.com');


select * from person;

alter table person add column address varchar(200) DEFAULT 'N/A' NOT NULL;

insert into person (name, age, email, address) values
('David', 28, 'david@example.com', '789 Oak St'),
('Eve', 32, 'eve@example.com', '101 Pine Ave');


--want to remove the address column
alter table person drop column address;


alter table person rename column age to user_age;


--type change for name column varchar(100) to varchar(150)
alter table person alter column name type varchar(50);


-- add constraint to email column to ensure it is unique
alter table person add constraint unique_email unique (email);

-- drop constraint unique_email;
alter table person drop constraint unique_email;



select * from student;

insert into student (name) values
('Frank'),
('Grace'),
('Heidi');

truncate table student;