-- 27. 메뉴판 등록

-- 1) 메뉴판에 이미 존재하는 지 조회
SELECT menuListId
  FROM menu_list
 WHERE cafeId = 5 AND menuId = 11 AND cafeOptionId  IN ( SELECT cafeOptionId
  																			  FROM cafe_option
 														  					 WHERE cafeId = 5 AND optionId = 10);

-- 2) 조회된 것이 없으면 새로 추가
INSERT INTO menu_list (cafeId, menuId, cafeOptionId) VALUES
(5, 11, 20),
(5, 11, 21),
(5, 11, 22);