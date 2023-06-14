use kopo31;
select name, count(name),count(name)/(select count(*) from tupyo)*100 as rate from tupyo group by name;
