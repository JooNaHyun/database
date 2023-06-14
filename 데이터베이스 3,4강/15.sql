use kopo31;
select name,count(name),kor,count(kor),eng, count(eng) from examtable group by name, kor, eng;
