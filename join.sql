-- Active: 1782894386476@@127.0.0.1@5432@my_database
create table "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE
);


SELECT * FROM "user";

select * from post;

select title , username from post join "user" on post.userid = "user".id; 
select * from post join "user" on post.userid = "user".id; 
select * from post inner join "user" on post.userid = "user".id; 

-- write a left join query 
select * from post left join "user" on post.userid = "user".id; 

-- write a right join query
select * from post right join "user" on post.userid = "user".id;

-- write a full join query
select * from post full join "user" on post.userid = "user".id;

-- write a cross join query
select * from post cross join "user";

INSERT into post (id , title , userid) VALUES 
(1, 'My First Post', NULL),
(2, 'My Second Post', NULL),
(3, 'My Third Post', 2);