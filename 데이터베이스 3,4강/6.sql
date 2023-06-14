use kopo31;
-- kopo31이라는 데이터 베이스를 사용
select * from examtable group by name;
-- "select * from examtable group by name;" 쿼리에서 "group by" 구문을 사용하였지만,
-- 그룹화된 컬럼 이외의 컬럼에 대한 집계 함수가 명시되지 않아서  오류 발생
