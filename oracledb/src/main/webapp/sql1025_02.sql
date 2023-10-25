select*from employees;

select salary, salary+100,salary-100 from employees;

select sysdate+365 from dual; --dual 임시더미테이블

select 1+3 from dual;

--문자 3을 사칙연산을 하면 숫자로 자동 변환 
select 1+'3' from dual;
--문자'a'는 사칙연산 하면 에러 
select 1+'a' from dual;
--문자는 사칙연산을 할 수 없음 
select 'a'+'b' from dual;

--문자결합은 ||
select 'a'||'b' from dual;
select concat('a','b') from dual;

select* from employees;


--emp_name(email)이렇게 출력하시오.
--Donald OConnell(DOCONNEL)
select emp_name||'('||email||')' u_nicld  from employees;

select concat(emp_name,concat('(',concat(email,')'))) from employees;

select employee_id,emp_name,hire_date from employees
order by hire_date asc ;
--00/01/01 이후 입사한 사원을 출력하시오.
--00/01/24, 00-01-01, 2000-01-01 같은 형태임
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

--부서번호가 80번이상인 사원 출력
select*from employees
where department_id >=80
order by department_id asc;

--부서번호 80만 제외하고 출력하시오.
select *from employees
where not department_id =80  --where department_id =! 80
order by department_id asc;


--부서번호가 50번이면서 6000달러이상인 사원 출력
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

--월급 3000,5000,6000
select * from employees
where salary=3000 or salary=4000 or salary=6000;

select*from employees
where salary in(3000,4000,6000);

select employee_id,salary from employees
where salary=3000 or salary=4000 or salary=6000;

select employee_id,salary from employees
where employee_id in(101,151,200);

--월급이 2천미만 3천 초과인 사원을 출력하시오
select*from employees
where salary<2000 or salary>3000;

select* from employees
where salary not between 2000 and 3000;

--입사일이 00/01/01-00/12/31 사원을 출력하시오.
select * from employees
where hire_date between '00/01/01' and '00/12/31';

select * from employees
where hire_date>'00/01/01' and hire_date<='00/12/31';

select emp_name from employees;

--S로 시작되는 이름을 출력하시오.
select emp_name from employees
where emp_name like 'S%';

select emp_name from employees
where emp_name like '%n';

--처음,끝,중간 e가 있는 이름을 출력하시오.
select emp_name from employees
where emp_name like '%e%';

select *from board;

--bcontent 컬럼에 'faucibus' 단어가 들어가 있는 게시글을 출력하시오.
select*from board
where bcontent like '%faucibus%';

--bcontent 컬럼에 'ven' 개수
select * from board
where bcontent like '%ven%';

--btitle 'ven'개수
select *from board
where btitle like '%ven%';

-- btitle 또는 bcontent 칼럼에 ven 들어간 게시글 출력하시오
select*from board
where bcontent like '%ven%' or btitle like '%ven%';

--bconten n으로 시작하면서 4개의 문자단어가 있는 게시글을 출력하시오
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
--중간 a가 들어간 이름 출력
select emp_name from employees
where emp_name like '%a%';

--두번째 글자가 a인 사원이름을 출력하시오.
select*from employees
where emp_name like '_a%';

--월급 낮은 순부터 출력하시오.
select emp_name,salary from employees
order by salary desc;

select * from employees;

select employee_id,emp_name,job_id,hire_date from employees
order by hire_date desc;

--사원이름 역순 정렬
select emp_name from employees
order by emp_name desc;

--부서번호는 순차정렬 , 이름은 역순정렬
--사원번호,사원명,부서번호,직급,입사일,월급 만 출력하시오
select employee_id,emp_name,department_id,job_id,hire_date,salary from employees
order by department_id asc, emp_name desc ; 

--월급으로 순차정렬,입사일 역순정렬
select employee_id,emp_name,department_id,job_id,hire_date,salary from employees
order by salary asc, hire_date desc;


--abs:절대값
select -10,abs(-10)"절대값" from dual;

--floor:버림
select 10.54578,floor(10.54578)from dual;

--trunc:특정자리 버림
select 10.54578,trunc(10.54578,2),floor(10.54578) from dual;

--round :특정자리 반올림
select 10.54578,round(10.54578),round(10.5478,3)from dual;

select*from stuscore;
select stunum,name,math,eng,kor+eng,(kor+math)/2 from stuscore;

--월급을 원화로 환산, 1342 소수점 2자리 반올림해서 출력
--사번,사원명,월급 ,월급환산,월급환산2자리
select  employee_id, emp_name, salary*1342.32,round(salary*1342.32,3) from employees;
--입사일이 현재날짜까지 걸린 일자를 출력하시오
select round(sysdate-hire_date,3) from employees;

--입사일에서 현재날짜까지 걸린일자를 출력하시오
--소수점 자리는 반올림하고,일을 년으로 환산하시오 
select emp_name,floor(round(sysdate-hire_date)/365) as sdate from employees
order by sdate asc;

select *from member;



