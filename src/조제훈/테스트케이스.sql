-- 1. 회원가입
SELECT users.userName FROM users;

SELECT 
		 users.email AS 'email 중복 검사(값이 없을경우 통과)'
  FROM users
 WHERE users.email = 'vba123g@yu.org';
   
SELECT 
		 users.phone AS '전화번호 중복 검사(값이 없을경우 통과)'   
  FROM users
 WHERE users.phone = '010-7353-9824';
	  
-- 위 select에서 아무런 값이 안뜨면 아래 insert가 가능하다.
INSERT INTO users
(userType, userName, email, userPassword, phone, gender, birth, address)
VALUES 
('일반', '남지아', 'vba123g@yu.org', 'wrBlSOYi)4', 
  '010-7353-9824', '여성', '1999-07-10', '서울특별시 서대문구 선릉2길'
);

SELECT users.userName FROM users;

-- 2. 로그인 성공
DELIMITER $$
CREATE OR REPLACE TRIGGER update_login_history
AFTER INSERT ON loginHistory
FOR EACH ROW
BEGIN
	 UPDATE users
	 SET lastLogin = NEW.loginAttemptTime
	 WHERE userId = NEW.userId;
END $$
DELIMITER ;

SELECT
		 *
  FROM users
 WHERE users.email = ('vba123g@yu.org')
   AND users.userPassword = ('wrBlSOYi)4');

SELECT * FROM loginhistory;

INSERT INTO loginhistory
(
  loginAttemptTime
, loginIp
, successStatus
, userId
)
VALUES
(
  NOW(), 'c2a1:69c9:db75:47ad:cb7a:8575:0804:8131', TRUE, 13
);

SELECT * FROM loginhistory;

SELECT userId
     , lastLogin
  FROM users
 WHERE userId = 13;

-- 3. 로그인 실패
-- 1) 아이디 비밀번호 틀렸을 경우
SELECT
		 *
  FROM users
 WHERE users.email = ('vba123g@yu.org')
   AND users.userPassword = ('wrBlSOYi)5');
   
DELIMITER //

CREATE OR REPLACE TRIGGER LOGIN_FAIL_TR
    AFTER INSERT 
    ON loginhistory
    FOR EACH ROW
BEGIN 
    IF NEW.successStatus = FALSE THEN
        UPDATE users
           SET loginFailCount = loginFailCount + 1
         WHERE userId = New.userId; 
    END IF;
END//
 
DELIMITER ;

SELECT * FROM loginhistory;

SELECT
       userId
     , loginFailCount AS '로그인 실패 횟수'
  FROM users;

INSERT INTO loginhistory
(
  loginAttemptTime
, loginIp
, successStatus
, userId
)
VALUES
(
  NOW(), 'c2a1:69c9:db75:47ad:cb7a:8575:0804:8131', FALSE, 13
);

SELECT * FROM loginhistory;

SELECT
       userId
     , loginFailCount
  FROM users;
  
-- 2) 블랙리스트인 경우
SELECT
		 users.blackUserStatus AS '블랙 여부'
  FROM users
 WHERE users.email = ('gimogsun@baggimgim.com')
   AND users.userPassword = ('_2^SCggngR');
   
-- 3) 탈퇴 회원인 경우
SELECT
		 users.userQuitStatus AS '탈퇴 여부'
  FROM users
 WHERE users.email = ('coseong@naver.com')
   AND users.userPassword = ('D4F*&FjLc$');
   
-- 4) 휴면 회원인 경우
SELECT
		 *
  FROM dormant_users
 WHERE dormant_users.email = ('chuyeji@naver.com')
   AND dormant_users.userPassword = ('asdf(&^1');
   
INSERT INTO users 
(
  SELECT
  		   *
    FROM dormant_users
   WHERE dormant_users.email = ('chuyeji@naver.com')
     AND dormant_users.userPassword = ('asdf(&^1')
);
   
DELETE 
  FROM dormant_users
 WHERE dormant_users.email = ('chuyeji@naver.com')
   AND dormant_users.userPassword = ('asdf(&^1');

-- 4. 아이디 찾기
SELECT 
	 	 users.email AS 'ID'
  FROM users
 WHERE users.userName = ('남정호')
   AND users.phone = ('031-735-9824');

-- 5. 비밀번호 찾기
SELECT 
	    users.userPassword AS 'PassWord'
  FROM users
 WHERE users.email = ('vbag@yu.org')
   AND users.userName = ('남정호')
   AND users.phone = ('031-735-9824');

-- 6. 비밀번호 수정
UPDATE users
   SET users.userPassword = '1234ABCDEF!@#'
 WHERE userId = 2;
 
SELECT userId
     , userName
     , userPassword
  FROM users
 WHERE userId = 2;
 
