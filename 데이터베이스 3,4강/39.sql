delete from hubo where kiho>0;
-- hubo테이블에서 kiho가 0이상인 데이터를 삭제
insert into hubo values(1,"나연","정의사회 구현");-- 입력
insert into hubo values(2,"정연","모두 1억 줌");-- 입력
insert into hubo values(3,"모모","월화수목토토일");-- 입력
insert into hubo values(4,"사나","살맛나는 세상, 비계맛도 조금");-- 입력
insert into hubo values(5,"지효","먹다 지쳐 잠드는 세상");-- 입력
insert into hubo values(6,"미나","나 뽑으면 너하고 싶은 거 다해");-- 입력
insert into hubo values(7,"다현","장바구니 다 사줄께");-- 입력
insert into hubo values(8,"채영","노는 게 젤 조은 뽀로로세상 구현");-- 입력
insert into hubo values(9,"쯔위","커플지옥 싱글 파라다이스");-- 입력
select kiho as 기호, name as 성명, gongyak as 공약 from hubo;
-- hubo테이블에서 kiho(별칭 기호), name(별칭 성명), gongyak(별칭 공약)을 조회해라
