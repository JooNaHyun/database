-- kopo31 데이터베이스를 사용합니다.
USE kopo31;
-- id가 0보다 큰 examtable의 데이터를 삭제합니다.
DELETE FROM examtable WHERE id > 0;
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("나연",209901, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("정연",209902, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("모모",209903, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("사나",209904, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("지효",209905, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("미나",209906, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("다현",209907, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("채영",209908, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("쯔위",209909, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("송가인",209910, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("나연",209911, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("정연",209912, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("모모",209913, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("사나",209914, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("지효",209915, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("미나",209916, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("다현",209917, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("채영",209918, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("쯔위",209919, rand()*100, rand()*100,rand()*100);
-- 이름, 학번을 입력하고 국어, 영어, 수학 점수는 100이하의 랜덤 수로 입력
INSERT INTO examtable VALUE("송가인",209920, rand()*100, rand()*100,rand()*100);
select * from examtable