--  7. 매장 조회
SELECT * FROM cafe;

SELECT cafeName AS '카페명'
	  , cafeAddress AS '주소'
	  , cafePhone AS '전화번호'
	  , cafeOpenStatus AS '오픈 여부'
	  , ROUND((cafeServiceScore + cafeFlavorScore + cafeMoodScore)/3.0, 2) AS 평점
  FROM cafe;
  
-- 8. 메뉴 조회
SELECT 
		 menu.menuName AS '메뉴명'
	  , cafe_menu.menuPrice AS '메뉴 가격'
  FROM cafe
  JOIN cafe_menu
    ON cafe.cafeId = cafe_menu.cafeId
  JOIN menu
    ON cafe_menu.menuId = menu.menuId
 WHERE cafe.cafeId = 1;
 
-- 9. 옵션 조회
SELECT options.optionName AS '옵션명'
	  , cafe_option.optionContents AS '옵션내용'
	  , cafe_option.optionPrice AS '옵션 가격'
  FROM cafe
  JOIN cafe_option
    ON cafe.cafeId = cafe_option.cafeId
  JOIN options
    ON cafe_option.optionId = options.optionId
 WHERE cafe.cafeId = 1;
  
-- 10. 즐겨찾기 추가
DELIMITER $$
CREATE OR REPLACE TRIGGER count_bookmarks_for_menu
AFTER INSERT OR DELETE ON combo
FOR EACH ROW
BEGIN
    DECLARE menu_id INT;

    -- 새로 삽입된 레코드와 연결된 menuId를 가져옵니다.
    SELECT C.menuId INTO menu_id
    FROM menu_list AS C
    WHERE C.menuListId = NEW.menuListId;

    -- menuId가 유효한 경우에만 업데이트 수행
    IF menu_id IS NOT NULL THEN
        UPDATE cafe_menu AS A
        SET A.menuBookmarkCount = (
            SELECT COUNT(DISTINCT B.bookmarkId)
            FROM combo AS B
            JOIN menu_list AS C ON B.menuListId = C.menuListId
            WHERE C.menuId = menu_id
        )
        WHERE A.menuId = menu_id;
    END IF;
END $$
DELIMITER ;

SELECT * FROM bookmark;

INSERT INTO bookmark
(
  alias
, lastModifyDate
, userId
) 
VALUES 
(
  '즐겨찾기 1번'
, NOW()
, 2
);

SELECT * FROM bookmark;

SELECT * FROM combo;

INSERT INTO combo (menuCount, optionCount, menuListId, bookmarkId) VALUES
(1, 1, 1, 5),
(1, 5, 3, 5);

SELECT * FROM combo;

-- 11. 즐겨찾기 수정
UPDATE bookmark
   SET alias = '즐겨찾기 수정',
       lastModifyDate = NOW()
 WHERE bookmarkId = 5;

DELETE
  FROM combo
 WHERE bookmarkId = 5;
 
INSERT INTO combo (menuCount, optionCount, menuListId, bookmarkId) VALUES
(1, 1, 1, 5),
(1, 3, 3, 5);
 
SELECT * FROM bookmark;

-- 12. 즐겨찾기 삭제
DELETE FROM bookmark WHERE bookmarkId = 5;

SELECT * FROM bookmark;

-- 13. 리뷰 추가
SELECT * FROM review;

INSERT INTO review(reviewTitle, reviewContents, reviewDate, reviewPhotoUrl, serviceScore, flavorScore, moodScore, userId, cafeId) VALUES 
('리뷰제목test', '리뷰내용test', NOW(), 'https://cdxarchivephoto.s3.ap-northeast-2.amazonaws.com/_IMG_1880.jpeg', 5, 4, 5, 2, 1);

SELECT * FROM review;

INSERT INTO combo (menuCount, optionCount, menuListId, reviewId) VALUES
(1, 1, 1, 3),
(1, 5, 3, 3);
	  
-- 14. 리뷰 수정
UPDATE review 
   SET reviewContents = '리뷰 수정'
 WHERE reviewId = 3;
 
SELECT * FROM review;

-- 15. 리뷰 삭제
-- 1) 코멘트가 달려있는 경우
UPDATE review
   SET reviewTitle = '',
       reviewContents = '삭제된 리뷰입니다.',
       userId = NULL
 WHERE reviewId = 3;

-- 2) 코멘트가 달려있지 않은 경우
DELETE FROM review WHERE reviewId = 3;

SELECT * FROM review;

-- 16. 내 리뷰 조회
SELECT * FROM review WHERE userId = 2;

