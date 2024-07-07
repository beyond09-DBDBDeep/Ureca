-- 26. 메뉴, 옵션 삭제(판매 중지)
UPDATE cafe_menu
   SET menuSalesStatus = FALSE
 WHERE cafeId = 5 AND menuId = 11; 
 
UPDATE cafe_option
   SET optionSalesStatus = FALSE
 WHERE cafeId = 5 AND optionId = 10;