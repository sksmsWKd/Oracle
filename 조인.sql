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
decode(grouping(dept_id),1 , 'cube�� ���ؼ� �λ���',0,'���� �ΰ�������') as ����,
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
//using �� ����� ���� ��������� ���� ����

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
// equi ���� - ���� �ٸ����� = 
// non equi join ���� ������ �ƴϰ� ũ�ų� �۰ų� ,,
// ex. between 

select d.dept_id, d.dept_name,d.loc_id, l.city
from y_dept d join y_loc l
on ( d.loc_id = l.loc_id);

select emp_id , emp_name , dept_id , dept_name
from y_emp join y_dept
using (dept_id);
// �̶������� ������ inner join(null ������ ������ ����� null ������ʿ�
//null �������� ����� ��� x

select distinct e.emp_name , e.dept_id , d.dept_name
from y_emp e left outer join y_dept d
on (e.dept_id = d.dept_id);
//left ���� outer(����)�� �� ��ȯ