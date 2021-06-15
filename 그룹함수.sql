select dept_id, position, sum(salary)
from y_emp
group by dept_id, position;

select position, sum(salary)
from y_emp
group by position;

select dept_id, position, sum(salary)
from y_emp
group by dept_id, position
order by dept_id;
//order by 는 마지막 , having 은 group by 뒤

select dept_id,max(count(*)),min(count(*))
from y_emp
group by dept_id;
//중첩시에는 group by 에 그룹함수아닌거 적어도 불가능

select dept_id, position, sum(salary)
from y_emp
group by rollup (dept_id, position);

select dept_id, position, sum(salary)
from y_emp
group by cube (dept_id, position);

select dept_id, position  ,  count(*)
from y_emp
group by grouping sets ((dept_id,position),());

select dept_id,position,sum(salary),
grouping(dept_id) d,
grouping(position) g
from y_emp
group by cube (dept_id,position);

select emp_name,dept_name
from y_emp cross join y_dept;

desc y_emp;

select e.emp_id, e.emp_name , dept_id, d.dept_name
from y_emp e join y_dept d
using (dept_id);

select dept_id , position ,sum(salary)
from y_emp
where dept_id>200
group by rollup (dept_id, position);
//ROLLUP (a, b, c) : (a, b, c) / (a, b) / (a) / ()
//CUBE (a, b, c) : (a, b, c) / (a, b) / (a, c) / (b, c) / (a) / (b) / (c) / ()
//GROUPING SETS(a, b, c) : (a) / (b) / (c)


select dept_id, position , sum(salary),
decode(grouping(dept_id),1 , 'cube에 의해서 널생성',0,'원래 널값이있음') as 유무,
grouping(dept_id)
from y_emp
where dept_id is null
group by cube(dept_id,position);

select dept_id, gender , position , sum(salary)
from y_emp
group by rollup(dept_id , (gender,position));

select e.emp_name, d.dept_name
from y_emp e natural join y_dept d;

select *
from y_emp;

select dept_name
from y_dept;

select e.emp_name, d.dept_name
from y_emp e natural join y_dept d
where dept_id in(100,200);

select emp_id , emp_name , dept_id, dept_name
from y_emp join y_dept
using(dept_id);

select mgr_id
from y_emp;


select emp_id , emp_name , dept_id, dept_name, e.mgr_id
from y_emp e join y_dept
using(dept_id);
//using 에 사용할 열을 명시적으로 지정 가능

select d.dept_id, d.dept_name , d.loc_id, l.city
from y_dept d join y_loc l
on (d.loc_id = l.loc_id);

select emp_name , city , dept_name
from y_emp e 
join y_dept d
on d.dept_id = e.dept_id
join y_loc l
on d.loc_id = l.loc_id;

select e.emp_id, e.emp_name , e.salary , p.pay_level
from y_emp e join pay_grade p
on e.salary between p.low_pay and p.high_pay;


select salary
from y_emp;
// equi 조인 - 서로 다른조건 = 
// non equi join 같은 조건이 아니고 크거나 작거나 ,,
// ex. between 

select d.dept_id, d.dept_name,d.loc_id, l.city
from y_dept d join y_loc l
on ( d.loc_id = l.loc_id);

select emp_id , emp_name , dept_id , dept_name
from y_emp join y_dept
using (dept_id);
// 이때까지의 조인은 inner join(null 포함한 연산은 결과가 null 어느한쪽에
//null 이있으면 결과에 출력 x

select distinct e.emp_name , e.dept_id , d.dept_name
from y_emp e left outer join y_dept d
on (e.dept_id = d.dept_id);
//left 에서 outer(누락)된 행 반환

select e.emp_id , e.emp_name,
        e.dept_id ,  y.loc_id
from y_emp e , y_dept y
where e.dept_id = y.dept_id
and e.dept_id between 100 and 300;

select e.emp_id , e.emp_name,
        d.dept_id , d.loc_id
from y_emp e, y_dept d
where e.dept_id = d.dept_id
and e.dept_id between 100 and 300;

select e.emp_id, e.emp_name , e.dept_id, d.dept_name
from y_emp e , y_dept d
where e.dept_id(+) = d.dept_id;
//oracle 표준 구문에서는 sql 구문의 outer join 과는 다르게 + 를 붙임
//조인 방식도 on이 아닌 where 절에 지정.

SELECT emp_name , dept_name
FROM y_emp , y_dept;
//오라클 전용구문에서의 카티션프로덕트
//sql 표준구문의 cross join 과 같다

select salary 
from y_emp
where salary > (select salary from y_emp
                      where emp_name = '오상우');

select emp_name , position
from y_emp
where position = (select position
                        from y_emp
                        where emp_id = 1049);
//단일행 서브쿼리

