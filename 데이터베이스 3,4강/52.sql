-- insert_Reporttable 프로시저를 삭제
DROP PROCEDURE insert_Reporttable;
DELIMITER $$

-- insert_Reporttable 프로시저를 생성
CREATE PROCEDURE insert_Reporttable()
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
        -- Scoring 테이블의 전체 행 수를 3으로 나눈 값을 _limit 변수에 저장
        SELECT count(*)/3 into _limit from Scoring;
        -- _name 변수에 "홍길"과 _cnt를 문자열로 결합하여 저장
        SET _name=concat("홍길", cast(_cnt as char(4)));
        -- _id 변수에 209900에 _cnt를 더하여 저장합니다.
        SET _id=209900+_cnt;
        -- _name과 _id를 기준으로 Scoring 테이블에서 subjectID가 1인 score 값을 _kor 변수에 저장
        SELECT score into _kor from Scoring where subjectID = 1 and _name = stu_name and _id = stu_id;
        -- _name과 _id를 기준으로 Scoring 테이블에서 subjectID가 2인 score 값을 _eng 변수에 저장
        SELECT score into _eng from Scoring where subjectID = 2 and _name = stu_name and _id = stu_id;
        -- _name과 _id를 기준으로 Scoring 테이블에서 subjectID가 3인 score 값을 _mat 변수에 저장
        SELECT score into _mat from Scoring where subjectID = 3 and _name = stu_name and _id = stu_id;
        -- Reporttable 테이블에 _name, _id, _kor, _eng, _mat 값을 삽입
        INSERT INTO Reporttable VALUE (_name, _id, _kor, _eng, _mat);
        -- _cnt가 _limit와 같을 경우 _loop 레이블을 빠져나온다.
        IF _cnt=_limit THEN
         LEAVE _loop;
      END IF;
   END LOOP _loop;
END $$
DELIMITER ;

-- insert_Reporttable 프로시저를 호출
CALL insert_Reporttable();

-- Reporttable 테이블의 모든 데이터를 조회하며, sum, ave, ranking 열을 추가하여 출력
select *, (kor+eng+mat) as sum, (kor+eng+mat)/3 as ave, (select count(*)+1 from Reporttable where (kor+eng+mat) > sum) as ranking from Reporttable;
