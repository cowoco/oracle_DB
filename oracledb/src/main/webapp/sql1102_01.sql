select*from board
order by bno
;


--sum글자를 출력하시오 
select rownum,a.*
from(select *from board where bcontent like '%sum%'order by bno) a
where rownum >=11 and rownum <=20
;

select * from 
(
select row_number() over(order by bno) rnum , a.*
from board a
where bcontent like '%sum%'
)b
where b.rnum>=11 and b.rnum<=20
;

select *from board
where bcontent like '%sum%'
order by bno;

--중복 행 제거 
select distinct bno
from board
;
select *from board
order by bno
;