--사번이 홀수인 사원을 출력하시오.
select employee_id from employees
where mod(employee_id,2) =1;

--board 
select*from board;

desc board;

--현재 날짜 출력
select sysdate from dual;

select sysdate from board
order by bno desc;


insert into board values (
board_seq.nextval,'이벤트 진행','내용입니다.',sysdate,'ccc',board_seq.currval,0,0,1,''
);
insert into board values (
board_seq.nextval,'게시글을 등록합니다.','게시글 내용입니다.',sysdate,'bbb',board_seq.currval,0,0,1,'2.jpg'
);
insert into board values (
board_seq.nextval,'게시글을 등록합니다.2','게시글 내용입니다.2',sysdate,'ccc',board_seq.currval,0,0,1,'3.jpg'
);

select * from board
order by bno desc;
commit;

select sysdate-1 어제,sysdate 오늘,sysdate+1 내일
from dual;


select bno,btitle, bdate from board
order by bdate desc;

--현재날짜 기분 5일 이전에 게시글을 출력하시오.
select sysdate-5 from dual;
--번호,제목,작성일만 출력
select bno,btitle ,bdate from board
where bdate<sysdate-7
order by bdate desc
;


--employees 입사일에서 현재날짜까지 기간을 출력하시오.
--사원번호,사원면,입사일,월급,부서번호
--소수점은 절사

select employee_id,emp_name,hire_date,salary,department_id,
trunc(sysdate-hire_date)
from employees;

--다가올 요일을 출석
select next_day(sysdate,'일요일') from dual;
select next_day(sysdate,'목요일') from dual;
select next_day(sysdate,7) from dual;

--입력한 날의 마지막 일을 출력
select last_day(sysdate)from dual;

select last_day('20231101')from dual;

select last_day('20220201')from dual;

--add_months
select add_months(sysdate,-2)from dual;
select add_months(sysdate,+12)from dual;
select add_months('20220101',+6)from dual;

-- 현재달에서 입사한 달까지의 개월수
select round(months_between(sysdate,hire_date))||'개월'from employees;

--현재 1년동안 작성된 글을 출력하시오. board 사용
select bno,btitle,bdate from board
where bdate >add_months(sysdate,-12)
order by bdate desc;

--날짜 중 년도만 달만출력
select extract(year from bdate) from board;
select extract(month from bdate) from board;
select extract(day from bdate) from board;

--3,5,7월에 입력한 게시글을 출력하시오.
select*from board
where extract (month from bdate) in(3,5,7)
order by bdate asc;


--날짜 round -15일 이하는 1일 세팅,16일부터는 1달추가, trunc 1일 기준으로 변경함
select bno,btitle,bdate from board;
select bdate,round(bdate,'month'),trunc(bdate,'month') from board;

--to_date는 형변환 함수 --형변환 중요한편
select round(to_date('2023-10-15'),'month') from dual;

--[ 날짜형 변환 함수]--
--to_char 날짜 ->문자형변환
select bdate from board;

select to_char(bdate,'YYYY-MM-DD DY HH:MI:SS')from board
order by  bdate desc ;

select bno,btitle,bcontent, to_char(bdate,'YYYY"년"MM"월"DD"일') as bdate,bgroup,bstep,bindent,bhit,bfile
from board;

--입사일(2023-11-01 화요일)
select hire_date,to_char(hire_date,'YYYY-MM-DD DAY') from employees;

select to_char(bdate,'YYYY-MM-DD AM HH:MI:SS')from board
order by bdate desc;

--[문자형 변환 함수]--
--숫자를 문자로
select to_char(1234567890)from dual;
select to_char(1234567890,'$0,000,000,000')from dual;
--나라별 화폐단위표시
select to_char(1234567890,'L0,000,999,999')from dual;

select to_char(123,'0000000000')from dual;
select to_char(1234567890,'0000000000')from dual;

--trim 앞뒤 공백제거 함수
select trim(to_char(123456,'999,999,999'))from dual;

--퀴즈
--salary 달러표시와 천단위 표시
--salary*1342 원화표시와 천단위표시, 소수점 1자리까지 반올림 표시
select salary,to_char(salary,'$999,999'),salary*1342,to_char(round(salary*1342.42,1),'L999,999,999.9')
from employees;

--퀴즈 
--12345총 9자리까지 표시 하는데, 빈공백은 0으로 채워출력
select  to_char(12345 ,'000000000') from dual;




--퀴즈2
--12,345 총 9자리까지 표시 천단위표시하고 빈공백은 제거해서 출력
select trim(to_char(12345,'L999,999,999'))
from dual;

--퀴즈3
--board테이블에서 bdate와 비교해서  20231023 숫자와 같은 날 입력한 게시글을 출력하시오.
select bno,btitle, bdate 
from board 
where bdate='20231023'
order by bdate desc;


select bno,btitle, bdate 
from board 
where bdate= to_date('20231023','YYYYMMDD')
order by bdate desc;

--퀴즈4
--숫자 20200101부터 현재까지 기간이 얼마나 지났는지 출력
select sysdate-to_date('20200101','YYYYMMDD') from dual;


--퀴즈5 
--자기가 태어난 날을 기준으로 얼마나 지났는지 출력하시오.
select trunc(months_between(sysdate-to_date('19981211','YYYYMMDD')))
from dual;

--[문자를 숫자로 형변환 함수]--
--문자20,000 -문자10,000의 숫자차이
select to_number ('20,000','99,999')from dual;
select to_number('10,000','99,999')from dual;

select to_number('20,000','99,999')-to_number('10,000','99,999')from dual;


select emp_name,to_char(salary,'$999,999') from employees;

--퀴즈 
--연봉 커미션포함
--월급*12+(월급*12*커미션)연봉으로 해서 출력하시오 
--사원번호,사원명,월급,월급*12,년봉
select employee_id,emp_name,salary,commission_pct,salary*12,salary*12*nvl(commission_pct,0)
from employees;

--연봉
select salary,salary*12,(salary*12)+salary*12*nvl(commission_pct,0)
from employees;

select manager_id from employees
where manager_id is null;

select manager_id from employees;

--null 0으로 표시를 출력하세요 
select nvl(manager_id,0) from employees;

select nvl(manager_id,0)
from employees;

--ceo라는 글자로 표시해서 출력
select nvl(to_char(manager_id),'CEO')
from employees;

--그룹함수--
--게시글 조회수 총합을 출력하시오
--천단위 표시

--합계
SELECT  TRIM(TO_CHAR(SUM(BHIT),'999,999,999'))FROM BOARD;

--평균표시 
SELECT TRIM(TO_CHAR(AVG(BHIT),'999,999,999))FROM BOARD;

--월급의 평균 출력,소수점 2자리까지 반올림
SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEES;

--EMP NAME 단일함수를 그룹함수와 함께 출력이 안됨.
SELECT EMP_NAME,AVG(SALARY) FROM EMPLOYEES;

--MIN 최소값,MAX최대값,AVG평균,COUNT개수,SUM 합계


