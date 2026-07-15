show timezone;

create table TimeZone ( timeStampWithoutTimeZone timestamp without time zone ,timeStampWithTimeZone timestamp with time zone ); 

insert into TimeZone values ('2024-06-01 12:00:00', '2024-06-01 12:00:00');

select * from TimeZone;

select CURRENT_DATE;

select now ()::date;
select now ()::time;


-- all data format
select to_char(now(), 'YYYY-MM-DD HH24:MI:SS');
