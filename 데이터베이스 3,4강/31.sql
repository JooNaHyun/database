-- insert_examtable2 프로시저가 있는 경우 삭제
DROP PROCEDURE IF EXISTS insert_examtable2;

-- insert_examtable1 프로시저 호출
CALL insert_examtable1(100);

-- examtable2 테이블이 있는 경우 삭제
DROP TABLE IF EXISTS examtable2;

-- examtable2 테이블 생성
CREATE TABLE examtable2 (
    name VARCHAR(20),
    id INTEGER,
    kor INTEGER,
    eng INTEGER,
    mat INTEGER,
    sum INTEGER,
    avg FLOAT,
    rank1 INTEGER
);

-- delimiter 설정
DELIMITER $$
SET sql_safe_updates = 0;

-- insert_examtable2 프로시저 생성
CREATE PROCEDURE insert_examtable2(_last INTEGER)
BEGIN
    -- 변수 선언
    DECLARE _name VARCHAR(20);
    DECLARE _id INTEGER;
    DECLARE _kor INTEGER;
    DECLARE _eng INTEGER;
    DECLARE _mat INTEGER;
    DECLARE _sum INTEGER;
    DECLARE _avg FLOAT;
    DECLARE _rank INTEGER;
    DECLARE _cnt INTEGER;
    
    -- 변수 초기화
    SET _cnt = 0;
    
    -- examtable2에서 id가 0보다 큰 레코드 삭제
    DELETE FROM examtable2 WHERE id > 0;
    
    -- 반복문 시작
    _loop: LOOP
        -- cnt 증가
        SET _cnt = _cnt + 1;
        -- 이름 생성
        SET _name = CONCAT('홍길', CAST(_cnt AS CHAR(4)));       
        -- id 생성
        SET _id = 209900 + _cnt;
        -- examtable에서 kor, eng, mat 값을 가져와 변수에 할당
        SELECT kor, eng, mat INTO _kor, _eng, _mat FROM examtable WHERE id = _id;
        
        -- kor, eng, mat의 합 계산
        SET _sum = _kor + _eng + _mat;
        
        -- 평균 계산
        SET _avg = _sum / 3.0;
        
        -- examtable에서 (kor + eng + mat) 값이 현재 합보다 큰 레코드의 개수를 구하여 rank에 할당
        SELECT COUNT(*) + 1 INTO _rank FROM examtable WHERE (kor + eng + mat) > (_kor + _eng + _mat);
        
        -- examtable2에 레코드 삽입
        INSERT INTO examtable2 VALUES (_name, _id, _kor, _eng, _mat, _sum, _avg, _rank);
        
        -- _last에 도달하면 반복문 종료
        IF _cnt = _last THEN
            LEAVE _loop;
        END IF;
    END LOOP _loop;
END$$

-- delimiter 초기화
DELIMITER ;

-- insert_examtable2 프로시저 호출
CALL insert_examtable2(100);

-- examtable2의 모든 레코드를 rank1을 기준으로 오름차순 정렬하여 조회
SELECT * FROM examtable2 ORDER BY rank1 ASC;
