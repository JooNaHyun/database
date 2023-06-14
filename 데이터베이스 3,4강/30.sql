-- get_rank 함수가 있는 경우 삭제
DROP FUNCTION IF EXISTS get_rank;

-- delimiter 설정
DELIMITER $$

-- get_rank 함수 생성
CREATE FUNCTION get_rank(sum_val INTEGER) RETURNS INTEGER
BEGIN
    -- 변수 선언
    DECLARE rank_val INTEGER;
    
    -- examtable에서 (kor + eng + mat) 값이 sum_val보다 큰 레코드의 개수를 구하여 rank_val에 할당
    SELECT COUNT(*) + 1 INTO rank_val FROM examtable WHERE (kor + eng + mat) > sum_val;
    
    -- rank_val 반환
    RETURN rank_val;
END $$

-- delimiter 초기화
DELIMITER ;

-- examtable의 레코드를 조회하고 get_rank 함수를 사용하여 _rank 값을 계산하여 출력
SELECT *, get_rank(kor + eng + mat) AS _rank FROM examtable ORDER BY _rank ASC;
