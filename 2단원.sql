SELECT emp_name
FROM y_emp
where emp_name between '김' and '하';
//between .. and...


SELECT emp_id
FROM y_emp
where emp_name in ('송강호', '이승연' , '차태현');
// IN...


SELECT emp_id
FROM y_emp
where emp_name like('%현');
//% 는 문자열이 0~n개 _ 는 무조건 1개가 있다고 암시

select emp_name
from y_emp
where comm IS NULL;
//null 비교는 is null/ is not null


SELECT emp_name
FROM y_emp
where dept_id >1020 or dept_id < 1280;
//and or not...


SELECT emp_name
FROM y_emp
where position not in('차장' ,'대리' , '사원' , '과장');
//not 은 in like between 등과 같이 씀


SELECT emp_name,position ,dept_id
FROM y_emp
order by dept_id;
//order by defalut = 오름차순


SELECT emp_name,position ,dept_id
FROM y_emp
order by dept_id , position desc;
//null 은 가장 큰거로 간주
//내림차는 제일 처음 ,,오름차 제일끝 

SELECT emp_name,comm*1000
from y_emp
order by comm desc;

SELECT emp_name,position ,dept_id as asdasd
FROM y_emp
order by dept_id asc, asdasd desc;
// orderby 별칭가능 , 여려열도 가능 , 오름차 내림차는 열마다 지정



//단일행함수
SELECT UPPER(email), LOWER(email), INITCAP(email)
FROM y_emp
order by dept_id;
//initcap - 첫글자만 대문자

select substr('가나다라마바사아자', -3 ,3 )
from dual;
//음수는 끝부터

select instr('하하하마하하', '마')
from dual;
// 지정글자위치

select lpad(emp_name , 10 , '*'), rpad(emp_name , 10 , '*')
from y_emp;
//lpad 왼쪽에 붙여넣기
//rpad 오른쪽에 붙여넣기

select replace(phone, '.' , '-')
from y_emp;

select ltrim('aaaaaasssssddddd' , 'a')
from dual;

select trim ('w' from 'winwdow'), trim(leading 'w' from 'winwdow'), trim (trailing 'w' from 'winwdow')
from dual;
//trim 양옆에서