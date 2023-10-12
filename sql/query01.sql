insert into code values ('100', '지역');

insert into code values ('200', '업종');

insert into code values ('300', '직무');

select * from code;

commit;

show parameter processes;

drop table detail_code;


SELECT * FROM USER_SYS_PRIVS;

select * from detail_code
where group_code = 200;

select * from code;

select * from detail_code
where detail_name='디자인';

delete from detail_code
where group_code=200;

commit;