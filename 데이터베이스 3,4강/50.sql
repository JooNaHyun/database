DROP PROCEDURE IF EXISTS insert_Testing; -- insert_examtable 저장 프로시저가 이미 존재하는 경우 삭제
-- 쿼리 분리자를 $$로 변경
DELIMITER $$
CREATE PROCEDURE insert_Testing( _subjectID INTEGER, _last INTEGER) -- insert_examtable 저장 프로시저를 생성, _last라는 정수형 매개변수를 사용
BEGIN
    DECLARE _name VARCHAR(20); -- _name이라는 VARCHAR(20) 타입 변수를 선언
    DECLARE _id INTEGER; -- _id라는 INTEGER 타입 변수를 선언
    DECLARE _cnt INTEGER; -- _cnt라는 INTEGER 타입 변수를 선언
    SET _cnt = 0; -- _cnt 변수를 0으로 초기화

    _loop: LOOP -- _loop 레이블로 표시된 루프를 시작
        SET _cnt = _cnt + 1; -- _cnt 변수를 1씩 증가
        SET _name = CONCAT("홍길", CAST(_cnt AS CHAR(4))); -- _name 변수에 "홍길" 문자열과 _cnt 변수를 연결하여 할당
        SET _id = 209900 + _cnt; -- _id 변수에 209900에 _cnt 변수를 더하여 할당

        INSERT INTO Testing VALUES (_subjectID, _name, _id, RAND()*3+1, RAND()*3+1, RAND()*3+1, RAND()*3+1, RAND()*3+1,
      RAND()*3+1, RAND()*3+1, RAND()*3+1, RAND()*3+1, RAND()*3+1,-- examtable 테이블에 _name, _id, 랜덤한 값으로 구성된 세 개의 열을 삽입
        RAND()*3+1, RAND()*3+1, RAND()*3+1, RAND()*3+1, RAND()*3+1,-- examtable 테이블에 _name, _id, 랜덤한 값으로 구성된 세 개의 열을 삽입
        RAND()*3+1, RAND()*3+1, RAND()*3+1, RAND()*3+1, RAND()*3+1); -- examtable 테이블에 _name, _id, 랜덤한 값으로 구성된 세 개의 열을 삽입

        IF _cnt = _last THEN -- _cnt 변수가 _last 값과 같을 때, 루프를 종료
            LEAVE _loop; -- 루프를 종료
        END IF; -- if를 종료
    END LOOP _loop; -- _loop 레이블로 표시된 루프를 종료
END $$ -- 저장 프로시저 정의 종료
DELIMITER ; -- 쿼리 분리자를 기본값인 ;로 변경합니다.

call insert_Testing(1, 1000);-- 과목코드가 1인 데이터 1000개 생성
call insert_Testing(2, 1000);-- 과목코드가 2인 데이터 1000개 생성
call insert_Testing(3, 1000);-- 과목코드가 3인 데이터 1000개 생성
select * from Testing;-- Testing 테이블의 전체 데이터 조회
