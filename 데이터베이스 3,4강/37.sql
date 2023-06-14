drop table if exists hubo;
-- hubo 테이블이 존재한다면 테이블을 삭제해라

create table hubo (
    kiho int not null,
    -- kiho는 int형이고, 비어있으면 안된다.
    name varchar(10),
    -- name은 varchar형이고 최대 크기는 10이다.
    gongyak varchar(50),
    -- gongyak은 varchar형이고 최대 크기는 50이다.
    primary key (kiho),
    -- kiho를 primary key로 지정
    index (kiho)
);
-- hubo 테이블을 생성해라

desc hubo;
-- hubo 테이블의 스키마(구조)를 보여줘라
