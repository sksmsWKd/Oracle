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
//order by �� ������ , having �� group by ��

select dept_id,max(count(*)),min(count(*))
from y_emp
group by dept_id;
//��ø�ÿ��� group by �� �׷��Լ��ƴѰ� ��� �Ұ���

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
//oracle ǥ�� ���������� sql ������ outer join ���� �ٸ��� + �� ����
//���� ��ĵ� on�� �ƴ� where ���� ����.

SELECT emp_name , dept_name
FROM y_emp , y_dept;
//����Ŭ ���뱸�������� īƼ�����δ�Ʈ
//sql ǥ�ر����� cross join �� ����

select salary 
from y_emp
where salary > (select salary from y_emp
                      where emp_name = '�����');

select emp_name , position
from y_emp
where position = (select position
                        from y_emp
                        where emp_id = 1049);
//������ ��������

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
//�����༭������                      
                      
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
                     //���� �� ��������, <=  >=

select max(salary)
from y_emp
 where dept_id <= 200
group by dept_id;

select emp_id ,emp_name , position ,salary
from y_emp
where salary < any (select salary 
                                                    from y_emp
                                                    where position = '�븮'  )
                                                    and position <>'�븮';
                                                    
select emp_name
from y_emp
where emp_id  =any (select emp_id
                        from y_emp);
                        
select emp_id, emp_name , position , dept_id
from y_emp
where (position , dept_id)In (select position , dept_id from y_emp
                                      where emp_name like '��%')
                                      and emp_name not like '��%';
                                      
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
                then'�뱸' else '��Ÿ' end) loc_name
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

--start with �� ó�� ������ ����� ����
--connect by  ->> prior �� �θ� �տ� ���̴��� �ڽĿ��տ� ���̴����� �߿�
-- prior�ڿ����� ���� �θ��̸� top-down �ڽĿ��̸� button-up

select emp_id , emp_name, position , mgr_id
from y_emp
start with emp_id = 1019
connect by prior emp_id = mgr_id;
//top - bottum ����

select emp_id, emp_name ,position , mgr_id
from y_emp
start with emp_id = (select max(emp_id) from y_emp)
connect by prior mgr_id  = emp_id;
//���� ���� ������ ã�� sql��

select emp_id
from y_emp
order by emp_id desc;




select emp_id, emp_name, sys_connect_by_path(emp_id,'/') path ,level, rank() over (order by level) as level
FROM y_emp
start with emp_id=1001
connect by prior emp_id = mgr_id
order by level;
//top - down �˻����� ���

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
//Ư�� �б� ����


select emp_id , emp_name , mgr_id , lpad(level,level*2,'**'),
lpad(emp_id , length(emp_id)+(level*2)-2 , '-') as chart
from y_emp
start with emp_id = 1035
connect by prior emp_id = mgr_id
and emp_id <> 1044
order by level;
//�б� ��ü ����

insert into y_dept(dept_id , dept_name , mgr_id , loc_id)
values (600,'�������' , 1038 ,6);

select dept_name  , loc_id
from y_dept
where dept_id = 600;

insert into y_emp (emp_id , emp_name , hiredate)
values(2008 , '������', to_date('99/11/22' , 'yy-mm--dd'));

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

select * from emp300;































                              

                        


                                                    
























