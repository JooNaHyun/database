-- 'print_wifi' 프로시저를 삭제
DROP PROCEDURE IF EXISTS print_wifi;

-- 구분자를 '$$'로 설정
DELIMITER $$

-- 'print_wifi' 프로시저를 생성
CREATE PROCEDURE print_wifi(_start INTEGER, _number INTEGER)
BEGIN
    -- 필요한 변수들을 선언
    DECLARE _rstart INTEGER; -- 시작 페이지 인덱스
    DECLARE _lat DOUBLE;
    DECLARE _lng DOUBLE;
    DECLARE _cnt INTEGER;
    DECLARE _total INTEGER; -- 총 행 수
    
    -- freewifi 테이블에서 전체 행 수를 구한다
    SELECT COUNT(*) INTO _total FROM freewifi;
    
    -- 시작 인덱스(_start)가 1보다 작으면 1로 설정
    IF (_start < 1) THEN
        SET _start = 1;
    END IF;
    
    -- 시작 인덱스(_start)가 전체 페이지 수를 넘어가면 마지막 페이지로 설정
    IF (_start > CEIL(_total / _number)) THEN
        SET _start = CEIL(_total / _number);
    END IF;
    
    -- 현재 페이지의 첫번째 인덱스를 계산
    SET _rstart = (_start - 1) * _number;
    
    -- 초기 위도와 경도 값을 설정
    SET _lat = 37.3860521;
    SET _lng = 127.1214038;
    
    -- 현재 페이지의 내용을 조회하여 출력
    SELECT numberid, plaxe_addr_land, latitude, longitude, SQRT(POWER(latitude - _lat, 2) + POWER(longitude - _lng, 2)) AS 거리
    FROM freewifi LIMIT _rstart, _number;
    
END$$

DELIMITER ;

-- print_wifi 프로시저를 호출합니다. 인자로 500과 25를 전달
CALL print_wifi(700, 25);