select emp_name , position,salary
from y_emp
where position  =(select position
                    from y_emp
                    where emp_id = 1044)
                    and salary >  (select salary
                    from y_emp
                    where emp_id = 1050);
                    
select position , (round(avg(salary),0))*1000 as Monthly
from y_emp
group by position
having  avg(salary) = (select min(avg(salary))
                                    from y_emp
                                   group by position);
                                   
select emp_id, emp_name,dept_id,salary
from y_emp
where salary in (select min(salary)
                      from y_emp
                      group by dept_id);
//다중행서브쿼리                      
                      
select emp_id, emp_name , salary,position,dept_id
from y_emp
where dept_id = 400
order by salary;

select emp_name , dept_id , salary
from y_emp
where salary in (select max(salary)
                      from y_emp
                      where dept_id <= 200
                     group by dept_id);
                     //다중 행 서브쿼리, <=  >=

select max(salary)
from y_emp
 where dept_id <= 200
group by dept_id;

select emp_id ,emp_name , position ,salary
from y_emp
where salary < any (select salary 
                                                    from y_emp
                                                    where position = '대리'  )
                                                    and position <>'대리';
                                                    
select emp_name
from y_emp
where emp_id  =any (select emp_id
                        from y_emp);
                        
select emp_id, emp_name , position , dept_id
from y_emp
where (position , dept_id)In (select position , dept_id from y_emp
                                      where emp_name like '차%')
                                      and emp_name not like '차%';
                                      
select emp_id , emp_name , position , dept_id
from y_emp o
where not exists (select 'x' from y_emp
                              where mgr_id = o.emp_id);
                              
select rownum as rank , emp_name  ,hiredate
from (select hiredate , emp_name
        from y_emp
        order by hiredate)  
where rownum <=3;

 select hiredate , emp_name
        from y_emp
        order by hiredate  ;

select rownum as rank , emp_name , hiredate
        from  (select hiredate , emp_name
        from y_emp
        order by hiredate  )
where rownum <=3;

select emp_id , emp_name , salary,
                  rank() over(order by salary desc) as sal_rank,
                  dense_rank() over (order by salary desc) as sal_dense_rank
                  from y_emp;
                  
select emp_id, emp_name ,
          (case when dept_id =
                (select dept_id from y_dept
                where loc_id = 4)
                then'대구' else '기타' end) loc_name
                from y_emp;

select emp_id , emp_name
from y_emp e
llorder by (select dept_name from y_dept d
where e.dept_id = d.dept_id);

select emp_id
from y_emp
union all
select emp_id
from y_award
where emp_id = 100;

select emp_id , emp_name , position, mgr_id
from y_emp
start with emp_id = 1001
connect by prior emp_id = mgr_id;

--start with 에 처음 시작할 노드의 조건
--connect by  ->> prior 가 부모열 앞에 쓰이는지 자식열앞에 쓰이는지가 중요
-- prior뒤에오는 열이 부모열이면 top-down 자식열이면 button-up

select emp_id , emp_name, position , mgr_id
from y_emp
start with emp_id = 1019
connect by prior emp_id = mgr_id;
//top - bottum 형식

select emp_id, emp_name ,position , mgr_id
from y_emp
start with emp_id = (select max(emp_id) from y_emp)
connect by prior mgr_id  = emp_id;
//가장 말단 직원을 찾는 sql문

select emp_id
from y_emp
order by emp_id desc;




select emp_id, emp_name, sys_connect_by_path(emp_id,'/') path ,level, rank() over (order by level) as level
FROM y_emp
start with emp_id=1001
connect by prior emp_id = mgr_id
order by level;
//top - down 검색중의 경로

select emp_id , emp_name , mgr_id , level
from y_emp
start with emp_id = 1001
connect by prior emp_id =mgr_id
order by level;

select emp_id , emp_name , mgr_id , lpad(level,level*2,'**'),
lpad(emp_id , length(emp_id)+(level*2)-2 , '-') as chart
from y_emp
where emp_id <>1044
start with emp_id = 1035
connect by prior emp_id = mgr_id
order by level;
//특정 분기 제거


select emp_id , emp_name , mgr_id , lpad(level,level*2,'**'),
lpad(emp_id , length(emp_id)+(level*2)-2 , '-') as chart
from y_emp
start with emp_id = 1035
connect by prior emp_id = mgr_id
and emp_id <> 1044
order by level;
//분기 전체 제거

insert into y_dept(dept_id , dept_name , mgr_id , loc_id)
values (600,'생산관리' , 1038 ,6);

select dept_name  , loc_id
from y_dept
where dept_id = 600;

insert into y_emp (emp_id , emp_name , hiredate)
values(2008 , '윤현민', to_date('99/11/22' , 'yy-mm--dd'));

