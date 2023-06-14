use kopo31;

select eng, count(eng) from examtable group by eng having count(eng)>1;