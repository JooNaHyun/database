select-- 밑의 서브쿼리들을 조회해라
(select count(*) from tupyo2 where kiho1 =1 or kiho2=1 or kiho3 = 1) as "나연",
-- tupyo2 테이블에서 kiho1, kiho2, kiho3 중 하나가 1과 일치하는 레코드의 수를 세는 서브쿼리
(select count(*) from tupyo2 where kiho1 =2 or kiho2=2 or kiho3 = 2) as "정연",
-- tupyo2 테이블에서 kiho1, kiho2, kiho3 중 하나가 2과 일치하는 레코드의 수를 세는 서브쿼리
(select count(*) from tupyo2 where kiho1 =3 or kiho2=3 or kiho3 = 3) as "모모",
-- tupyo2 테이블에서 kiho1, kiho2, kiho3 중 하나가 3과 일치하는 레코드의 수를 세는 서브쿼리
(select count(*) from tupyo2 where kiho1 =4 or kiho2=4 or kiho3 = 4) as "사나",
-- tupyo2 테이블에서 kiho1, kiho2, kiho3 중 하나가 4과 일치하는 레코드의 수를 세는 서브쿼리
(select count(*) from tupyo2 where kiho1 =5 or kiho2=5 or kiho3 = 5) as "지효",
-- tupyo2 테이블에서 kiho1, kiho2, kiho3 중 하나가 5과 일치하는 레코드의 수를 세는 서브쿼리
(select count(*) from tupyo2 where kiho1 =6 or kiho2=6 or kiho3 = 6) as "미나",
-- tupyo2 테이블에서 kiho1, kiho2, kiho3 중 하나가 6과 일치하는 레코드의 수를 세는 서브쿼리
(select count(*) from tupyo2 where kiho1 =7 or kiho2=7 or kiho3 = 7) as "다현",
-- tupyo2 테이블에서 kiho1, kiho2, kiho3 중 하나가 7과 일치하는 레코드의 수를 세는 서브쿼리
(select count(*) from tupyo2 where kiho1 =8 or kiho2=8 or kiho3 = 8) as "채영",
-- tupyo2 테이블에서 kiho1, kiho2, kiho3 중 하나가 8과 일치하는 레코드의 수를 세는 서브쿼리
(select count(*) from tupyo2 where kiho1 =9 or kiho2=9 or kiho3 = 9) as "쯔위";
-- tupyo2 테이블에서 kiho1, kiho2, kiho3 중 하나가 9과 일치하는 레코드의 수를 세는 서브쿼리
