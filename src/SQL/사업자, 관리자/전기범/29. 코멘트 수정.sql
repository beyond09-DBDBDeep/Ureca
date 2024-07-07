-- 29. 코멘트 수정
UPDATE comment
   SET commentContents = '감사링'
     , commentDate = NOW()
 WHERE userId = 13 AND reviewId = 1;