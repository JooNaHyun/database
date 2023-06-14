use kopo31;
select name as 이름, id as 학번, kor as 국어, eng as 영어, mat as 수학, kor+eng+mat as 합계,
	(kor+eng+mat)/3 as 평균 from examtable order by 합계 desc;
-- examtable의 이름을 name으로 별칭 지정, id를 학번으로 별칭 지정, kor을 국어로 별칭 지정, 
-- eng를 영어로 별칭지정, mat를 수학으로 별칭 지정 eng+kor+mat한 값(별칭으로 합계 지정), 
-- kor+eng+mat/3한 값(별칭으로 평균 지정)해서 합계 기준으로 내림차순해서 조회해라