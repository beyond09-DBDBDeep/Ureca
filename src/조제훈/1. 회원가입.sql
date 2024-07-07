-- 회원가입
SELECT * FROM users;

INSERT INTO users (
  userType
, userName
, email
, userPassword
, phone
, gender
, birth
, address
, latitude
, longitude
, loginFailCount
, businessRegNo
, blackUserStatus
, blackRegDate
, blackReason
, userQuitStatus
, userQuitDate
, userQuitReason
) VALUES (
  '일반', '남지아', 'vba123g@yu.org', 'wrBlSOYi)4', 
  '010-7353-9824', '여성', '1999-07-10', '서울특별시 서대문구 선릉2길', 
  41.2540466664, 127.9877758576, 0, NULL, 
  FALSE, NULL, NULL, FALSE, NULL, NULL
);

SELECT * FROM users;