-- 테스트용 사업자 회원 등록
INSERT INTO users (userType, userName, email, userPassword, phone, gender, birth, address, latitude, longitude, loginFailCount, businessRegNo, blackUserStatus, blackRegDate, blackReason, userQuitStatus, userQuitDate, userQuitReason) VALUES
('사업자', '전기범', 'kibeom1145@gmail.com', 'asdfasdf', '010-4288-0442', '남성', '1999-09-20', '경기도 남양주시 별내면 청학로 114번길', 12.123123123, 123.123123123, 0, '800628-125967', FALSE, NULL, NULL, FALSE, NULL, NULL);

-- 17. 카페 등록
INSERT INTO cafe (cafeName, cafeAddress, cafePhone, cafeOpenStatus, cafeServiceScore, cafeFlavorScore, cafeMoodScore, latitude, longitude, franchise, userId) VALUES
('기범이네', '경기도 남양주시 별내면 청학로 114번길', '031-1234-5678', FALSE, 0, 0, 0, 12.123123123, 123.123123123, FALSE, 13);

-- 18. 내 매장 조회
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
 
-- 19. 카페 정보 수정

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
 
-- 20. 카테고리 등록

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

-- 21. 메뉴 등록

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

-- 22. 메뉴 수정
UPDATE cafe_menu
   SET menuPrice = 10000
 WHERE cafeId = 5 AND menuId = 11;
 
-- 23. 옵션 등록

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

-- 24. 옵션 수정
UPDATE cafe_option
   SET optionPrice = 200
 WHERE cafeId = 5 AND optionId = 10;
 
-- 25. 메뉴, 옵션 삭제(판매 중지)
UPDATE cafe_menu
   SET menuSalesStatus = FALSE
 WHERE cafeId = 5 AND menuId = 11; 
 
UPDATE cafe_option
   SET optionSalesStatus = FALSE
 WHERE cafeId = 5 AND optionId = 10;
 
-- 26. 메뉴판 등록

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
   
-- 27. 코멘트 등록

-- 1) 해당 리뷰에 등록된 코멘트가 있는지 검사(1개의 리뷰에는 1개의 코멘트만 가능)
SELECT commentId
  FROM comment
 WHERE reviewId = 1;

-- 2) 조회된 코멘트가 없을 경우 코멘트 추가  
INSERT comment (commentContents, commentDate, userId, reviewId) VALUES
('감사합니다', NOW(), 13, 1);
 
-- 28. 코멘트 수정
UPDATE comment
   SET commentContents = '감사링'
     , commentDate = NOW()
 WHERE userId = 13 AND reviewId = 1;
 
-- 29. 코멘트 삭제
DELETE
  FROM comment
 WHERE userId = 13 AND reviewId= 1;

-- 관리자 
-- 30. 회원 관리
UPDATE users
   SET blackUserStatus = true
	  , blackRegDate = NOW()
	  , blackReason = '불법 광고'
 WHERE userId = 2;
 
 UPDATE users
   SET blackUserStatus = false
	  , blackRegDate = NULL
	  , blackReason = NULL
 WHERE userId = 2;

-- 31. 매장 관리

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

-- 휴면 계정 전환 스케쥴러
SELECT * FROM users;

SHOW VARIABLES LIKE 'event%'; 
SET GLOBAL event_scheduler = ON;

DELIMITER $$
CREATE OR REPLACE EVENT move_to_dormant
ON SCHEDULE EVERY 10 SECOND
STARTS '2024-07-08 15:00:00'
DO
BEGIN
    INSERT INTO dormant_users
	 (SELECT *
    	FROM users
     WHERE lastLogin IS NOT NULL AND lastLogin < NOW() - INTERVAL 6 MONTH);

    DELETE FROM users
    WHERE lastLogin IS NOT NULL AND lastLogin < NOW() - INTERVAL 6 MONTH;
END$$
DELIMITER ;

SELECT * FROM information_schema.events;

UPDATE users
   SET lastLogin = '2023-07-05 05:05:05'
 WHERE userId = 3;
 
SELECT * FROM users;
SELECT * FROM dormant_users; 
 
-- 탈퇴 회원 삭제 스케줄러
SELECT * FROM users;

SHOW VARIABLES LIKE 'event%'; 
SET GLOBAL event_scheduler = ON;

DELIMITER $$
CREATE OR REPLACE EVENT delete_quit_users
ON SCHEDULE EVERY 10 SECOND
STARTS '2024-07-08 15:00:00'
DO
BEGIN
    DELETE FROM users
    WHERE userQuitDate < NOW() - INTERVAL 1 MONTH;
END$$
DELIMITER ;

SELECT * FROM users;

-- 메뉴에서 리뷰 조회
SELECT
		 a.*
  FROM review a
  JOIN cafe_menu_review b
    ON a.reviewId = b.reviewId
  JOIN cafe_menu c
    ON b.cafeMenuId = c.cafeMenuId
 WHERE c.menuId = 1;