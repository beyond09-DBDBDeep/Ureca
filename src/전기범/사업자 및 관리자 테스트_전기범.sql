-- 회원 등록
INSERT INTO users (userType, userName, email, userPassword, phone, gender, birth, address, latitude, longitude, loginFailCount, businessRegNo, blackUserStatus, blackRegDate, blackReason, userQuitStatus, userQuitDate, userQuitReason) VALUES
('사업자', '전기범', 'kibeom1145@gmail.com', 'asdfasdf', '010-4288-0442', '남성', '1999-09-20', '경기도 남양주시 별내면 청학로 114번길', 12.123123123, 123.123123123, 0, '800628-125967', FALSE, NULL, NULL, FALSE, NULL, NULL);

-- 18. 카페 등록
INSERT INTO cafe (cafeName, cafeAddress, cafePhone, cafeOpenStatus, cafeServiceScore, cafeFlavorScore, cafeMoodScore, latitude, longitude, franchise, userId) VALUES
('기범이네', '경기도 남양주시 별내면 청학로 114번길', '031-1234-5678', FALSE, 0, 0, 0, 12.123123123, 123.123123123, FALSE, 13);

-- 19. 내 매장 조회
SELECT cafeId
     , cafeName
     , cafeAddress
     , cafePhone
     , cafeOpenStatus
     , latitude
     , longitude
     , cafeServiceScore
     , cafeFlavorScore
     , cafeMoodScore
     , franchise
  FROM cafe
 WHERE userId = 13;
 
-- 20. 카페 정보 수정

-- 1) 카페 정보 변경 페이지에서 보여줄 것 조회
SELECT cafeName
     , cafeAddress
     , cafePhone
     , cafeOpenStatus
     , franchise
  FROM cafe
 WHERE cafeId = 5;
 
-- 2) 카페 정보 수정 시 변경된 정보 업데이트 
UPDATE cafe
   SET cafeName = '기범이네 카페'
     , cafeAddress = '경기도 남양주시 별내면 청학로 114번길 17'
     , latitude = '12.123123456' -- 위도와 경도는 주소를 수정하면 자동으로 수정된다.
     , longitude = '123.123123456'
     , cafePhone = '031-123-1234'
     , cafeOpenStatus = TRUE
     , franchise = TRUE
 WHERE cafeId = 5;
 
-- 21. 카테고리 등록

-- 1) 사업자가 추가하려는 카테고리명이 이미 category 테이블에 있을 경우 조회된 categoryId 사용
SELECT categoryId
  FROM category
 WHERE categoryName = '베이커리';
 
-- 2) DB에 없을 경우 INSERT 
INSERT INTO category (categoryName, parentCategoryId) VALUES
('베이커리', 2);

-- 3) 새로 추가된 categoryId 사용
SELECT categoryId
  FROM category
 WHERE categoryName = '베이커리';

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

-- 23. 메뉴 수정
UPDATE cafe_menu
   SET menuPrice = 10000
 WHERE cafeId = 5 AND menuId = 11;
 
-- 24. 옵션 등록

-- 1) 사업자가 추가하려는 옵션명이 이미 options 테이블에 있는지 조회
SELECT optionId
  FROM options
 WHERE optionName = '당도';

-- 2) options 테이블에서 조회되었을 경우 cafe_option 테이블을 조회하여 해당 옵션이 해당 카페에서 추가된 적 있는지 검사 
SELECT cafeOptionId
  FROM cafe_option
 WHERE cafeId = 5 AND optionId = 10;

-- 3) cafe_option 테이블에서 조회된 데이터를 사업자가 그대로 사용할 경우 optionSalesStatus를 True로 업데이트(이후 단계는 수행하지 않는다)
UPDATE cafe_option
   SET optionSalesStatus = TRUE
 WHERE cafeId = 5 AND optionId = 10; 

-- 4) options 테이블에서 조회되지 않았을 경우 새로 추가 
INSERT INTO options (optionName, useCount) VALUES
('당도', 1);

-- 5) 새로 추가된 optionId를 사용
SELECT optionId
  FROM options
 WHERE optionName = '당도';
 
-- 6) 새로 추가된 데이터인 경우 또는 3번 단계에서 사업자가 저장된 데이터를 사용하지 않을 경우 cafe_option 테이블에 INSERT  
INSERT INTO cafe_option (cafeId, optionId, optionPrice, optionContents, optionSalesStatus) VALUES
(5, 10, 0, '당도 30%', TRUE),
(5, 10, 0, '당도 50%', TRUE),
(5, 10, 0, '당도 70%', TRUE);

-- 25. 옵션 수정
UPDATE cafe_option
   SET optionPrice = 200
 WHERE cafeId = 5 AND optionId = 10;
 
-- 26. 메뉴, 옵션 삭제(판매 중지)
UPDATE cafe_menu
   SET menuSalesStatus = FALSE
 WHERE cafeId = 5 AND menuId = 11; 
 
UPDATE cafe_option
   SET optionSalesStatus = FALSE
 WHERE cafeId = 5 AND optionId = 10;
 
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
   
-- 28. 코멘트 등록

-- 1) 해당 리뷰에 등록된 코멘트가 있는지 검사(1개의 리뷰에는 1개의 코멘트만 가능)
SELECT commentId
  FROM comment
 WHERE reviewId = 1;

-- 2) 조회된 코멘트가 없을 경우 코멘트 추가  
INSERT comment (commentContents, commentDate, userId, reviewId) VALUES
('감사합니다', NOW(), 13, 1);
 
-- 29. 코멘트 수정
UPDATE comment
   SET commentContents = '감사링'
     , commentDate = NOW()
 WHERE userId = 13 AND reviewId = 1;
 
-- 30. 코멘트 삭제
DELETE
  FROM comment
 WHERE userId = 13 AND reviewId= 1;

-- 관리자 
-- 31. 회원 관리
UPDATE users
   SET blackUserStatus = true
	  , blackRegDate = NOW()
	  , blackReason = '불법 광고'
 WHERE userId = 2;

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