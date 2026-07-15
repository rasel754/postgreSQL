SELECT * FROM  student;

select country,count(*) as count from student group by country;


select country , avg(age) as average_age from student group by country having avg(age) > 20;