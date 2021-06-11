SELECT emp_name
FROM y_emp
where emp_name between '��' and '��';
//between .. and...


SELECT emp_id
FROM y_emp
where emp_name in ('�۰�ȣ', '�̽¿�' , '������');
// IN...


SELECT emp_id
FROM y_emp
where emp_name like('%��');
//% �� ���ڿ��� 0~n�� _ �� ������ 1���� �ִٰ� �Ͻ�

select emp_name
from y_emp
where comm IS NULL;
//null �񱳴� is null/ is not null


SELECT emp_name
FROM y_emp
where dept_id >1020 or dept_id < 1280;
//and or not...


SELECT emp_name
FROM y_emp
where position not in('����' ,'�븮' , '���' , '����');
//not �� in like between ��� ���� ��


SELECT emp_name,position ,dept_id
FROM y_emp
order by dept_id;
//order by defalut = ��������


SELECT emp_name,position ,dept_id
FROM y_emp
order by dept_id , position desc;
//null �� ���� ū�ŷ� ����
//�������� ���� ó�� ,,������ ���ϳ� 

SELECT emp_name,comm*1000
from y_emp
order by comm desc;

SELECT emp_name,position ,dept_id as asdasd
FROM y_emp
order by dept_id asc, asdasd desc;
// orderby ��Ī���� , �������� ���� , ������ �������� ������ ����



//�������Լ�
SELECT UPPER(email), LOWER(email), INITCAP(email)
FROM y_emp
order by dept_id;
//initcap - ù���ڸ� �빮��

select substr('�����ٶ󸶹ٻ����', -3 ,3 )
from dual;
//������ ������

select instr('�����ϸ�����', '��')
from dual;
// ����������ġ

select lpad(emp_name , 10 , '*'), rpad(emp_name , 10 , '*')
from y_emp;
//lpad ���ʿ� �ٿ��ֱ�
//rpad �����ʿ� �ٿ��ֱ�

select replace(phone, '.' , '-')
from y_emp;

select ltrim('aaaaaasssssddddd' , 'a')
from dual;

select trim ('w' from 'winwdow'), trim(leading 'w' from 'winwdow'), trim (trailing 'w' from 'winwdow')
from dual;
//trim �翷����