-- insert_liking 프로시저가 있는 경우 삭제
DROP PROCEDURE IF EXISTS insert_liking;

-- liking 테이블이 있는 경우 삭제
DROP TABLE IF EXISTS liking;

-- liking 테이블 생성
CREATE TABLE liking (
    name VARCHAR(20),
    age INT
);

-- delimiter 설정
DELIMITER $$

-- insert_liking 프로시저 생성
CREATE PROCEDURE insert_liking(_last INTEGER)
BEGIN
    -- 변수 선언
    DECLARE _name VARCHAR(20);
    DECLARE _age INT;
    DECLARE _cnt INT DEFAULT 0;
    
    -- 반복문 시작
    _loop: LOOP
        -- cnt 증가
        SET _cnt = _cnt + 1;
        
        -- 이름 랜덤 선택
        SET _name = CASE FLOOR(RAND() * 9) + 1
            WHEN 1 THEN '나연'-- 1이면 나연
            WHEN 2 THEN '정연'-- 1이면 정연
            WHEN 3 THEN '모모'-- 1이면 모모
            WHEN 4 THEN '사나'-- 1이면 사나
            WHEN 5 THEN '지효'-- 1이면 지효
            WHEN 6 THEN '미나'-- 1이면 미나
            WHEN 7 THEN '다현'-- 1이면 다현
            WHEN 8 THEN '채영'-- 1이면 채영
            WHEN 9 THEN '쯔위'-- 1이면 쯔위
            END;
        
        -- 나이 랜덤 선택
        SET _age = (FLOOR(RAND() * 8) + 1) * 10;
        
        -- liking 테이블에 레코드 삽입
        INSERT INTO liking (name, age)
        VALUES (_name, _age);
        
        -- _last에 도달하면 반복문 종료
        IF _cnt = _last THEN
            LEAVE _loop;
        END IF;
    END LOOP _loop;
    
END$$

-- delimiter 초기화
DELIMITER ;

-- insert_liking 프로시저 호출
CALL insert_liking(1000);

-- liking 테이블의 모든 레코드 조회
SELECT * FROM liking;
