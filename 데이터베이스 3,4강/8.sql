use kopo31;
-- kopo31 데이터베이스를 사용합니다.
select * from examtable group by kor;
-- group by" 구문을 사용할 때, 그룹화된 컬럼 이외의 컬럼들은 어떤 값을 선택해야 하는지 명시되지 않았으므로 오류 발생
