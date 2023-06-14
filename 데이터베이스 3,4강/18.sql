use kopo31;
drop table if exists examtable;
create table examtable(
	name varchar(20),
    id int not null primary key,
    kor int, eng int, mat int);
desc examtable;
