DROP PROCEDURE IF EXISTS insert_examtable1;
#get_sum이라는  procedure가 있으면 삭제해라
DELIMITER $$
CREATE PROCEDURE insert_examtable1(_last integer)
BEGIN
		DECLARE _name varchar(20);
        DECLARE _kor integer;
        DECLARE _eng integer;
        DECLARE _mat integer;
		DECLARE _id integer;
		DECLARE _cnt integer;
        
    
        set _cnt =0;
        
        delete from examtable where id >0;
			_loop:LOOP
				SET _cnt =_cnt+1;
                SET _name = concat("홍길",cast(_cnt as char(4))) ;
                SET _id = 209900+_cnt;
			
				Insert into examtable value(_name,_id,rand()*100,rand()*100,rand()*100);
                
                if _cnt=_last THEN
					LEAVE _loop;
				END IF;
			END LOOP _loop;
        
END $$
DELIMITER ;

call insert_examtable1(100);
select * from examtable;
