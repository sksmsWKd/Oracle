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









