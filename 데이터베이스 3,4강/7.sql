
use kopo31;
-- kopo31 데이터베이스를 사용
select name, count(name) from examtable group by name;
-- examtable에서 name으로 그룹화한 후, 각 그룹별로 name의 개수를 세어 출력
-- 각 고유한 name 값의 빈도를 계산하여 조회

