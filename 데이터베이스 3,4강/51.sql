insert into Scoring
   select b.subjectID, b.stu_name, b.stu_id,
    (a.a01 = b.a01)as s01, 
    (a.a02 = b.a02)as s02,
    (a.a03 = b.a03)as s03,
    (a.a04 = b.a04)as s04,
    (a.a05 = b.a05)as s05,
    (a.a06 = b.a06)as s06,
    (a.a07 = b.a07)as s07,
    (a.a08 = b.a08)as s08,
    (a.a09 = b.a09)as s09,
    (a.a10 = b.a10)as s10,
    (a.a11 = b.a11)as s11,
    (a.a12 = b.a12)as s12,
    (a.a13 = b.a13)as s13,
    (a.a14 = b.a14)as s14,
    (a.a15 = b.a15)as s15,
    (a.a16 = b.a16)as s16,
    (a.a17 = b.a17)as s17,
    (a.a18 = b.a18)as s18,
    (a.a19 = b.a19)as s19,
    (a.a20 = b.a20)as s20,
    ((a.a01 = b.a01) + (a.a02 = b.a02) + (a.a03 = b.a03) + (a.a04 = b.a04) + (a.a05 = b.a05) +
    (a.a06 = b.a06) + (a.a07 = b.a07) + (a.a08 = b.a08) + (a.a09 = b.a09) + (a.a10 = b.a10) +
    (a.a11 = b.a11) + (a.a12 = b.a12) + (a.a13 = b.a13) + (a.a14 = b.a14) + (a.a15 = b.a15) + 
    (a.a16 = b.a16) + (a.a17 = b.a17) + (a.a18 = b.a18) + (a.a19 = b.a19) + (a.a20 = b.a20))*5 as sum
   from Answer as a, Testing as b
   where a.subjectID = b.subjectID;
   select * from Scoring where subjectID = 1;
   select * from Scoring where subjectID = 2;
   select * from Scoring where subjectID = 3;
-- Scoring 테이블에 데이터를 삽입
-- Answer 테이블과 Testing 테이블을 조인하여 값을 선택
-- subjectID, stu_name, stu_id는 Testing 테이블의 값으로 가져오고,
-- a01부터 a20까지의 열과 비교하여 정답과 일치하면 1, 불일치하면 0으로 표시
-- 각 문제에 대한 일치 여부를 s01부터 s20까지의 열에 저장.
-- 마지막으로 일치한 문제의 수를 계산하여 sum 열에 저장
-- 정답을 맞춘 문제의 개수에 5를 곱하여 score를 계산