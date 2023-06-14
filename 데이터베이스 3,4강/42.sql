drop table if exists tupyo2;
-- 테이블이 있다면 지워라
create table tupyo2(
-- tupyo2 테이블을 생성
	kiho1 int, -- kiho1는 int형
    kiho2 int, -- kiho2는 int형
    kiho3 int, -- kiho3는 int형
    age int); -- age는 int형
desc tupyo2; -- tupyo2 테이블의 구조를 조회한다



-- select kiho as 투표한기호, age as 투표자연령대 from tupyo;
-- select kiho as 기호, name as 성명, gonyak as 공약 from hubo;
-- select kho, count(*) from tupyo group by kiho;