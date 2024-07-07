-- 조합과 관련된 리뷰
-- 1. 메뉴리스트
SELECT
		 menu_list.menuListId, cafe.cafeName, menu.menuName, cafe_option.optionContents
  FROM menu_list
  JOIN cafe
    on menu_list.cafeId = cafe.cafeId
  JOIN menu
    ON menu_list.menuId = menu.menuId
  JOIN cafe_option
    ON menu_list.cafeOptionId = cafe_option.cafeOptionId;

-- 2. 기존 리뷰 조회
SELECT * FROM review;

-- 3. 리뷰 추가
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
  '리뷰제목test2'
, '리뷰내용test2'
, NOW()
, 'https://cdxarchivephoto.s3.ap-northeast-2.amazonaws.com/_IMG_1880.jpeg'
, 3
, 3
, 3
, 2
, 1
);

-- 4. 추가된 리뷰, 기존 조합 조회
SELECT * FROM review;
SELECT * FROM combo;

-- 5. 조합 추가 및 추가된 조합 조회
INSERT INTO combo(
  menuCount
, optionCount
, reviewId
, menuListId
, bookmarkId
) VALUES (
  1
, 1
, 4
, 79
, NULL
);

SELECT * FROM combo;

-- 6. 연결 확인을 위해 리뷰 삭제 후 조합 조회
DELETE from review WHERE reviewId = 4;

SELECT * FROM combo;