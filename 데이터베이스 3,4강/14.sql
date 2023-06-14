use kopo31;
select kor, count(kor), eng, count(eng) from examtable group by kor, eng;
