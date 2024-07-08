/* 회원 */
-- 회원 가입

SELECT
	    COUNT(*) AS email_count
  FROM users
 WHERE email = 'user@example.com'; -- 중복되는 값의 개수 불러옴
 
SELECT 
		 COUNT(*) AS phone_count
  FROM users
 WHERE phone = '010-1234-5678'; 
 
INSERT INTO users
(
  userType, userName, email, 
  userPassword, phone, gender, 
  birth, address, latitude, 
  loginFailCount, businessRegNo, blackuser
)
WHERE NOT EXISTS (
	SELECT 1
	FROM users
	WHERE email = ''

);

-- 로그인
-- 1) 일반회원 및 블랙 필터링
SELECT *
  FROM users
 WHERE email = '' 
   AND userPassword ='' 
	AND blackUser = FALSE
	AND userType <> 'dormant';

-- 블랙인 경우 로그인 불가 메시지 반환

-- 2) 휴면 유저 조회
SELECT *
  FROM dormant_users
 WHERE email = ''
   AND userPassword = ''
   AND blackUser = FALSE;
   
-- 3) 블랙 여부 확인 및 데이터 이동
-- 휴면 유저를 활성화 유저로 이동
INSERT INTO users
( userId, userType, userName,
  email, userPassword, phone,
  gender, birth, address, 
  latitude, longitude, loginFailCount, 
  businessRegNo, blackUser)
SELECT 
       userId,
		 'ACTIVE', 
		 userName,
		 email,
		 userPassword, 
		 phone, 
		 gender, 
		 birth, 
		 address, 
		 latitude, 
		 longitude, 
		 loginFailCount, 
		 businessRegNo, 
		 blackUser
  FROM 
       dormant_users
 WHERE email = 'user@example.com';

-- 휴면 유저 테이블에서 삭제
DELETE FROM dormant_users
WHERE email = 'user@example.com';

-- 4) 로그인 실패 카운트 증가
UPDATE users
   SET loginFailCount = loginFailCount + 1
 WHERE email <> ''
    or userPassword <> '';
    
-- 로그인 성공 시 실패 카운트 초기화 및 내역 추가
UPDATE users
   SET logiFailCount = 0
 WHERE email = ''
   AND userPassword = '';
   
INSERT INTO loginHistory (userId, loginTime, ipAddress)
SELECT 
       userId,
		 NOW(),
		 ''
  FROM users
 WHERE email = ''
   AND userPassword = '';
   
-- 아이디 찾기
SELECT
		 email
  FROM users
 WHERE userName = ''
   AND phone = '';
   
-- 비밀번호 찾기
SELECT
		 userPassword
  FROM users
 WHERE userName = ''
   AND phone = ''
   AND email = '';
   
-- 비밀번호 수정
UPDATE users(userPassword)

-- 매장 조회
SELECT
       c.cafeId, c.cafeName, m.menuName
  FROM cafe c
  LEFT JOIN cafe_menu cm ON c.cafeId = cm.cafeId
  LEFT JOIN menu m ON cm.menuId = m.menuId
 WHERE c.cafeName LIKE '%검색어%'
    OR m.menuName LIKE '%검색어%'
 ORDER BY c.orderCount DESC;
 
-- 메뉴 조회
SELECT m.menuName, m.menuName, m.price
  FROM cafe_menu cm
 INNER JOIN menu m ON cm.menuId = m.menuId
 WHERE cm.cafeId = '선택한카페';
 
-- 옵션 조회
SELECT o.optionId, o.optionName, o.extraPrice
  FROM cafe_option co
 INNER JOIN OPTIONS o ON co.optionId = o.optionId
 WHERE co.
  
-- 즐겨찾기 추가
INSERT INTO bookmark(alias, lastModifyDate, userId)
VALUES ( '', NOW(), '' );

-- 조합과 연결
INSERT INTO combo (bookmarkId, menuListId)
VALUES ('', '');


-- 즐겨찾기 업데이트
UPDATE bookmark
   SET alias = '',
       lastModifyDate = NOW()
 WHERE bookmarkId = '';
 
UPDATE combo
   SET optionCount = ''
 WHERE bookmarkId = '';
 
-- 즐겨찾기 삭제
DELETE FROM bookmark
 WHERE bookmarkId = '';
 
-- 리뷰 등록
INSERT INTO review (reviewTitle, reviewContents, reviewDate, reviewPhotoUrl,
						  seviceScore, flavorScore, moodScore)
	  VALUES ('', '', NOW(), '', 5, 5, 5);
	  
-- 리뷰와 조합 연결
INSERT INTO combo (reviewId)
VALUES ('');

-- userId로 리뷰 조회
SELECT 
       *
  FROM review
 WHERE userId = '';
 
-- 리뷰 삭제
-- 코멘트가 달려있는 경우
UPDATE review
   SET reviewTitle = '',
       reviewContents = '삭제된 리뷰입니다.'
       userId = NULL
 WHERE reviewId = '';
 
UPDATE combo
   SET reviewId = NULL
 WHERE reviewId = '';
 
-- 코멘트가 안 달려있는 경우
DELETE FROM review
 WHERE reviewId = '';
 
UPDATE combo
   SET reviewId = NULL
 WHERE reviewId = '';


  