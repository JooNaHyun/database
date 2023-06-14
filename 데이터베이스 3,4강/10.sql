
-- kopo31 데이터베이스를 사용합니다.
use kopo31;
-- examtable에서 데이터를 가져와서 eng 열을 기준으로 그룹화합니다.
-- 각 그룹의 개수를 세기 위해 count(kor) 함수를 사용합니다.
select kor, count(kor) from examtable group by eng;