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
//�������� ������ �������� ������, �ܼ��� COUNT �Լ��� �����͸� ��ȸ�ϸ� ��ü �������� �����ɴϴ�. �̷��� �������� 
//������ �˰� ���� ���� �÷��� �����͸� �׷�ȭ �� �� �ִ� GROUP BY�� ����ϴ� ��
