-- 메뉴 조회
SELECT 
		 menu.*
  FROM cafe
  JOIN cafe_menu
    ON cafe.cafeId = cafe_menu.cafeId
  JOIN menu
    ON cafe_menu.menuId = menu.menuId
 WHERE cafe.cafeId = 1;
 
-- 옵션 조회
SELECT 
		 options.optionName
	  , cafe_option.optionContents
  FROM cafe
  JOIN cafe_option
    ON cafe.cafeId = cafe_option.cafeId
  JOIN options
    ON cafe_option.optionId = options.optionId
 WHERE cafe.cafeId = 1;