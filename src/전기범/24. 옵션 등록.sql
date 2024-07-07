-- 24. 옵션 등록

-- 1) 사업자가 추가하려는 옵션명이 이미 options 테이블에 있는지 조회
SELECT optionId
  FROM options
 WHERE optionName = '당도';

-- 2) options 테이블에서 조회되었을 경우 cafe_option 테이블을 조회하여 해당 옵션이 해당 카페에서 추가된 적 있는지 검사 
SELECT cafeOptionId
  FROM cafe_option
 WHERE cafeId = 5 AND optionId = 10;

-- 3) cafe_option 테이블에서 조회된 데이터를 사업자가 그대로 사용할 경우 optionSalesStatus를 True로 업데이트(이후 단계는 수행하지 않는다)
UPDATE cafe_option
   SET optionSalesStatus = TRUE
 WHERE cafeId = 5 AND optionId = 10; 

-- 4) options 테이블에서 조회되지 않았을 경우 새로 추가 
INSERT INTO options (optionName, useCount) VALUES
('당도', 1);

-- 5) 새로 추가된 optionId를 사용
SELECT optionId
  FROM options
 WHERE optionName = '당도';
 
-- 6) 새로 추가된 데이터인 경우 또는 3번 단계에서 사업자가 저장된 데이터를 사용하지 않을 경우 cafe_option 테이블에 INSERT  
INSERT INTO cafe_option (cafeId, optionId, optionPrice, optionContents, optionSalesStatus) VALUES
(5, 10, 0, '당도 30%', TRUE),
(5, 10, 0, '당도 50%', TRUE),
(5, 10, 0, '당도 70%', TRUE);