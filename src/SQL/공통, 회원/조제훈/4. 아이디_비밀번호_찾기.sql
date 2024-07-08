-- 아이디 찾기
SELECT 
		 users.email
  FROM users
 WHERE users.username = '남지아'
   AND users.phone = '010-7353-9824';

-- 비밀번호 찾기
SELECT 
		 users.userPassword
  FROM users
 WHERE users.username = '남지아'
   AND users.phone = '010-7353-9824'
	AND users.email = 'vba123g@yu.org';