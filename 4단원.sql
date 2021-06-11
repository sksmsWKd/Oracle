SELECT ROUND(emp_id,-2), round(emp_id , -1) , trunc(emp_id , -1) , mod(1000,5)  , abs(-33)
from y_emp;

select trunc(months_between(sysdate , '2020/01/01'),0)
from dual;
//��¥���� �޼�

select (emp_id + 5000 )/2
from y_emp;

select add_months(sysdate , 5)
from dual;

select next_day(sysdate , '��')
from dual;

select emp_id
from y_emp
where emp_id +500 > 2000;
//��������� where select order by ���� ����

select *
from y_dept
where dept_id = '100';

select comm 
from y_emp
where comm = '0.3';

select to_char(emp_id, '00,000,000') , to_char(emp_id,'999,999,000')
from y_emp;

select to_Date(sysdate, 'dd,mm,yyyy')
from dual;

select lpad(nvl(comm * 100, '����'),10,'*') 
from y_emp;
//nvl lpad    ����2 ���������� ���ƾ� ��

select nvl2(to_char(comm) , '�ξƴ�', to_number(123))
from y_emp;
//nvl2

select emp_name ,nvl(to_char(NULLIF(length(emp_name),3)),'�̸��� 3����') as n
from y_emp;

select coalesce(comm, salary , 777777)as a
from y_emp
order by a desc;
//COALESCE

select coalesce(comm, (select emp_id
                                  from y_emp
                                  where emp_name = '������')) as a
from y_emp;
//COALESCE �ȿ��� ǥ���ĵ� �����ϴ�.



SELECT nvl(decode(dept_id,100,'100�̴�'
                              ,200,'200�̴�'
                            ,300,'300�̴�'),'��������') as hi
from y_emp;
//decode �� if then ���ƿ�

select case dept_id when 100 then '�����'
                          when 200 then '�����'
                          when 300 then '�����'
                          else '�⺻��'
                          end "7�ó�����"
                          from y_emp;
//case �� if then else ������  

select sum(comm) , trunselect sum(comm) , trunc(avg(comm),1)
  from y_emp;
select sum(comm) , trunc(avg(comm),1)
from y_emp;