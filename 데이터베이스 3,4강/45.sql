select
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
(select count(*) from tupyo2 where kiho1 =9 or kiho2=9 or kiho3 = 9) as "쯔위",
-- tupyo2 테이블에서 kiho1, kiho2, kiho3 중 하나가 9과 일치하는 레코드의 수를 세는 서브쿼리
(select count(*) from tupyo2 where kiho1 =1 or kiho2=1 or kiho3 = 1)+
-- kiho1, kiho2, kiho3 중 하나가 1과 일치하는 레코드의 수를 계산
(select count(*) from tupyo2 where kiho1 =2 or kiho2=2 or kiho3 = 2)+
-- kiho1, kiho2, kiho3 중 하나가 2과 일치하는 레코드의 수를 계산
(select count(*) from tupyo2 where kiho1 =3 or kiho2=3 or kiho3 = 3)+
-- kiho1, kiho2, kiho3 중 하나가 3과 일치하는 레코드의 수를 계산
(select count(*) from tupyo2 where kiho1 =4 or kiho2=4 or kiho3 = 4)+
-- kiho1, kiho2, kiho3 중 하나가 4과 일치하는 레코드의 수를 계산
(select count(*) from tupyo2 where kiho1 =5 or kiho2=5 or kiho3 = 5)+
-- kiho1, kiho2, kiho3 중 하나가 5과 일치하는 레코드의 수를 계산
(select count(*) from tupyo2 where kiho1 =6 or kiho2=6 or kiho3 = 6)+
-- kiho1, kiho2, kiho3 중 하나가 6과 일치하는 레코드의 수를 계산
(select count(*) from tupyo2 where kiho1 =7 or kiho2=7 or kiho3 = 7)+
-- kiho1, kiho2, kiho3 중 하나가 7과 일치하는 레코드의 수를 계산
(select count(*) from tupyo2 where kiho1 =8 or kiho2=8 or kiho3 = 8)+
-- kiho1, kiho2, kiho3 중 하나가 8과 일치하는 레코드의 수를 계산
(select count(*) from tupyo2 where kiho1 =9 or kiho2=9 or kiho3 = 9) as "총합",
-- kiho1, kiho2, kiho3 중 하나가 9과 일치하는 레코드의 수를 계산

(select count(*) from tupyo2 where kiho1 =kiho2 or kiho2=kiho3 or kiho3 = kiho1) as "2중복",
-- kiho1과 kiho2 중 적어도 하나와 일치하거나, kiho2와 kiho3 중 적어도 하나와 일치하거나, kiho3과 kiho1 중 적어도 하나와 일치하는 레코드의 수를 계산하고,
-- 이를 "2중복"이라는 열로 표시
(select count(*) from tupyo2 where kiho1 =kiho2 and kiho1= kiho3) as "3중복";
-- kiho1, kiho2, kiho3이 모두 일치하는 레코드의 수를 계산하고, 이를 "3중복"이라는 열로 표시
