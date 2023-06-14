use kopo31;
-- kopo31이라는 데이터베이스 사용


select * from examtable;
#examtable에 있는 모든 데티어를 조회해라
select * from examtable order by kor;
#examtable에 있는 모든 데이터를 국어 점수를 기준으로 정렬해라
select * from examtable order by eng;
#examtable에 있는 모든 데이터를 영어 점수를 기준으로 정렬해라
select * from examtable order by kor,eng;
#examtable에 있는 모든 데이터를 국어와 영어 점수를 기준으로 정렬해라
select * from examtable order by kor asc;
#examtable에 있는 모든 데이터를 국어 점수를 기준으로 오름차순 정렬해라
select * from examtable order by kor desc;
#examtable에 있는 모든 데이터를 국어 점수를 기준으로 내림차순 정렬해라



