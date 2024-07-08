-- 1. 매장 조회
SELECT 
	    cafe.cafeName AS '카페명'
	  , cafe.cafeAddress AS '주소'
	  , cafe.cafePhone AS '전화번호'
	  , cafe.cafeOpenStatus AS '오픈 여부'
	  , ROUND(AVG(cafe.cafeServiceScore + cafe.cafeFlavorScore + cafe.cafeMoodScore)/3.0, 2) AS 평점
  FROM cafe;
SELECT * FROM cafe;
-- 2. 메뉴 조회(매장 이름으로 메뉴 조회)
SELECT 
	    menu.menuName AS '메뉴명'
	  , cafe_menu.menuPrice AS '메뉴 가격'
	  , cafe_menu.menuFlavorScore AS '맛 평점'
  FROM cafe
  JOIN cafe_menu ON(cafe.cafeId = cafe_menu.cafeId)
  JOIN menu ON(cafe_menu.menuId = menu.menuId)
 WHERE cafeName = '카페 오은지';

 
-- 3. 옵션 조회 
SELECT 
		 cafe_option.optionContents AS '옵션 종류'
	  , cafe_option.optionPrice AS '옵션 가격'
  FROM menu_list 
  JOIN cafe ON(menu_list.cafeId = cafe.cafeId)
  JOIN menu ON(menu_list.menuId = menu.menuId)
  JOIN cafe_option ON(menu_list.cafeOptionId = cafe_option.cafeOptionId)
 WHERE cafe.cafeName = '카페 오은지'
   AND menu.menuName = '아메리카노';