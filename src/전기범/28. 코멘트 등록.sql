-- 28. 코멘트 등록

-- 1) 해당 리뷰에 등록된 코멘트가 있는지 검사(1개의 리뷰에는 1개의 코멘트만 가능)
SELECT commentId
  FROM comment
 WHERE reviewId = 1;

-- 2) 조회된 코멘트가 없을 경우 코멘트 추가  
INSERT comment (commentContents, commentDate, userId, reviewId) VALUES
('감사합니다', NOW(), 13, 1);