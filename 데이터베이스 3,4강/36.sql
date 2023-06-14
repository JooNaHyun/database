-- 'print_report' 프로시저를 삭제합니다.
DROP PROCEDURE IF EXISTS print_report;

-- 구분자를 '$$'로 설정합니다.
DELIMITER $$

-- 'print_report' 프로시저를 생성합니다.
CREATE PROCEDURE print_report(_start INTEGER, _count INTEGER)
BEGIN
    -- 필요한 변수들을 선언합니다.
    DECLARE _restart INTEGER;
    DECLARE _max INTEGER;
    DECLARE _kor INTEGER;
    DECLARE _eng INTEGER;
    DECLARE _mat INTEGER;
    DECLARE _sum INTEGER;
    DECLARE _avg FLOAT;
    DECLARE _total INTEGER;
    DECLARE _cnt INTEGER;
    
    -- examtable3 테이블의 전체 행 수를 구합니다.
    SELECT COUNT(*) INTO _total FROM examtable3;
    
    -- 시작 인덱스(_start)가 1보다 작으면 1로 설정합니다.
    IF (_start < 1) THEN
        SET _start = 1;
    END IF;
    
    -- 시작 인덱스(_start)가 전체 행 수(_total)를 넘어가면 마지막 인덱스로 설정합니다.
    IF (_start > _total / _count) THEN
        SET _start = _total / _count;
    END IF;
    
    -- 페이징 처리를 위해 재시작 인덱스(_restart)를 계산합니다.
    SET _restart = (_start - 1) * _count;
    
    -- 현재 페이지의 마지막 인덱스를 계산합니다.
    SET _max = _start * _count;
    
    -- examtable3 테이블에서 페이징 처리된 데이터를 조회하고 랭킹을 계산하여 결과를 출력합니다.
    SELECT t1.*,
    (SELECT COUNT(*) + 1 FROM examtable3 t2 WHERE (t2.kor + t2.eng + t2.mat) > (t1.kor + t1.eng + t1.mat)) AS ranking
    FROM examtable3 t1 LIMIT _restart, _count;

    -- 페이징 처리된 데이터의 국어 합계, 영어 합계, 수학 합계, 총합, 평균 등을 계산하여 출력합니다.
    SELECT SUM(a.kor) AS 국어합계, SUM(a.eng) AS 영어합계, SUM(a.mat) AS 수학합계, SUM(a.sum) AS 합계, sum(a.avg1) AS 평균합계,
           AVG(a.kor) AS 국어평균, AVG(a.eng) AS 영어평균, AVG(a.mat) AS 수학평균, AVG(a.sum) AS 합계평균, AVG(a.avg1) AS 평균
    FROM (SELECT * FROM examtable3 LIMIT _restart, _count) AS a;

    -- 처음부터 현재 페이지의 마지막 인덱스까지의 데이터의 국어 합계, 영어 합계, 수학 합계, 총합, 평균 등을 계산하여 출력합니다.
    SET _max = _start * _count;
	select sum(b.kor)as 국어합계,sum(b.eng)as 영어합계,sum(b.mat)as 수학합계, sum(b.sum)as 합계, sum(b.avg1) as 평균합계 ,
			avg(b.kor)as 국어평균,avg(b.eng)as 영어평균,avg(b.mat)as 수학평균, avg(b.sum)as 합계평균, avg(b.avg1) as 평균
            from(select * from examtable3 limit 0, _max)as b;
            
	


END$$

DELIMITER ; -- 구분자를 다시 ;으로 설정
CALL print_report(5, 25);
-- 페이지 수와 ,나와야할 개수를 인수로 받아 출력




