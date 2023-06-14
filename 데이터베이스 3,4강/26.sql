DROP PROCEDURE IF EXISTS get_sum;
#get_sum이라는  procedure가 있으면 삭제해라
DELIMITER $$
CREATE PROCEDURE get_sum(
#get_sum이라는 procedure만들기
	IN _id integer,
    #_id를 in으로 정의
	OUT _name varchar(20),
    #name을 out으로 정의
    OUT _sum integer
)
BEGIN
		DECLARE _kor integer;
		DECLARE _eng integer;
		DECLARE _mat integer;
        set _kor=0;
        
        select name, kor, eng, mat
			into _name,_kor,_eng,_mat from examtable where id=_id;
		
        set _sum = _kor+_eng+_mat;
END $$
DELIMITER ;

call get_sum(209901, @name, @sum);
select @name,@sum;
        