-- 1. 리뷰 등록
INSERT INTO review 
(reviewTitle, reviewContents, reviewDate, reviewPhotoUrl, serviceScore, flavorScore, moodScore, userId, cafeId)
VALUES
('제목1', '내용1', NOW(), 'www.dddl.com', 5, 5, 5, 2, 1);

-- 2. ★★★★★ 리뷰와 조합 연결(리뷰, 조합은 독립적 아닐까? 어차피 영수증으로 하는데?)
SELECT 
       cafe.cafeName AS '카페 명'
     , menu.menuName AS '메뉴 명'
     , cafe_option.optionContents '옵션 선택'
  FROM menu_list
  JOIN cafe ON(menu_list.cafeId = cafe.cafeId)
  JOIN menu ON(menu_list.menuId = menu.menuId)
  JOIN cafe_option ON(menu_list.cafeOptionId = cafe_option.cafeOptionId);
  
SELECT 
		 menu_list.*
  FROM combo
  JOIN menu_list ON(menu_list.menuListId = combo.menuListId)
  JOIN bookmark ON(bookmark.bookmarkId = combo.bookmarkId);
SELECT * FROM combo; 


-- 3. 리뷰 수정
UPDATE review
   SET reviewTitle = '제목 수정2'
     , reviewContents = '내용 수정2'
 WHERE reviewPhotoUrl = 'www.dddl.com';

-- 4. 내 리뷰 조회
SELECT 
		 users.userName AS '닉네임'
  	  , review.reviewTitle AS '제목'
  	  , review.reviewContents AS '내용'
  	  , review.reviewDate AS '날짜'
  	  , review.reviewPhotoUrl AS '사진'
  	  , ROUND(AVG(review.serviceScore+review.flavorScore+review.moodScore)/3.0, 2) AS '평점' 
  FROM review
  JOIN cafe ON(cafe.cafeId = review.cafeId)
  JOIN users ON(review.userId = users.userId)
 WHERE userName = '남정호';

-- 5. 리뷰 삭제
DELETE 
  FROM review
 WHERE reviewPhotoUrl = 'www.dddl.com';
