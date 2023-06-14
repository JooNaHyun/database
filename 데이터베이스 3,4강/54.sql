-- insert_Reporttable1 프로시저를 삭제합니다.
DROP PROCEDURE insert_Reporttable1;

DELIMITER $$

-- insert_Reporttable1 프로시저를 생성합니다.
CREATE PROCEDURE insert_Reporttable1()
BEGIN
-- 변수 선언
DECLARE _name varchar(20);
DECLARE _id integer;
DECLARE _kor integer;
DECLARE _eng integer;
DECLARE _mat integer;
DECLARE _cnt integer;
DECLARE _limit integer;
SET _cnt=0;

-- _loop 레이블로 루프 시작
   _loop: LOOP
      SET _cnt=_cnt+1;
        -- Scoring 테이블의 전체 행 수를 3으로 나눈 값을 _limit 변수에 저장합니다.
        SELECT count(*)/3 into _limit from Scoring;
        -- _name 변수에 "홍길"과 _cnt를 문자열로 결합하여 저장합니다.
        SET _name=concat("홍길", cast(_cnt as char(4)));
        -- _id 변수에 209900에 _cnt를 더하여 저장합니다.
        SET _id=209900+_cnt;
        -- _name과 _id를 기준으로 Scoring 테이블에서 subjectID가 1인 score 값을 _kor 변수에 저장합니다.
        SELECT score into _kor from Scoring where subjectID = 1 and _name = stu_name and _id = stu_id;
        -- _name과 _id를 기준으로 Scoring 테이블에서 subjectID가 2인 score 값을 _eng 변수에 저장합니다.
        SELECT score into _eng from Scoring where subjectID = 2 and _name = stu_name and _id = stu_id;
        -- _name과 _id를 기준으로 Scoring 테이블에서 subjectID가 3인 score 값을 _mat 변수에 저장합니다.
        SELECT score into _mat from Scoring where subjectID = 3 and _name = stu_name and _id = stu_id;
        -- Reporttable 테이블에 _name, _id, _kor, _eng, _mat 값을 삽입합니다.
        INSERT INTO Reporttable VALUE (_name, _id, _kor, _eng, _mat);
        -- _cnt가 _limit와 같을 경우 _loop 레이블을 빠져나옵니다.
        IF _cnt=_limit THEN
         LEAVE _loop;
      END IF;
   END LOOP _loop;
END $$

DELIMITER ;

-- insert_Reporttable1 프로시저를 호출합니다.
CALL insert_Reporttable1();



#  과목 문제별 득점자수
select subjectID, sum(a01 = 1) as a01_count, sum(a02 = 1) as a02_count, sum(a03 = 1) as a03_count, sum(a04 = 1) as a04_count, sum(a05 = 1) as a05_count,
    sum(a06 = 1) as a06_count, sum(a07 = 1) as a07_count, sum(a08 = 1) as a08_count, sum(a09 = 1) as a09_count, sum(a10 = 1) as a10_count,
    sum(a11 = 1) as a11_count, sum(a12 = 1) as a12_count, sum(a13 = 1) as a13_count, sum(a14 = 1) as a14_count, sum(a15 = 1) as a15_count,
    sum(a16 = 1) as a16_count, sum(a17 = 1) as a17_count, sum(a18 = 1) as a18_count, sum(a19 = 1) as a19_count, sum(a20 = 1) as a20_count
from Scoring where subjectID = 1
-- Scoring 테이블에서 subjectID가 1인 데이터에서 20문제중 1인 것만 합함.
UNION ALL 
-- 여러 개의 SELECT 문을 하나로 합치는 역할
select subjectID, sum(a01 = 1) as a01_count, sum(a02 = 1) as a02_count, sum(a03 = 1) as a03_count, sum(a04 = 1) as a04_count, sum(a05 = 1) as a05_count,
    sum(a06 = 1) as a06_count, sum(a07 = 1) as a07_count, sum(a08 = 1) as a08_count, sum(a09 = 1) as a09_count, sum(a10 = 1) as a10_count,
    sum(a11 = 1) as a11_count, sum(a12 = 1) as a12_count, sum(a13 = 1) as a13_count, sum(a14 = 1) as a14_count, sum(a15 = 1) as a15_count,
    sum(a16 = 1) as a16_count, sum(a17 = 1) as a17_count, sum(a18 = 1) as a18_count, sum(a19 = 1) as a19_count, sum(a20 = 1) as a20_count
