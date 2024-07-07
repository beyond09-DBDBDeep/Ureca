-- 20. 카페 정보 수정

-- 1) 카페 정보 변경 페이지에서 보여줄 것 조회
SELECT cafeName
     , cafeAddress
     , cafePhone
     , cafeOpenStatus
     , franchise
  FROM cafe
 WHERE cafeId = 5;
 
-- 2) 카페 정보 수정 시 변경된 정보 업데이트 
UPDATE cafe
   SET cafeName = '기범이네 카페'
     , cafeAddress = '경기도 남양주시 별내면 청학로 114번길 17'
     , latitude = '12.123123456' -- 위도와 경도는 주소를 수정하면 자동으로 수정된다.
     , longitude = '123.123123456'
     , cafePhone = '031-123-1234'
     , cafeOpenStatus = TRUE
     , franchise = TRUE
 WHERE cafeId = 5;