--����� Ȧ���� ����� ����Ͻÿ�.
select employee_id from employees
where mod(employee_id,2) =1;

--board 
select*from board;

desc board;

--���� ��¥ ���
select sysdate from dual;

select sysdate from board
order by bno desc;


insert into board values (
board_seq.nextval,'�̺�Ʈ ����','�����Դϴ�.',sysdate,'ccc',board_seq.currval,0,0,1,''
);
insert into board values (
board_seq.nextval,'�Խñ��� ����մϴ�.','�Խñ� �����Դϴ�.',sysdate,'bbb',board_seq.currval,0,0,1,'2.jpg'
);
insert into board values (
board_seq.nextval,'�Խñ��� ����մϴ�.2','�Խñ� �����Դϴ�.2',sysdate,'ccc',board_seq.currval,0,0,1,'3.jpg'
);

select * from board
order by bno desc;
commit;

select sysdate-1 ����,sysdate ����,sysdate+1 ����
from dual;


select bno,btitle, bdate from board
order by bdate desc;

--���糯¥ ��� 5�� ������ �Խñ��� ����Ͻÿ�.
select sysdate-5 from dual;
--��ȣ,����,�ۼ��ϸ� ���
select bno,btitle ,bdate from board
where bdate<sysdate-7
order by bdate desc
;


--employees �Ի��Ͽ��� ���糯¥���� �Ⱓ�� ����Ͻÿ�.
--�����ȣ,�����,�Ի���,����,�μ���ȣ
--�Ҽ����� ����

select employee_id,emp_name,hire_date,salary,department_id,
trunc(sysdate-hire_date)
from employees;

--�ٰ��� ������ �⼮
select next_day(sysdate,'�Ͽ���') from dual;
select next_day(sysdate,'�����') from dual;
select next_day(sysdate,7) from dual;

--�Է��� ���� ������ ���� ���
select last_day(sysdate)from dual;

select last_day('20231101')from dual;

select last_day('20220201')from dual;

--add_months
select add_months(sysdate,-2)from dual;
select add_months(sysdate,+12)from dual;
select add_months('20220101',+6)from dual;

-- ����޿��� �Ի��� �ޱ����� ������
select round(months_between(sysdate,hire_date))||'����'from employees;

--���� 1�⵿�� �ۼ��� ���� ����Ͻÿ�. board ���
select bno,btitle,bdate from board
where bdate >add_months(sysdate,-12)
order by bdate desc;

--��¥ �� �⵵�� �޸����
select extract(year from bdate) from board;
select extract(month from bdate) from board;
select extract(day from bdate) from board;

--3,5,7���� �Է��� �Խñ��� ����Ͻÿ�.
select*from board
where extract (month from bdate) in(3,5,7)
order by bdate asc;


--��¥ round -15�� ���ϴ� 1�� ����,16�Ϻ��ʹ� 1���߰�, trunc 1�� �������� ������
select bno,btitle,bdate from board;
select bdate,round(bdate,'month'),trunc(bdate,'month') from board;

--to_date�� ����ȯ �Լ� --����ȯ �߿�����
select round(to_date('2023-10-15'),'month') from dual;

--[ ��¥�� ��ȯ �Լ�]--
--to_char ��¥ ->��������ȯ
select bdate from board;

select to_char(bdate,'YYYY-MM-DD DY HH:MI:SS')from board
order by  bdate desc ;

select bno,btitle,bcontent, to_char(bdate,'YYYY"��"MM"��"DD"��') as bdate,bgroup,bstep,bindent,bhit,bfile
from board;

--�Ի���(2023-11-01 ȭ����)
select hire_date,to_char(hire_date,'YYYY-MM-DD DAY') from employees;

select to_char(bdate,'YYYY-MM-DD AM HH:MI:SS')from board
order by bdate desc;

--[������ ��ȯ �Լ�]--
--���ڸ� ���ڷ�
select to_char(1234567890)from dual;
select to_char(1234567890,'$0,000,000,000')from dual;
--���� ȭ�����ǥ��
select to_char(1234567890,'L0,000,999,999')from dual;

select to_char(123,'0000000000')from dual;
select to_char(1234567890,'0000000000')from dual;

--trim �յ� �������� �Լ�
select trim(to_char(123456,'999,999,999'))from dual;

--����
--salary �޷�ǥ�ÿ� õ���� ǥ��
--salary*1342 ��ȭǥ�ÿ� õ����ǥ��, �Ҽ��� 1�ڸ����� �ݿø� ǥ��
select salary,to_char(salary,'$999,999'),salary*1342,to_char(round(salary*1342.42,1),'L999,999,999.9')
from employees;

--���� 
--12345�� 9�ڸ����� ǥ�� �ϴµ�, ������� 0���� ä�����
select  to_char(12345 ,'000000000') from dual;




--����2
--12,345 �� 9�ڸ����� ǥ�� õ����ǥ���ϰ� ������� �����ؼ� ���
select trim(to_char(12345,'L999,999,999'))
from dual;

--����3
--board���̺��� bdate�� ���ؼ�  20231023 ���ڿ� ���� �� �Է��� �Խñ��� ����Ͻÿ�.
select bno,btitle, bdate 
from board 
where bdate='20231023'
order by bdate desc;


select bno,btitle, bdate 
from board 
where bdate= to_date('20231023','YYYYMMDD')
order by bdate desc;

--����4
--���� 20200101���� ������� �Ⱓ�� �󸶳� �������� ���
select sysdate-to_date('20200101','YYYYMMDD') from dual;


--����5 
--�ڱⰡ �¾ ���� �������� �󸶳� �������� ����Ͻÿ�.
select trunc(months_between(sysdate-to_date('19981211','YYYYMMDD')))
from dual;

--[���ڸ� ���ڷ� ����ȯ �Լ�]--
--����20,000 -����10,000�� ��������
select to_number ('20,000','99,999')from dual;
select to_number('10,000','99,999')from dual;

select to_number('20,000','99,999')-to_number('10,000','99,999')from dual;


select emp_name,to_char(salary,'$999,999') from employees;

--���� 
--���� Ŀ�̼�����
--����*12+(����*12*Ŀ�̼�)�������� �ؼ� ����Ͻÿ� 
--�����ȣ,�����,����,����*12,���
select employee_id,emp_name,salary,commission_pct,salary*12,salary*12*nvl(commission_pct,0)
from employees;

--����
select salary,salary*12,(salary*12)+salary*12*nvl(commission_pct,0)
from employees;

select manager_id from employees
where manager_id is null;

select manager_id from employees;

--null 0���� ǥ�ø� ����ϼ��� 
select nvl(manager_id,0) from employees;

select nvl(manager_id,0)
from employees;

--ceo��� ���ڷ� ǥ���ؼ� ���
select nvl(to_char(manager_id),'CEO')
from employees;

--�׷��Լ�--
--�Խñ� ��ȸ�� ������ ����Ͻÿ�
--õ���� ǥ��

--�հ�
SELECT  TRIM(TO_CHAR(SUM(BHIT),'999,999,999'))FROM BOARD;

--���ǥ�� 
SELECT TRIM(TO_CHAR(AVG(BHIT),'999,999,999))FROM BOARD;

--������ ��� ���,�Ҽ��� 2�ڸ����� �ݿø�
SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEES;

--EMP NAME �����Լ��� �׷��Լ��� �Բ� ����� �ȵ�.
SELECT EMP_NAME,AVG(SALARY) FROM EMPLOYEES;

--MIN �ּҰ�,MAX�ִ밪,AVG���,COUNT����,SUM �հ�


