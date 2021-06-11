SELECT comm*12 + 500
from y_emp;
//산술연산자

SELECT emp_id AS asDasD
from y_emp;
//별칭 무조건 대문자

SELECT emp_id "asD asD!"
FROM y_emp;
//별칭 대소문자 공백 띄어쓰기

SELECT emp_id || 'asdasd'
from y_emp;
//문자열 붙이기 '' 단일따옴표

SELECT emp_id
FROM y_emp
WHERE emp_name ='차태현';
//where 문자열

SELECT emp_id
FROM y_emp
WHERE emp_id <> 1023;
//!= <> !=
