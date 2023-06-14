select kiho, count(*) from tupyo group by kiho; 
-- "tupyo" 테이블에서 "kiho" 컬럼을 기준으로 그룹화하고, 각 그룹별로 레코드 수를 계산한다

select b.name, b.gongyak, count(a.kiho)
    from tupyo as a, hubo as b
    where a.kiho = b.kiho
    group by a.kiho; 
    -- "tupyo" 테이블과 "hubo" 테이블을 조인하여 "a.kiho"와 "b.kiho"가 일치하는 레코드를 찾고, 
    -- "b.name", "b.gonyak" 컬럼과 해당 그룹의 "a.kiho" 레코드 수를 반환한다

    
    
select
    (select name from hubo where kiho = a.kiho), 
    -- "hubo" 테이블에서 "kiho" 값이 "a.kiho"와 일치하는 레코드의 "name" 값을 반환
    (select gongyak from hubo where kiho = a.kiho), 
    -- "hubo" 테이블에서 "kiho" 값이 "a.kiho"와 일치하는 레코드의 "gongyak" 값을 반환
    count(a.kiho) 
    -- "tupyo" 테이블에서 "kiho" 컬럼의 레코드 수를 계산
from tupyo as a
group by a.kiho; -
-- "tupyo" 테이블을 "a"라는 별칭으로 사용하고, "kiho" 컬럼을 기준으로 그룹화
