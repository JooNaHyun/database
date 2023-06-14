-- Answer 테이블을 삭제하고, 이미 존재하는 경우에만 실행합니다.
drop table if exists Answer;

-- Answer 테이블을 생성합니다.
-- subjectID는 주요 키(primary key)이며, not null 속성을 가집니다.
-- a01부터 a20까지의 열(column)은 int 자료형을 가집니다.
create table Answer(
subjectID int not null primary key,
a01 int, a02 int, a03 int, a04 int, a05 int, a06 int, a07 int, a08 int, a09 int, a10 int, 
a11 int, a12 int, a13 int, a14 int, a15 int, a16 int, a17 int, a18 int, a19 int, a20 int);

-- Testing 테이블을 삭제하고, 이미 존재하는 경우에만 실행합니다.
drop table if exists Testing;

-- Testing 테이블을 생성.
-- subjectID와 stu_id는 주요 키(primary key)이며, stu_name은 varchar(20) 자료형을 가진다.
-- a01부터 a20까지의 열(column)은 int 자료형을 가진다.
create table Testing(
subjectID int not null,
stu_name varchar(20),
stu_id int not null,
a01 int, a02 int, a03 int, a04 int, a05 int, a06 int, a07 int, a08 int, a09 int, a10 int, 
a11 int, a12 int, a13 int, a14 int, a15 int, a16 int, a17 int, a18 int, a19 int, a20 int,
primary key(subjectID, stu_id));

-- Scoring 테이블을 삭제하고, 이미 존재하는 경우에만 실행합니다.
drop table if exists Scoring;

-- Scoring 테이블을 생성합니다.
-- subjectID는 주요 키(primary key)이며, not null 속성을 가집니다.
-- stu_name은 varchar(20) 자료형을 가지며, stu_id는 주요 키(primary key)이며, not null 속성을 가집니다.
-- a01부터 a20까지의 열(column)은 int 자료형을 가집니다.
-- score는 int 자료형을 가집니다.
create table Scoring(
subjectID int not null,
stu_name varchar(20),
stu_id int not null,
a01 int, a02 int, a03 int, a04 int, a05 int, a06 int, a07 int, a08 int, a09 int, a10 int, 
a11 int, a12 int, a13 int, a14 int, a15 int, a16 int, a17 int, a18 int, a19 int, a20 int,
score int,
primary key(subjectID, stu_id));

-- Reporttable 테이블을 삭제하고, 이미 존재하는 경우에만 실행합니다.
drop table if exists Reporttable;

-- Reporttable 테이블을 생성합니다.
-- stu_name은 varchar(20) 자료형을 가지며, stu_id는 주요 키(primary key)이며, not null 속성을 가집니다.
-- kor, eng, mat은 int 자료형을 가집니다.
create table Reporttable(
stu_name varchar(20),
stu_id int not null primary key,
kor int, eng int, mat int);

-- Answer 테이블의 구조를 조회합니다.
DESC Answer;
-- Testing 테이블의 구조를 조회합니다.
DESC Testing;
-- Scoring 테이블의 구조를 조회합니다.
DESC Scoring;
-- Reporttable 테이블의 구조를 조회합니다.
DESC Reporttable;
