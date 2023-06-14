delete from tupyo where kiho>0;
-- hubo테이블에서 kiho가 0이상인 데이터를 삭제
drop procedure if exists insert_tupyo;
-- 만약 insert_tupyo프로시져가 있다면 삭제해라
DELIMITER $$
-- 구분자를 $$으로 설정
create procedure insert_tupyo(_limit integer)
-- insert_tupyo라는 프로시저를 생성해라
begin
-- 시작
declare _cnt integer;
-- _cnt를 int형으로 선언
set _cnt=0;
-- _cnt를 0으로 설정
	_loop: LOOP
    -- loop시작
		set _cnt =_cnt+1;
        -- _cnt 1씩 증가
        insert into tupyo value(rand()*8+1,rand()*8+1);
        -- tupyo에 투표기호와 투표 연령대를 rand()함수를 이용해서 1부터 9까지의 수를 랜덤으로 생성
        if _cnt=_limit then
        -- _cnt가 마지막 인덱스이면 loop를 떠나라
			leave _loop;
        end if;-- if문 끝
	end LOOP _loop;-- loop문 끝
end $$
call insert_tupyo(1000);-- insert_tupyo를 호출하여 1000개의 데이터 생성
select kiho as 투표한기호, age as 투표자연령대 from tupyo; 
-- "tupyo" 테이블에서 "kiho" 컬럼을 "투표한기호"로, "age" 컬럼을 "투표자연령대"로 조회한다

select kiho as 기호, name as 성명, gongyak as 공약 from hubo; 
-- "hubo" 테이블에서 "kiho" 컬럼을 "기호"로, "name" 컬럼을 "성명"으로, "gongyak" 컬럼을 "공약"으로 조회한다

select kiho, count(*) from tupyo group by kiho; 
-- "tupyo" 테이블에서 "kiho" 컬럼을 기준으로 그룹화하고, 각 그룹별로 레코드 수를 계산한다

