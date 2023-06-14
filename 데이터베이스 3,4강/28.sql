-- 삭제할 procedure가 있는 경우 삭제
DROP PROCEDURE IF EXISTS insert_examtable;

-- delimiter 설정
DELIMITER $$

-- insert_examtable procedure 생성
CREATE PROCEDURE insert_examtable(_last INTEGER)
BEGIN
    -- 선언된 변수들
    DECLARE _name VARCHAR(20);
    DECLARE _id INTEGER;
    DECLARE _cnt INTEGER;
    SET _cnt = 0;

    -- id가 0보다 큰 레코드 삭제
    DELETE FROM examtable WHERE id > 0;

    -- 반복문 시작
    _loop: LOOP
        SET _cnt = _cnt + 1;
        SET _name = CONCAT("홍길", CAST(_cnt AS CHAR(4)));
        SET _id = 209900 + _cnt;

        -- examtable에 레코드 삽입
        INSERT INTO examtable VALUES (_name, _id, RAND() * 100, RAND() * 100, RAND() * 100);

        -- _last에 도달하면 반복문 종료
        IF _cnt = _last THEN
            LEAVE _loop;
        END IF;
    END LOOP _loop;

END $$

-- delimiter 초기화
DELIMITER ;

-- insert_examtable procedure 호출
CALL insert_examtable(1000);

-- examtable의 모든 레코드 출력
SELECT * FROM examtable;

-- examtable의 30번째 레코드부터 59번째 레코드까지 출력
SELECT *, kor + eng + mat AS sum, (kor + eng + mat) / 3 AS avg FROM examtable LIMIT 30, 59;
