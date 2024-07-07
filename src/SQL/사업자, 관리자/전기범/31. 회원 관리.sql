-- 관리자 
-- 31. 회원 관리
UPDATE users
   SET blackUserStatus = true
	  , blackRegDate = NOW()
	  , blackReason = '불법 광고'
 WHERE userId = 2;