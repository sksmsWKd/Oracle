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
