select sum(comm) , trunselect sum(comm) , trunc(avg(comm),1)
  from y_emp;
select sum(comm) , trunc(avg(comm),1)
from y_emp;

select count(*)
from y_emp;

select count(distinct dept_id)
from y_emp;

select round(avg(nvl(salary,0)),0)
from y_emp
where dept_id = 100;

select dept_id, sum(salary), avg(salary)
from y_emp
group by dept_id
order by dept_id;

select sum(salary), avg(salary)
from y_emp;
//유형별로 갯수를 가져오고 싶은데, 단순히 COUNT 함수로 데이터를 조회하면 전체 갯수만을 가져옵니다. 이렇게 유형별로 
//갯수를 알고 싶을 때는 컬럼에 데이터를 그룹화 할 수 있는 GROUP BY를 사용하는 것