insert into emp300 (select emp_id , emp_name , salary , dept_id
                          from y_emp
                          where dept_id = 300);
                     
update emp300
set dept_id = 400
where emp_id = 1037;

select *
from y_emp
where emp_id = 1038;

delete from emp300
where emp_id = 1109;

select * from dept300;

create table dept300
as select emp_id , emp_name , salary*12 annsal , hiredate
from y_emp
where dept_id  =200;

create table new1(
a1 number(5) primary key,
a2 varchar(10) 
);

insert into new1 (a1,a2) values(1000,'데이터');
insert into new1 values(10000,'데이터2');

desc new1;

select * from new1;

alter table new1
add (a4 number(5) default 123);

alter table new1
modify (a1 number(10) default 123123);

insert into new1 (a2,a3)values('데이터3', 0 );

alter table new1
rename column a1 to a0;

alter table new1
drop column a0;

alter table new1 read write;

drop table new1;

flashback table new1 to before drop;

select * from new1;

rename new1 to new00;

select * from new00;

alter table new00
add (a5 number(5));

alter table new00
add (a7 number(5)unique);

desc new00;

create table table1
(col1 number(5) constraint table1_col1_pk primary key,
col2 number(5)
);
//제약조건 추가.

create table table2
(col1 number(5) , col2 number(5));


create table table3
(col1 number(5) , col2 number(5),
constraint table3_col1_pk primary key(col1),
constraint table3_col2_uq unique(col2) );

select constraint_name , constraint_type
from user_constraints
where table_name = 'TABLE1';

alter table table1
add constraint table_col2_uk unique(col2);

alter table table1
add (colm1 number(5),
colm2 number(5));

alter table table1
add constraint table1_coll1_fk2 foreign key(colm2)
references table3(col1)
on delete cascade;

insert into table3 (col1) values (1234);
insert into table3 (col) values (1234);


select * from table3;
select * from table1;

alter table table1
add (col3 number(5));


alter table table3
add (col4 number(5));

update table3
set col4 = 123
where col1 = 33;

insert into TABLE1(col1,col3) values (33,33);
insert into TABLE3(col1,col3) values (33,33);

alter table table1
add constraint table1_coll1_f43123 foreign key(col3),
references table3(col1),
on delete restrict;

update table3
set col1 = 0
where col1 = 1234;

select * from table3;

delete from table3
where col1= 33;

select constraint_name , constraint_type
from user_constraints;

alter table table1 
disable constraint table1_coll1_fk;

alter table table1
drop primary key (col1) constraint table1_coll1_fk;

delete table3;

create index idx
on table3 (col3);

drop index idx;

select * from user_indexes;

create or replace force view v2
as (select col1 no1
    from table1);
  
desc v2;

select * from v2;

insert into v2(no1) values(123);
insert into v2(no1) values(345);

insert into table1(col1) values(777);

update table1
set col1 = col1 +100;

select * from table1;

alter table table1
add col4 number(4);

insert into table1(col1 , col4) values(33,444);

alter table table1
add col6 number(4);

create or replace view v3
as  select* from table1;

desc v3;

insert into v3(col1, col6) values(1,111);

select * from v3;
select * from table1;

insert into table1(col1, col6) values(2,111);

commit;

select emp_id, emp_name , level ,lpad(level ,level,  '*') 
from y_emp
start with emp_id = 1001
connect by prior emp_id = mgr_id;

select *
from  user_constraints;

select constraint_name
from user_constraints
where table_name ='Y_EMP';

select * from all_tables;
select * from user_tables;

create table newtable2
(col1 number(5,5) primary key,
col2 varchar(7));

select* from newtable1;

alter table newtable1
add(col3 varchar(10) default 'name' not null);

insert into newtable1(col1,col2,col3) values (0,0,0);

desc newtable2;

select* from newtable2;

insert into newtable2 (col1) values(0.123);

update newtable2
set col2 = '이름'
where col1 = 0.123;

alter table newtable2
add constraint newtable2_col1_ck unique(col2);

create table n1
(col number(3) constraint n1_col_pk primary key);

create table n2
(col number(3),
constraint n2_col primary key(col));

select constraint_name , constraint_type
from user_constraints
where table_name = 'N2';

ALTER TABLE n2
add (col2 number(5));

alter table n2
add constraint n2_unique unique(col2) ;

select *
from n2;

insert into n2(col,col2) values(1,100);

update n2
set col2 = 101
where col = 1;

alter table n2
add (col3 number(5));

update n2
set col3 = nvl2(col3,777 , 444)
where col = 1;

select rownum as rank , emp_id , emp_name , salary
from (select emp_id , emp_name , salary from y_emp
where salary is not null
order by salary desc)
where rownum<= 5;

















































                              

                        


                                                    
























