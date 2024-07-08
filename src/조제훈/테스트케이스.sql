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

SELECT * FROM users WHERE users.userQuitStatus != 1;
SELECT * FROM users WHERE users.blackUserStatus != 1;

SELECT
		 *
	FROM dormant_users
  WHERE dormant_users.email = ('vba123g@yu.org')
    AND dormant_users.userPassword = ('wrBlSOYi)4');



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
     , loginFailCount
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
		 users.blackUserStatus
  FROM users
 WHERE users.email = ('gimogsun@baggimgim.com')
   AND users.userPassword = ('_2^SCggngR');
   
-- 3) 계정 탈퇴인 경우
SELECT
		 users.userQuitStatus
  FROM users
 WHERE users.email = ('coseong@naver.com')
   AND users.userPassword = ('D4F*&FjLc$');

-- 4. 아이디 찾기

