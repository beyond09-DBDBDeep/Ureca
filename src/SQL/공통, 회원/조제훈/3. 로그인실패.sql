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
  NOW(), 'c2a1:69c9:db75:47ad:cb7a:8575:0804:8131', FALSE, 2
);

SELECT * FROM loginhistory;

SELECT
       userId
     , loginFailCount
  FROM users;