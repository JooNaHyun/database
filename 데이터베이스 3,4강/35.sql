-- 'kopo31' 데이터베이스를 사용
USE kopo31;

-- insert_examtable3 프로시저가 이미 존재하는 경우 삭제
DROP PROCEDURE IF EXISTS insert_examtable3;

-- examtable3 테이블이 이미 존재하는 경우 삭제
DROP TABLE IF EXISTS examtable3;

-- examtable3 테이블을 생성.
CREATE TABLE examtable3 (
    id INTEGER,-- id를 integer로 설정
    name VARCHAR(20),-- name을 varchar로 설정하고 최대길이를 20으로 설정
    kor INTEGER, -- kor를 integer로 설정
    eng INTEGER,-- eng를 integer로 설정
    mat INTEGER,-- mat를 integer로 설정
    sum INTEGER,-- sum를 integer로 설정
    avg1 FLOAT-- avg1를 integer로 설정
);

-- delimiter 설정
DELIMITER $$

-- insert_examtable3 프로시저 생성
CREATE PROCEDURE insert_examtable3(_last INTEGER)
BEGIN
    DECLARE _id INTEGER;-- _id를 integer로 설정
    DECLARE _name VARCHAR(20);-- _name을 varchar로 설정하고 최대길이를 20으로 설정
    DECLARE _kor INTEGER; -- _kor를 integer로 설정
    DECLARE _eng INTEGER; -- _eng를 integer로 설정
    DECLARE _mat INTEGER; -- _mat를 integer로 설정
    DECLARE _sum INTEGER; -- _sum를 integer로 설정
    DECLARE _avg FLOAT; -- _avg를 integer로 설정
    DECLARE _cnt INTEGER; -- _cnt를 integer로 설정
    
    SET _cnt = 0; -- _cnt를 0으로 설정
    
    -- examtable3 테이블의 모든 레코드를 삭제
    DELETE FROM examtable3 WHERE id > 0;
    
    -- 반복문 시작
    _loop: LOOP
        SET _cnt = _cnt + 1;-- cnt 1증가
		-- '_name' 변수에 '홍길동'과 '_cnt' 값을 이어붙여 저장합니다.
		-- '_cnt' 값은 현재 반복 횟수를 나타냅니다.
		SET _name = CONCAT('홍길동', CAST(_cnt AS CHAR(4)));

		-- '_id' 변수에 '_cnt' 값을 저장합니다.
		-- '_cnt' 값은 현재 반복 횟수를 나타냅니다.
		SET _id = _cnt;
        SET _kor = RAND() * 100;-- rand함수로 0부터 100까지의 수에서 랜덤 생성
        SET _eng = RAND() * 100;-- rand함수로 0부터 100까지의 수에서 랜덤 생성
        SET _mat = RAND() * 100;-- rand함수로 0부터 100까지의 수에서 랜덤 생성
        SET _sum = _kor + _eng + _mat;-- 국어 영어 수학의 합
        SET _avg = _sum / 3.0;-- sum에서 나누기 3한 값
        
        -- examtable3 테이블에 레코드를 삽입.
        INSERT INTO examtable3 VALUES (_id, _name, _kor, _eng, _mat, _sum, _avg);
        -- _last에 도달하면 반복문 종료
        IF _cnt = _last THEN
            LEAVE _loop;
        END IF;
    END LOOP _loop;
END$$
-- delimiter 초기화
DELIMITER ;

-- insert_examtable3 프로시저 호출
CALL insert_examtable3(1000);
-- examtable3 테이블의 모든 레코드를 조회 출력
SELECT * FROM examtable3;
