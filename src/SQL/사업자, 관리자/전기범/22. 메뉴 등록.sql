-- 22. 메뉴 등록

-- 1) 사업자가 추가하려는 메뉴명이 이미 menu 테이블에 있을 경우 조회된 menuId 사용
SELECT menuId
  FROM menu
 WHERE menuName = '마라아메리카노';

-- 2) menuId가 조회되었을 경우 cafe_menu 테이블을 조회하여 해당 카페에 그 메뉴가 추가된 적 있는지 검사
SELECT cafeId
     , menuId
     , menuPrice
     , menuFlavorScore
     , menuSalesStatus
     , categoryId
  FROM cafe_menu
 WHERE cafeId = 5 AND menuId = 11;

-- 3) cafe_menu에서 조회되었을 경우 menuSalesStatus를 True로 업데이트(이후 단계는 수행하지 않는다)
UPDATE cafe_menu
   SET menuSalesStatus = TRUE
 WHERE cafeId = 5 AND menuId = 11;

-- 4) menuId가 조회되지 않았을 경우 새로 추가 
INSERT INTO menu (menuName, useCount) VALUES
('마라아메리카노', 1);

-- 5) 새로 추가된 menuId를 사용
SELECT menuId
  FROM menu
 WHERE menuName = '마라아메리카노';

-- 6) cafeId와 menuId를 이용해 cafe_menu 테이블에 레코드 추가 
INSERT INTO cafe_menu (cafeId, menuId, menuPrice, menuOrderCount, menuFlavorScore, menuSalesStatus, categoryId) VALUES
(5, 11, 5000, 0, 0, TRUE, 3);