DROP view IF EXISTS exmview;
-- exmview라는 뷰가 존재하는 경우 해당 뷰를 삭제
create view exmview(name, id, kor, eng, mat, tot, ave, ran)
as select *,
b.kor+b.eng+b.mat, 
-- kor, eng, mat 열의 합계를 계산하여 tot 열로 선택합니다.
(b.kor+b.eng+b.mat)/3, 
-- kor, eng, mat 열의 평균을 계산하여 ave 열로 선택합니다.
(select count(*)+1 from examtable as a
	where(a.kor+a.eng+a.mat) > (b.kor+b.eng +b.mat)) 
    -- 현재 행의 총점보다 높은 총점을 가진 행의 수를 계산하여 ran 열로 선택합니다.
    from examtable as b; 
    -- examtable의 각 행에 대해 뷰를 생성합니다.


select * from exmview; -- exmview 뷰의 모든 열을 선택
select name, ran from exmview; -- exmview 뷰에서 name과 ran 열을 선택

select * from exmview where ran > 5; -- exmview 뷰에서 ran 값이 5보다 큰 행을 선택
insert into exmview values("나연", 309933, 100, 100, 100, 300, 100, 1); -- exmview 뷰에 새로운 행을 삽입
