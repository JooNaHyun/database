drop table if exists examtableEX; -- examtableEX 테이블이 존재하면 삭제합니다.

create table examtableEx(
	name varchar(20),
    id int not null primary key,
    kor int, eng int, mat int, sum int, ave double, ranking int); -- examtableEx 테이블을 생성합니다.
-- examtableEx 테이블을 생성합니다. 열은 name(문자열), id(정수, 기본키), kor(정수), eng(정수), mat(정수), sum(정수), ave(실수), ranking(정수)로 구성
desc examtableEx; -- examtableEx 테이블의 구조를 확인

    
insert into examtableEx
    select *,b.kor+b.eng+b.mat,(b.kor+b.eng+b.mat)/3,
   (select count(*)+1 from examtable as a where (a.kor+a.eng+a.mat)>(b.kor+b.eng+b.mat))
    from examtable as b;
   -- examtableEx 테이블에 데이터를 삽입 
   -- examtable 테이블의 모든 열을 선택하고, b.kor+b.eng+b.mat로 합계를 계산하고, (b.kor+b.eng+b.mat)/3로 평균을 계산  
   -- (select count(*)+1 from examtable as a where (a.kor+a.eng+a.mat) > (b.kor+b.eng+b.mat))로 랭킹을 계산 이를 examtableEx 테이블에 삽입
    
    select * from examtableEx order by ranking desc;
    -- ranking을 기준으로 내림차순 정렬하여 examtable에 모든 데이터를 조회해라