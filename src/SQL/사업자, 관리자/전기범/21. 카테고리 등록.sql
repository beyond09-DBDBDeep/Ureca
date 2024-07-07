-- 21. 카테고리 등록

-- 1) 사업자가 추가하려는 카테고리명이 이미 category 테이블에 있을 경우 조회된 categoryId 사용
SELECT categoryId
  FROM category
 WHERE categoryName = '베이커리';
 
-- 2) DB에 없을 경우 INSERT 
INSERT INTO category (categoryName, parentCategoryId) VALUES
('베이커리', 2);

-- 3) 새로 추가된 categoryId 사용
SELECT categoryId
  FROM category
 WHERE categoryName = '베이커리';