from Scoring where subjectID = 2
-- Scoring 테이블에서 subjectID가 2인 데이터에서 20문제중 1인 것만 합함.
UNION ALL
-- 여러 개의 SELECT 문을 하나로 합치는 역할
select subjectID,  sum(a01 = 1) as a01_count, sum(a02 = 1) as a02_count, sum(a03 = 1) as a03_count, sum(a04 = 1) as a04_count, sum(a05 = 1) as a05_count,
    sum(a06 = 1) as a06_count, sum(a07 = 1) as a07_count, sum(a08 = 1) as a08_count, sum(a09 = 1) as a09_count, sum(a10 = 1) as a10_count,
    sum(a11 = 1) as a11_count, sum(a12 = 1) as a12_count, sum(a13 = 1) as a13_count, sum(a14 = 1) as a14_count, sum(a15 = 1) as a15_count,
    sum(a16 = 1) as a16_count, sum(a17 = 1) as a17_count, sum(a18 = 1) as a18_count, sum(a19 = 1) as a19_count, sum(a20 = 1) as a20_count
from Scoring where subjectID = 3;
-- Scoring 테이블에서 subjectID가 3인 데이터에서 20문제중 1인 것만 합함.

# 과목 문제별 득점률
select subjectID,  sum(a01 = 1)/1000*100 as a01_per, sum(a02 = 1)/1000*100 as a02_per, sum(a03 = 1)/1000*100 as a03_per, sum(a04 = 1)/1000*100 as a04_per, sum(a05 = 1)/1000*100 as a05_per,
    sum(a06 = 1)/1000*100 as a06_per, sum(a07 = 1)/1000*100 as a07_per, sum(a08 = 1)/1000*100 as a08_per, sum(a09 = 1)/1000*100 as a09_per, sum(a10 = 1)/1000*100 as a10_per,
    sum(a11 = 1)/1000*100 as a11_per, sum(a12 = 1)/1000*100 as a12_per, sum(a13 = 1)/1000*100 as a13_per, sum(a14 = 1)/1000*100 as a14_per, sum(a15 = 1)/1000*100 as a15_per,
    sum(a16 = 1)/1000*100 as a16_per, sum(a17 = 1)/1000*100 as a17_per, sum(a18 = 1)/1000*100 as a18_per, sum(a19 = 1)/1000*100 as a19_per, sum(a20 = 1)/1000*100 as a20_per
from Scoring where subjectID = 1
-- Scoring 테이블에서 subjectID가 1인 데이터에서 20문제중 1인 것을 1000으로 나누고 100으로 곱한 것을 출력
UNION ALL
-- 여러 개의 SELECT 문을 하나로 합치는 역할
select subjectID, sum(a01 = 1)/1000*100 as a01_per, sum(a02 = 1)/1000*100 as a02_per, sum(a03 = 1)/1000*100 as a03_per, sum(a04 = 1)/1000*100 as a04_per, sum(a05 = 1)/1000*100 as a05_per,
    sum(a06 = 1)/1000*100 as a06_per, sum(a07 = 1)/1000*100 as a07_per, sum(a08 = 1)/1000*100 as a08_per, sum(a09 = 1)/1000*100 as a09_per, sum(a10 = 1)/1000*100 as a10_per,
    sum(a11 = 1)/1000*100 as a11_per, sum(a12 = 1)/1000*100 as a12_per, sum(a13 = 1)/1000*100 as a13_per, sum(a14 = 1)/1000*100 as a14_per, sum(a15 = 1)/1000*100 as a15_per,
    sum(a16 = 1)/1000*100 as a16_per, sum(a17 = 1)/1000*100 as a17_per, sum(a18 = 1)/1000*100 as a18_per, sum(a19 = 1)/1000*100 as a19_per, sum(a20 = 1)/1000*100 as a20_per
from Scoring where subjectID = 2
-- Scoring 테이블에서 subjectID가 2인 데이터에서 20문제중 1인 것을 1000으로 나누고 100으로 곱한 것을 출력
UNION ALL
-- 여러 개의 SELECT 문을 하나로 합치는 역할
select subjectID, sum(a01 = 1)/1000*100 as a01_per, sum(a02 = 1)/1000*100 as a02_per, sum(a03 = 1)/1000*100 as a03_per, sum(a04 = 1)/1000*100 as a04_per, sum(a05 = 1)/1000*100 as a05_per,
    sum(a06 = 1)/1000*100 as a06_per, sum(a07 = 1)/1000*100 as a07_per, sum(a08 = 1)/1000*100 as a08_per, sum(a09 = 1)/1000*100 as a09_per, sum(a10 = 1)/1000*100 as a10_per,
    sum(a11 = 1)/1000*100 as a11_per, sum(a12 = 1)/1000*100 as a12_per, sum(a13 = 1)/1000*100 as a13_per, sum(a14 = 1)/1000*100 as a14_per, sum(a15 = 1)/1000*100 as a15_per,
    sum(a16 = 1)/1000*100 as a16_per, sum(a17 = 1)/1000*100 as a17_per, sum(a18 = 1)/1000*100 as a18_per, sum(a19 = 1)/1000*100 as a19_per, sum(a20 = 1)/1000*100 as a20_per
from Scoring where subjectID = 3;
-- Scoring 테이블에서 subjectID가 3인 데이터에서 20문제중 1인 것을 1000으로 나누고 100으로 곱한 것을 출력







    
