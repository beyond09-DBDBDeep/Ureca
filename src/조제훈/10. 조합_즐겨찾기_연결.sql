-- 조합과 관련된 즐겨찾기
-- 1. 메뉴리스트
SELECT
		 menu_list.menuListId, cafe.cafeName, menu.menuName, cafe_option.optionContents
  FROM menu_list
  JOIN cafe
    on menu_list.cafeId = cafe.cafeId
  JOIN menu
    ON menu_list.menuId = menu.menuId
  JOIN cafe_option
    ON menu_list.cafeOptionId = cafe_option.cafeOptionId;

-- 2. 기존 즐겨찾기 조회
SELECT * FROM bookmark;

-- 3. 즐겨찾기 추가
INSERT INTO bookmark(
  alias
, lastModifyDate
, userId
) VALUES (
  '즐겨찾기 2번'
, NOW()
, 2
);

-- 4. 추가된 즐겨찾기, 기존 조합 조회
SELECT * FROM bookmark;
SELECT * FROM combo;

-- 5. 조합 추가 및 추가된 조합 조회
INSERT INTO combo(
  menuCount
, optionCount
, reviewId
, menuListId
, bookmarkId
) VALUES (
  1
, 1
, NULL
, 79
, 6
);

SELECT * FROM combo;

-- 6. 연결 확인을 위해 즐겨찾기 삭제 후 조합 조회
DELETE from bookmark WHERE bookmarkId = 6;

SELECT * FROM combo;