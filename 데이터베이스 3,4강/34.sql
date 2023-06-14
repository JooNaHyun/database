-- voting_rate1 함수를 삭제
DROP FUNCTION IF EXISTS voting_rate1;
-- delimiter 설정
DELIMITER $$
-- voting_rate1 함수 생성
CREATE FUNCTION voting_rate1(_age INTEGER) RETURNS FLOAT
BEGIN
    DECLARE _rate FLOAT;
    -- 득표율 계산 쿼리
    SELECT COUNT(age) / (SELECT COUNT(*) FROM liking) * 100 INTO _rate
    FROM liking
    WHERE age = _age;
    -- 계산된 득표율을 반환
    RETURN _rate;
END$$

-- delimiter 초기화
DELIMITER ;

-- 연령대별 득표수와 득표율을 조회하는 쿼리
SELECT
    age AS 연령대,  -- age를 연령대로 출력
    COUNT(age) AS 득표수,  -- 해당 연령대의 득표수를 계산하여 득표수라는 별칭으로 출력.
    voting_rate1(age) AS 득표율  -- voting_rate1 함수를 사용하여 해당 연령대의 득표율을 계산하여 득표율이라는 별칭으로 출력
FROM liking
WHERE name = '나연'  -- 이름이 '나연'인 데이터만 조회
GROUP BY age  -- 연령대별로 그룹화
ORDER BY 득표율 DESC;  -- 득표율을 내림차순으로 정렬하여 결과를 반환
