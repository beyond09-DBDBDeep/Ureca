-- 1. 회원가입
SELECT 
		 users.email AS 'email 중복 검사(값이 없을경우 통과)'
	  , users.phone AS '전화번호 중복 검사(값이 없을경우 통과)'
  FROM users
 WHERE users.email <> ()
   AND users.phone <> ();
   
-- 위 select에서 아무런 값이 안뜨면 아래 insert가 가능하다.
INSERT INTO users
(userName, email, userPassword, phone, gender, birth, address)
VALUES 
();	-- 위에 성공시 값 입력!

-- 2. 로그인
SELECT
		 1
  FROM users
 WHERE users.userQuitStatus <> 1
   AND users.blackUserStatus <> 1
   AND users.email = ('vbag@yu.org')
   AND users.userPassword = ('wrBlSOYi)3')
	LIMIT 1;
-- 위 값이 1이 나오면 로그인 성공!

-- 3. 아이디 찾기
SELECT 
	 	 users.email AS 'ID'
  FROM users
 WHERE users.userName = ('남정호')
   AND users.phone = ('031-735-9824');

-- 4. 비밀번호 찾기
SELECT 
	    users.userPassword AS 'PassWord'
  FROM users
 WHERE users.email = ('vbag@yu.org')
   AND users.userName = ('남정호')
   AND users.phone = ('031-735-9824');
   
-- 5. 비밀번호 수정(이메일, 비번을 통한 비번 변경)
UPDATE users
   SET users.userPassword = ('')
 WHERE users.email = ('vbag@yu.org')
   AND users.userPassword = ('wrBlSOYi)3');