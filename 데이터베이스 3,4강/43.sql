
drop procedure if exists insert_tupyo2; -- "insert_tupyo2" 프로시저가 이미 존재한다면 삭제

DELIMITER $$ 
-- 구분자를 변경하여 프로시저 내용을 정의
create procedure insert_tupyo2(_limit integer)
begin
    declare _cnt integer; -- "_cnt"라는 변수를 선언
    set _cnt=0; -- "_cnt" 변수를 0으로 초기화

    _loop: LOOP -- "_loop"라는 레이블로 반복문을 시작
        set _cnt =_cnt+1; -- "_cnt" 변수 값을 1씩 증가
        insert into tupyo2 value(rand()*8+1,rand()*8+1,rand()*8+1,rand()*8+1); -- "tupyo2" 테이블에 임의의 값들을 삽입
        if _cnt=_limit then -- "_cnt" 변수가 "_limit" 값과 동일하다면
            leave _loop; -- 반복문을 종료
        end if;
    end LOOP _loop; -- "_loop" 반복문을 종료
end $$ -- 프로시저 정의를 마친다

call insert_tupyo2(1000); -- "insert_tupyo2" 프로시저를 호출하여 1000개의 레코드를 삽입

select * from tupyo2; -- "tupyo2" 테이블의 모든 레코드를 선택

select age, h1.name as 투표1, h2.name as 투표2, h3.name as 투표3
 -- 나이와 투표1, 투표2, 투표3의 이름을 선택
from tupyo2 as a, hubo as h1, hubo as h2, hubo as h3 
-- "tupyo2" 테이블과 "hubo" 테이블을 a, h1, h2, h3로 각각 별칭 지정하여 조인
where a.kiho1=h1.kiho and a.kiho2 = h2.kiho and a.kiho3 =h3.kiho; 
-- a의 kiho1 값과 h1의 kiho 값이 일치하고, a의 kiho2 값과 h2의 kiho 값이 일치하며, a의 kiho3 값과 h3의 kiho 값이 일치하는 조건을 만족하는 레코드를 선택


select 
	age,-- age조회
	(select name from hubo where kiho= a.kiho1) as "투표1", 
    -- hubo테이블에서 kiho= a.kiho1이 같은 이름을 조회(별칭 투표1)
    (select name from hubo where kiho= a.kiho2) as "투표2",
    -- hubo테이블에서 kiho= a.kiho2이 같은 이름을 조회(별칭 투표2)
    (select name from hubo where kiho= a.kiho3) as "투표3"
    -- hubo테이블에서 kiho= a.kiho3이 같은 이름을 조회(별칭 투표3)
from tupyo2 as a; -- "tupyo2" 테이블을 a로 별칭 지정하여 선택한다

    
	

