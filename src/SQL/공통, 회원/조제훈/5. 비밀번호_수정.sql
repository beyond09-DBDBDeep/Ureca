-- 비밀번호 수정
SELECT * FROM users where users.username = '남지아';

UPDATE users
	SET users.userPassword = 'newPassword1!'
 WHERE users.username = '남지아';
 
SELECT * FROM users where users.username = '남지아';