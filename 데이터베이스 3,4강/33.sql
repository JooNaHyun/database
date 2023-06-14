DROP FUNCTION IF EXISTS voting_rate;
-- voting_rate함수 생성

DELIMITER $$
-- 구분자를 $$으로 설정
CREATE FUNCTION voting_rate(_name VARCHAR(20)) RETURNS FLOAT
-- _name을 인자값으로 받는 voting_rate함수 생성 (float형으로 리턴)
BEGIN
-- 시작
    DECLARE _rate FLOAT;
    -- _rate를 flat형으로 선언
    SELECT COUNT(name) / (SELECT COUNT(*) FROM liking) * 100 INTO _rate
    -- 선호도 테이블에서 이름이 같은 것끼리 선호도 비율 조사 (득표수 /전체 투표자 수)* 100을 조회해서 _rate에 넣어준다.
    FROM liking
    WHERE name = _name;

    RETURN _rate;
    -- _rate를 리턴한다.
END$$

DELIMITER ;
-- 구분자를 다시 ;으로 설정
-- liking 테이블에서 이름별로 득표수와 투표율을 조회하는 쿼리
SELECT
    name,
    COUNT(age) AS 득표수,  -- 각 이름별로 득표수를 계산하여 득표수라는 별칭으로 출력
    voting_rate(name) AS rate  -- voting_rate 함수를 사용하여 각 이름별로 투표율을 계산하여 rate라는 별칭으로 출력
FROM liking
GROUP BY name  -- 이름별로 그룹화
ORDER BY rate DESC;  -- 투표율을 내림차순으로 정렬하여 결과를 반환
