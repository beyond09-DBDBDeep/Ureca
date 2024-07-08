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

-- 2. 로그인 1이 조회되면 로그인 성공
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