use kopo31;

select * from examtable order by name desc;
#examtable에 있는 모든 데이터를 이름를 기준으로 내림차순 정렬해라
select * from examtable order by mat desc;
#examtable에 있는 모든 데이터를 수학점수를 기준으로 내림차순 정렬해라
select *,eng+kor+mat , (kor+eng+mat)/3 from examtable;
#examtable에서 총점과 평균을 조회해라
select *,eng+kor+mat , (kor+eng+mat)/3 from examtable order by eng +kor+mat desc;
#examtable에서 총점과 평균을 조회해서 총점을 기준으로 내림차순 정렬해라
select *,kor+eng+mat as total, (kor+eng+mat)/3 as average from examtable order by total desc;
#examtable에서 총점의 별칭을 total 평균의 별칭을 average라고 정하고, total을 기준으로 내림차순 정렬해라
select name as 이름, id as 학번, kor as 국어, eng as 영어, mat as 수학, kor+eng+mat as 합계,
	(kor+eng+mat)/3 as 평균 from examtable order by 합계 desc;
#examtable에서 name의 별칭을 이름 id의 별칭을 g학번, kor의 별칭을 국어, eng의 별칭을 영어, mat의 별칭을 수학
#, 총점의 별칭을 총점 평균의 별칭을 평균이라고 정하고, 합계를 기준으로 내림차순 정렬해라
