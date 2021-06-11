SELECT ROUND(emp_id,-2), round(emp_id , -1) , trunc(emp_id , -1) , mod(1000,5)  , abs(-33)
from y_emp;

select trunc(months_between(sysdate , '2020/01/01'),0)
from dual;
//날짜사이 달수

select (emp_id + 5000 )/2
from y_emp;

select add_months(sysdate , 5)
from dual;

select next_day(sysdate , '금')
from dual;

select emp_id
from y_emp
where emp_id +500 > 2000;
//산술연산은 where select order by 에서 가능

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

select lpad(nvl(comm * 100, '없다'),10,'*') 
from y_emp;
//nvl lpad    인자2 데이터유형 같아야 함

select nvl2(to_char(comm) , '널아님', to_number(123))
from y_emp;
//nvl2

select emp_name ,nvl(to_char(NULLIF(length(emp_name),3)),'이름이 3글자') as n
from y_emp;

select coalesce(comm, salary , 777777)as a
from y_emp
order by a desc;
//COALESCE

select coalesce(comm, (select emp_id
                                  from y_emp
                                  where emp_name = '차태현')) as a
from y_emp;
//COALESCE 안에는 표현식도 가능하다.



SELECT nvl(decode(dept_id,100,'100이다'
                              ,200,'200이다'
                            ,300,'300이다'),'나도몰라') as hi
from y_emp;
//decode 는 if then 같아요

select case dept_id when 100 then '춘식이'
                          when 200 then '대식이'
                          when 300 then '삼식이'
                          else '기본값'
                          end "7시내고향"
                          from y_emp;
//case 는 if then else 같은것  

select sum(comm) , trunselect sum(comm) , trunc(avg(comm),1)
  from y_emp;
select sum(comm) , trunc(avg(comm),1)
from y_emp;