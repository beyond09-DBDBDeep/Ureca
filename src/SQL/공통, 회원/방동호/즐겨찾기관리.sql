-- 1. 조합 선택~
SELECT 
       cafe.cafeName AS '카페 명'
     , menu.menuName AS '메뉴 명'
     , cafe_option.optionContents '옵션 선택'
  FROM menu_list
  JOIN cafe ON(menu_list.cafeId = cafe.cafeId)
  JOIN menu ON(menu_list.menuId = menu.menuId)
  JOIN cafe_option ON(menu_list.cafeOptionId = cafe_option.cafeOptionId);

-- 2-1. 즐겨찾기 추가
INSERT INTO bookmark
(alias, lastModifyDate, userId)
VALUES
('Bang', NOW(), 2);

-- 2-2. 위에 즐겨찾기를 추가하며 조합에도 추가한다.
INSERT INTO combo
(menuCount, optionCount, menuListId, bookmarkId)
VALUES
(1, 1, 1, 3);



-- 3. 즐겨찾기 수정
UPDATE bookmark
   SET alias = '오키'
 WHERE alias = '한 잔해';

-- 4. 즐겨찾기 삭제
DELETE 
  FROM bookmark
 WHERE alias = '오키';