select*from employees;

select salary, salary+100,salary-100 from employees;

select sysdate+365 from dual; --dual �ӽô������̺�

select 1+3 from dual;

--���� 3�� ��Ģ������ �ϸ� ���ڷ� �ڵ� ��ȯ 
select 1+'3' from dual;
--����'a'�� ��Ģ���� �ϸ� ���� 
select 1+'a' from dual;
--���ڴ� ��Ģ������ �� �� ���� 
select 'a'+'b' from dual;

--���ڰ����� ||
select 'a'||'b' from dual;
select concat('a','b') from dual;

select* from employees;


--emp_name(email)�̷��� ����Ͻÿ�.
--Donald OConnell(DOCONNEL)
select emp_name||'('||email||')' u_nicld  from employees;

select concat(emp_name,concat('(',concat(email,')'))) from employees;

select employee_id,emp_name,hire_date from employees
order by hire_date asc ;
--00/01/01 ���� �Ի��� ����� ����Ͻÿ�.
--00/01/24, 00-01-01, 2000-01-01 ���� ������
select*from employees
where hire_date >= '2000-01-01'
order by hire_date asc;

select*from employees
order by salary desc;

select*from employees
where salary =24000;

select*from employees
where salary=(select max(salary)from employees);

select *from employees
where commision_pct is not null;

--�μ���ȣ�� 80���̻��� ��� ���
select*from employees
where department_id >=80
order by department_id asc;

--�μ���ȣ 80�� �����ϰ� ����Ͻÿ�.
select *from employees
where not department_id =80  --where department_id =! 80
order by department_id asc;


--�μ���ȣ�� 50���̸鼭 6000�޷��̻��� ��� ���
select *from employees
where department_id=50 and salary >=6000;

--and, between
select*from employees
where salary>=2000 and salary<=3000;

--between A and B
select*from employees
where salary between 2000 and 3000;

--avg,count,max,min
select avg(salary)from employees;

select*from employees
where salary<=6461
order by salary desc;


select*from employees
where salary<=(select avg(salary)from employees)
order by salary desc;

--���� 3000,5000,6000
select * from employees
where salary=3000 or salary=4000 or salary=6000;

select*from employees
where salary in(3000,4000,6000);

select employee_id,salary from employees
where salary=3000 or salary=4000 or salary=6000;

select employee_id,salary from employees
where employee_id in(101,151,200);

--������ 2õ�̸� 3õ �ʰ��� ����� ����Ͻÿ�
select*from employees
where salary<2000 or salary>3000;

select* from employees
where salary not between 2000 and 3000;

--�Ի����� 00/01/01-00/12/31 ����� ����Ͻÿ�.
select * from employees
where hire_date between '00/01/01' and '00/12/31';

select * from employees
where hire_date>'00/01/01' and hire_date<='00/12/31';

select emp_name from employees;

--S�� ���۵Ǵ� �̸��� ����Ͻÿ�.
select emp_name from employees
where emp_name like 'S%';

select emp_name from employees
where emp_name like '%n';

--ó��,��,�߰� e�� �ִ� �̸��� ����Ͻÿ�.
select emp_name from employees
where emp_name like '%e%';

select *from board;

--bcontent �÷��� 'faucibus' �ܾ �� �ִ� �Խñ��� ����Ͻÿ�.
select*from board
where bcontent like '%faucibus%';

--bcontent �÷��� 'ven' ����
select * from board
where bcontent like '%ven%';

--btitle 'ven'����
select *from board
where btitle like '%ven%';

-- btitle �Ǵ� bcontent Į���� ven �� �Խñ� ����Ͻÿ�
select*from board
where bcontent like '%ven%' or btitle like '%ven%';

--bconten n���� �����ϸ鼭 4���� ���ڴܾ �ִ� �Խñ��� ����Ͻÿ�
--nibh
--  n___
select bcontent from board
where bcontent like '%n_';

select emp_name from employees
where emp_name like 'P___%';

select emp_name from employees
where emp_name like '%';

select emp_name from employees
where emp_name like 'D%' or emp_name like '%a';
--�߰� a�� �� �̸� ���
select emp_name from employees
where emp_name like '%a%';

--�ι�° ���ڰ� a�� ����̸��� ����Ͻÿ�.
select*from employees
where emp_name like '_a%';

--���� ���� ������ ����Ͻÿ�.
select emp_name,salary from employees
order by salary desc;

select * from employees;

select employee_id,emp_name,job_id,hire_date from employees
order by hire_date desc;

--����̸� ���� ����
select emp_name from employees
order by emp_name desc;

--�μ���ȣ�� �������� , �̸��� ��������
--�����ȣ,�����,�μ���ȣ,����,�Ի���,���� �� ����Ͻÿ�
select employee_id,emp_name,department_id,job_id,hire_date,salary from employees
order by department_id asc, emp_name desc ; 

--�������� ��������,�Ի��� ��������
select employee_id,emp_name,department_id,job_id,hire_date,salary from employees
order by salary asc, hire_date desc;


--abs:���밪
select -10,abs(-10)"���밪" from dual;

--floor:����
select 10.54578,floor(10.54578)from dual;

--trunc:Ư���ڸ� ����
select 10.54578,trunc(10.54578,2),floor(10.54578) from dual;

--round :Ư���ڸ� �ݿø�
select 10.54578,round(10.54578),round(10.5478,3)from dual;

select*from stuscore;
select stunum,name,math,eng,kor+eng,(kor+math)/2 from stuscore;

--������ ��ȭ�� ȯ��, 1342 �Ҽ��� 2�ڸ� �ݿø��ؼ� ���
--���,�����,���� ,����ȯ��,����ȯ��2�ڸ�
select  employee_id, emp_name, salary*1342.32,round(salary*1342.32,3) from employees;
--�Ի����� ���糯¥���� �ɸ� ���ڸ� ����Ͻÿ�
select round(sysdate-hire_date,3) from employees;

--�Ի��Ͽ��� ���糯¥���� �ɸ����ڸ� ����Ͻÿ�
--�Ҽ��� �ڸ��� �ݿø��ϰ�,���� ������ ȯ���Ͻÿ� 
select emp_name,floor(round(sysdate-hire_date)/365) as sdate from employees
order by sdate asc;

select *from member;



