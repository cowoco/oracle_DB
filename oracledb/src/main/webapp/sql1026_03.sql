
select * from board;

--년도의 월별 개수를 출력하시오.
SELECT TO_CHAR(BDATE,'YYYYMM') 년월,COUNT(TO_CHAR(BDATE,'YYYMM'))년월별개수
FROM BOARD
GROUP BY TO_CHAR(BDATE,'YYYYMM')
ORDER BY TO_CHAR(BDATE,'YYYYMM');

--년도만 출력
SELECT EXTRACT(YEAR FROM BDATE) FROM BOARD;
--월만 출력
SELECT EXTRACT(MONTH FROM BDATE) FROM BOARD;
--일만 출력
SELECT EXTRACT(DAY FROM BDATE) FROM BOARD;

--년도와 상관없이 월별 게시글수 출력
SELECT EXTRACT(MONTH FROM BDATE),COUNT(EXTRACT(MONTH FROM BDATE))
FROM BOARD
GROUP BY EXTRACT(MONTH FROM BDATE)
ORDER BY EXTRACT(MONTH FROM BDATE);

SELECT DEPARTMENT_ID,COUNT(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID
;
SELECT COUNT(EMPLOYEE_ID)FROM EMPLOYEES;--107
SELECT COUNT(MANAGER_ID)FROM EMPLOYEES;--106: NULL

--조회수가 가장 낮은 제목,내용을 출력하시오 
SELECT MIN(BHIT) FROM BOARD;


SELECT BNO,BTITLE,MIN(BHIT) FROM BOARD
GROUP BY BNO,BTITLE,BCONTENT
;
SELECT*FROM BOARD
WHERE BHIT =(SELECT MIN(BHIT) FROM BOARD)
;

--조회수가 가장 높은 게시글을 출력하세요 
SELECT *FROM  BOARD
WHERE BHIT=(SELECT MAX(BHIT) FROM BOARD);

--[문자함수]--
SELECT EMP_NAME FROM EMPLOYEES;
--대소문자 구분 없이 si,Si 가 포함된 이름을 모두 출력하시오.
--SI, Si sI,si
SELECT EMP_NAME FROM EMPLOYEES
WHERE EMP_NAME LIKE ('%DA%') OR EMP_NAME LIKE('%Da%') OR EMP_NAME LIKE ('%dA%') OR  EMP_NAME LIKE ('%da%')
;
SELECT EMP_NAME FROM EMPLOYEES
WHERE EMP_NAME LIKE '%da%';
--소문자 변환 함수
SELECT EMP_NAME FROM EMPLOYEES
WHERE LOWER(EMP_NAME)LIKE('%da%');
--대문자 변환 함수
SELECT EMP_NAME FROM EMPLOYEES
WHERE UPPER(EMP_NAME)LIKE('%DA%');

--employees 에서 이름을 대문자로 출력
SELECT UPPER(EMP_NAME)FROM EMPLOYESS;

--자리수를 만들어서 지정한 문자를 채워 출력
SELECT LPAD(12345,10,'0') FROM DUAL;
SELECT LPAD(12345,10,'@') FROM DUAL;
SELECT LPAD(12345,10,'#') FROM DUAL;
--12345를 10자리로 천단위 표시와 원화 표시를 추가해서 출력하시오.
--빈공백은 0으로 표시 
SELECT TO_CHAR(12345,'L0,000,000,000') FROM DUAL
;

--LTRLM:왼쪽공백제거, RTRLM:오른쪽 공백제어, TRIM:모든 공백제거
--'    ABC    DEF   C    '
SELECT TRIM('    ABC    DEF   C    ')FROM DUAL;


SELECT*FROM EMPLOYEES;


--JOB_ID ASST ->SS-> I ASST ->AIT
SELECT REPLACE(JOB_ID,'SS','I')FROM EMPLOYEES;

--JOB_ID안에 있는 공백 제거
SELECT EMP_NAME,REPLACE(EMP_NAME,' ','')FROM EMPLOYEES;
SELECT '    ABC    DEF   C  ',REPLACE('    ABC    DEF   C  ',' ','')FROM DUAL;

SELECT JOB_ID FROM EMP2;

--SH_CLERK를 CLERK으로 변경
UPDATE EMP2
SET JOB_ID='CLERK'
WHERE JOB_ID ='SH_CLERK'
;
SELECT REPLACE(JOB_ID,'SH_SLERK','CLERK') FROM EMP2
;

ROLLBACK;
--SUBSTR(해당컬럼,3,2)해당
--4째부터 이름 3개를 가져옴 
SELECT EMP_NAME,SUBSTR(EMP_NAME,1,5)FROM EMPLOYEES;

SELECT HIRE_DATE FROM EMPLOYEES;


--이름 5개와 입사년도 출력
--Donal(1995)
SELECT SUBSTR(EMP_NAME,1,5),TO_CHAR(HIRE_DATE,'YYYY') FROM EMPLOYEES;

---WE

SELECT SUBSTR(EMP_NAME,1,5)||'('||EXTRACT(YEAR FROM HIRE_DATE)||')'
FROM EMPLOYEES;


SELECT*FROM EMPLOYEES;

--입사일이 06월인 사람중에 이름이 d가 들어가 있는 사람
SELECT*FROM EMPLOYEES
WHERE EXTRACT (MONTH FROM HIRE_DATE)=6
AND EMP_NAME LIKE('%d%')
;

rollback;
select job_id from emp2;

update board
set bhit= 1
;

select *from board;

select bhit,bhit+100 from board;

select job_id from emp2;


select job_id from emp2;

--SH_CLERK을CLERK으로 업데이트
select job_id from emp2;
rollback;

update board a
set bhit =(select bhit+100 from board  b where a.bno =b.bno)
;
select bhit from board;

select job_id from emp2;

--게시글의 날짜를 1씩 증가해서 update하시오 
--bdate 
update board a
set bdate =(select bdate+1 from board b where a.bno=b.bno);

rollback;

select * from stuscore;
update  stuscore
set rank=0;
commit;

select stunum,total,rank() over(order by total)from stuscore;

--[]----[]---
select b_num,b_rank from
(select stunum b_num,rank() over(order by total desc) b_rank from stuscore)
;

update stuscore a
set rank=(select b_rank from
(select stunum b_num,rank() over(order by total desc) b_rank from stuscore b) where a.stunum=b_num)
;
select *from stuscore;

select length(emp_name),emp_name from employees;

--length 출력
select avg(length(emp_name)) from employees;

--이름을 평균절사 길이만큼 출력하시오.


--employees 폰번호 5번째 3개와 이름 첫번째에서 1,5번째 까지 2개를 함께 출력하시오 
select * from employees;
select substr(phone_number,5,3)|| substr(emp_name,5,2) from employees;

--instr 찾고자하는 위치 숫자출력
select instr(emp_name,'o')
from employees
where employee_id =198
;
select emp_name,instr(emp_name,' '),instr(emp_name,' ')+1 from employees;

--1번째 공백이후부터 이름 가져오기
select substr(emp_name,instr(emp_name,' ')+1) from employees;
--주민번호 앞에서 가져오기
select substr('880101-1101111',1,instr('880101-1101111','-')-1)from dual;

--주민번호 뒤에서 가져오기
select substr('880101-1101111',instr('880101-1101111','-')+1)from dual;



--employees의 phone_number 첫번째 점 기준으로 앞부분과 뒤부분을 출력하시오
select phone_number from employees;

select instr('123.456.789','.') from dual;--점이 있는 위치값
select instr('123.456.789.000','.',1,3) from dual; --1번째숫자-시작위치, 두번째 숫자 점의 두번째 위치값
select instr('123.456.789.000','.',-1,1) from dual; --1번째숫자-시작위치, 두번째 숫자 점의 두번째 위치값

select * from member;
--전화번호 -첫번째 값 출력,두번째,세번째 값을 출력하시오.
--010
select substr(phone,1,instr(phone,'-')-1) from member;
--1111
select substr(phone,instr(phone,'-')+1, instr(phone,'-',1,2)-1) from member;
--1111
select phone,instr(phone,'-')from member; --5
select phoone,instr(phone,'-',1,2)from member; --8


select phone_number from employees;
--이정도는 알고 있어야함--
--폰번호에서 123포함되어있는 폰번호를 출력하시오.
select phone_number from employees
where phone_number like('%123%');

--부서별 최대월급을 출력하시오.
select * from employees;
select department_id,max(salary),min(salary)
from employees
group by department_id
order by department_id;


select emp_name,hire_date,to_char(hire_date,'YYYY"년"MM"월"DD"일" DAY') from employees;



