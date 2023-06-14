drop table if exists tupyo; -- tupyo 테이블이 존재한다면 테이블을 삭제해라

create table tupyo( -- tupyo 테이블을 생성해라
    kiho int, -- kiho는 int형이다
    age int, -- age는 int형이다
    foreign key(kiho) references hubo(kiho)
    -- kiho 컬럼에 대한 외래 키 제약 조건을 정의한다. 
    -- 이 외래 키는 tupyo 테이블의 kiho 컬럼을 hubo 테이블의 kiho 컬럼과 연결한다
);

desc hubo; -- hubo 테이블의 구조를 조회한다
