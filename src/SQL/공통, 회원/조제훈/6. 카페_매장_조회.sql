-- 카페
SELECT 
		 * 
  FROM cafe;

-- 매장 검색
SELECT 
		 * 
  FROM cafe
 WHERE cafe.cafeName LIKE '%카페%';
 
SELECT 
		 cafe.*
  FROM cafe
  JOIN cafe_menu
    ON cafe.cafeId = cafe_menu.cafeId
  JOIN menu
    ON cafe_menu.menuId = menu.menuId
 WHERE menu.menuName = '아메리카노';