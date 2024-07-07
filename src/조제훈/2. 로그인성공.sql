-- 로그인
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
  NOW(), 'c2a1:69c9:db75:47ad:cb7a:8575:0804:8131', TRUE, 2
);

SELECT * FROM loginhistory;