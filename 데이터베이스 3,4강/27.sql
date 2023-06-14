DROP FUNCTION IF EXISTS f_get_sum;

DELIMITER $$

show global variables like 'log_bin_trust_function_creators';
SET GLOBAL log_bin_trust_function_creators = 1;

CREATE FUNCTION f_get_sum(_id integer) RETURNS integer

BEGIN
		DECLARE _sum integer;
        select kor+eng+mat into _sum from examtable where id=_id;
		
RETURN _sum;
END $$
DELIMITER ;

select * ,f_get_sum(id) from examtable;
        