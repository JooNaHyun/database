use kopo31;
-- kopo31이라는 데이터베이스 사용
drop table if exists examtable;
-- 만약 examtable이라는 테이블이 존재한다면 삭제한다
-- examtable 테이블을 생성한다.
CREATE TABLE examtable(
name varchar(20), -- 이름 (문자열, 최대 길이 20)
id int not null primary key, -- 학번 (정수, 필수 값, 기본 키)
kor int, -- 국어 점수 (정수)
eng int, -- 영어 점수 (정수)
mat int -- 수학 점수 (정수)
);
-- examtable 테이블의 구조를 확인한다.
DESC examtable;