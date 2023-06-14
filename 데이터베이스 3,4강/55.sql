use kopo31;
-- 'reservation' 테이블이 이미 존재하면 삭제합니다.
DROP TABLE IF EXISTS reservation;

-- 'reservation' 테이블을 생성합니다.
CREATE TABLE reservation (
    name VARCHAR(20),            -- 예약자 이름을 저장하는 열이다. 최대 길이는 20이다.
    reserve_date VARCHAR(20),    -- 예약 날짜를 저장하는 열이다. 최대 길이는 20이다.
    room INT NOT NULL, 			 -- 객실 번호를 저장하는 열이다. 비어 있을 수 없는(NotNull) 정수형(INT)이다.
    address varchar(20), 		 -- 조소를 저장하는 열이다.
    tel VARCHAR(20),             -- 전화번호를 저장하는 열이다. 최대 길이는 20이다.
    ipgum_name VARCHAR(20),      -- 입금자명을 저장하는 열이다. 최대 길이는 20이다.
    memo VARCHAR(20),            -- 메모를 저장하는 열이다. 최대 길이는 20이다.
    input_date date      -- 입력 날짜를 저장하는 열이다. 최대 길이는 20이다.
);
desc reservation; -- reservation 테이블의 구조를 확인

-- "나연"의 예약 정보 삽입
insert into reservation values("나연","2023-05-25",2,"서울","010-0101-0101","나연","따듯한방 주세요",NOW());
-- "정연"의 예약 정보 삽입
insert into reservation values("정연","2023-05-25",3,"서울","010-0101-0101","나연","따듯한방 주세요",NOW());
-- "모모"의 예약 정보 삽입
insert into reservation values("모모","2023-05-26",1,"서울","010-0101-0101","나연","따듯한방 주세요",NOW());
-- "사나"의 예약 정보 삽입
insert into reservation values("사나","2023-05-27",1,"서울","010-0101-0101","나연","따듯한방 주세요",NOW());
-- "지효"의 예약 정보 삽입
insert into reservation values("지효","2023-05-28",1,"서울","010-0101-0101","나연","따듯한방 주세요",NOW());
-- reservation 테이블의 모든 데이터 조회
select * from reservation;

-- revstat_calc 저장 프로시저 삭제 (이미 존재하는 경우에만 삭제)
DROP PROCEDURE IF EXISTS revstat_calc;
-- 쿼리 분리자를 $$로 변경
DELIMITER $$
-- revstat_calc 저장 프로시저 생성
CREATE PROCEDURE revstat_calc()
BEGIN
    -- 변수 선언
    DECLARE _date DATE;
    DECLARE _cnt INTEGER;
    DECLARE _room1 VARCHAR(20);
    DECLARE _room2 VARCHAR(20);
    DECLARE _room3 VARCHAR(20);
    
    -- 변수 초기화
    SET _date = CURDATE();
    SET _cnt = 0;
    
    -- reserv_stat 테이블 삭제 (이미 존재하는 경우에만 삭제)
    DROP TABLE IF EXISTS reserv_stat;
    
    -- reserv_stat 테이블 생성
    CREATE TABLE reserv_stat (
        reserve_date DATE NOT NULL,
        room1 VARCHAR(20),
        room2 VARCHAR(20),
        room3 VARCHAR(20),
        PRIMARY KEY (reserve_date)
    );
        
    -- 루프 시작
    _loop: LOOP
        -- _cnt 변수 증가
        SET _cnt = _cnt + 1;
        
        -- _date 변수에 1일을 더함
        SET _date = DATE_ADD(_date, INTERVAL 1 DAY);
        
        -- 방 예약 가능으로 초기화
        SET _room1 = "예약 가능";
        SET _room2 = "예약 가능";
        SET _room3 = "예약 가능";
        
        -- 각 방의 예약 정보 조회
        SELECT name INTO _room1 FROM reservation WHERE room = 1 AND reserve_date = _date;
        SELECT name INTO _room2 FROM reservation WHERE room = 2 AND reserve_date = _date;
        SELECT name INTO _room3 FROM reservation WHERE room = 3 AND reserve_date = _date;
        
        -- reserv_stat 테이블에 데이터 삽입
        INSERT INTO reserv_stat VALUES (_date, _room1, _room2, _room3);
        
        -- _cnt가 31일 때 루프 종료
        IF _cnt = 31 THEN
            LEAVE _loop;
        END IF;
    END LOOP _loop;
END $$

-- 쿼리 분리자를 ;로 변경
DELIMITER ;

-- revstat_calc 저장 프로시저 호출
CALL revstat_calc();

-- reserv_stat 테이블의 모든 데이터 조회
SELECT * FROM reserv_stat;


	
        
    
