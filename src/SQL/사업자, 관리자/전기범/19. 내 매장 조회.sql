-- 19. 내 매장 조회
SELECT cafeId
     , cafeName
     , cafeAddress
     , cafePhone
     , cafeOpenStatus
     , latitude
     , longitude
     , cafeServiceScore
     , cafeFlavorScore
     , cafeMoodScore
     , franchise
  FROM cafe
 WHERE userId = 13;