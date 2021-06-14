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