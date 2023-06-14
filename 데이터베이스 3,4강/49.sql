-- Answer 테이블에 값을 삽입합니다.
-- 첫 번째 행에 값을 삽입합니다: subjectID=1, a01=3, a02=4, ..., a19=3, a20=4
insert into Answer values(1,3,4,1,2,3,4,1,1,2,3,4,4,3,3,4,2,1,2,3,4);

-- 두 번째 행에 값을 삽입합니다: subjectID=2, a01=4, a02=4, ..., a19=3, a20=3
insert into Answer values(2,4,4,4,2,3,2,3,4,3,4,1,2,3,4,1,1,2,3,3,3);

-- 세 번째 행에 값을 삽입합니다: subjectID=3, a01=3, a02=4, ..., a19=4, a20=1
insert into Answer values(3,3,4,2,3,4,1,2,3,4,3,4,1,2,3,1,3,4,4,1,1);

-- Answer 테이블의 모든 데이터를 조회합니다.
select * from Answer;
