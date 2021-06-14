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
                          