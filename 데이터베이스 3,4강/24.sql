use kopo31;
select age *10 as 연령대, count(age) as 득표수, count(age)/(select count(*) from tupyo where name = "나연")*100 as 득표율 from tupyo where name = "나연" group by age order by 득표수 desc;