-- 32. 매장 관리

-- 매장 삭제 프로시저
DELIMITER //
CREATE PROCEDURE delete_cafe(IN cafeIndex BIGINT)
BEGIN
-- 1) cafe_menu 테이블에서 삭제하려는 카페의 menuId를 조회하여 menu테이블에서 해당 menuId의 useCount를 1씩 내림
	 UPDATE menu
   	 SET useCount = useCount-1
 	  WHERE menuId IN (SELECT menuId
  						  	   FROM cafe_menu
 						     WHERE cafeId = cafeIndex);

-- 2) menu의 useCount가 0이 된 것은 삭제 						 
	 DELETE 
      FROM menu
     WHERE useCount = 0;						   
 						 
-- 3) cafe_option 테이블에서 삭제하려는 카페의 optionId들을 조회하여 option 테이블에서 해당 optionId의 useCount를 1씩 내림
	 UPDATE options
   	 SET useCount = useCount-1
 	  WHERE optionId IN (SELECT optionId
 							     FROM cafe_option
 							    WHERE cafeId = cafeIndex);

-- 4) options의 useCount가 0이 된 것은 삭제
	 DELETE 
  		FROM options
 	  WHERE useCount = 0;	

-- 5) cafe 테이블에서 해당 cafeId의 레코드 삭제
	 DELETE 
  		FROM cafe
 	  WHERE cafeId = cafeIndex;
END//
DELIMITER ; 

-- 매장 삭제 프로시저 호출
CALL delete_cafe(5); 