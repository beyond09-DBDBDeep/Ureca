-- 즐겨찾기 추가
SELECT * FROM bookmark;

INSERT INTO bookmark(
  alias
, lastModifyDate
, userId
) VALUES (
  '즐겨찾기 1번'
, NOW()
, 2
);

SELECT * FROM bookmark;

-- 즐겨찾기 수정
UPDATE bookmark 
   SET alias = '즐겨찾기 수정'
 WHERE bookmarkId = 5;
 
SELECT * FROM bookmark;

-- 즐겨찾기 삭제
DELETE FROM bookmark WHERE bookmarkId = 5;

SELECT * FROM bookmark;