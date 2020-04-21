

create table public.organization as
select 1 as id_org, 'АО Тинькофф Банк' as name_org
union
select 2, 'X5 Retail Group'
union
select 3, 'АО Ромашка'
;


create table public.teacher (id_teach, last_name, first_name, birth_date, salary_amt, id_org) as
select 1, 'Роздухова', 'Нина', '1992-04-15', 15000.00, 1,
union
select 2, 'Меркурьева', 'Надежда', '1995-03-12', 25000.00, 1
union
select 3, 'Халяпов', 'Александр', '1994-09-30', 17000.00, 2
union
select 4, 'Иванов', 'Иван', NULL, 100000.00, 3
union
select 5, 'Петров', 'Петр', NULL, 3000.00, 3
;

create
view teacher_cpy
as select * from teacher;

select * from teacher_cpy;

create
view teachers_in_organizations
as select *
from teacher
where id_org is not null;

select * from teachers_in_organizations;

create
view teachers_full
as
select id_teach, last_name, first_name, birth_date, salary_amt, name_org
from teacher, organization
where teacher.id_org = organization.id_org ;

select * from teachers_full;

create or replace
view teachers_with_concatinated_full_nms
as
select id_teach,
       concat(last_name, ' ', first_name) as "Фамилия Имя",
       birth_date                         as "Дата рождения",
       salary_amt,
       name_org                           as "Название организации"
from teacher, organization
where teacher.id_org = organization.id_org ;

select * from teachers_with_concatinated_full_nms;

insert into teacher_cpy
values
       (6, 'Житлухин', NULL, NULL, 20000, 3);

select * from teacher;

delete from teacher_cpy
where id_teach = 6;

update teacher_cpy
set birth_date = '1993-02-07'
where id_teach = 4;

update teachers_in_organizations
set id_org = NULL
where id_teach = 4;