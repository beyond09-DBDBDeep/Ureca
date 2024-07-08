-- 리뷰 추가
SELECT * FROM review;

INSERT INTO review(
  reviewTitle
, reviewContents
, reviewDate
, reviewPhotoUrl
, serviceScore
, flavorScore
, moodScore
, userId
, cafeId
) VALUES (
  '리뷰제목test'
, '리뷰내용test'
, NOW()
, 'https://cdxarchivephoto.s3.ap-northeast-2.amazonaws.com/_IMG_1880.jpeg'
, 5
, 4
, 5
, 2
, 1
);

SELECT * FROM review;

-- 리뷰 수정
UPDATE review 
   SET reviewContents = '리뷰 수정'
 WHERE reviewId = 3;
 
SELECT * FROM review;

-- 리뷰 삭제
DELETE FROM review WHERE reviewId = 3;

SELECT * FROM review;

-- 내 리뷰 조회
SELECT * FROM review WHERE userId = 2;