DROP DATABASE IF EXISTS URECA;

CREATE DATABASE URECA;

USE URECA;

-- 테이블 삭제
DROP TABLE IF EXISTS combo;
DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS bookmark;
DROP TABLE IF EXISTS menu_list;
DROP TABLE IF EXISTS cafe_option;
DROP TABLE IF EXISTS cafe_menu;
DROP TABLE IF EXISTS cafe_category;
DROP TABLE IF EXISTS options;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS cafe;
DROP TABLE IF EXISTS loginHistory;
DROP TABLE IF EXISTS dormant_users;
DROP TABLE IF EXISTS users;

-- 테이블 생성
CREATE TABLE users (
    userId BIGINT PRIMARY KEY AUTO_INCREMENT,
    userType VARCHAR(255) NOT NULL,
    userName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    userPassword VARCHAR(255) NOT NULL,
    phone VARCHAR(255),
    gender VARCHAR(255),
    birth DATE,
    address VARCHAR(255),
    latitude DECIMAL(13,10),
    longitude DECIMAL(13,10),
    loginFailCount INTEGER DEFAULT 0,
    businessRegNo VARCHAR(255),
    blackUserStatus BOOLEAN DEFAULT FALSE,
    blackRegDate DATETIME,
    blackReason VARCHAR(255),
    userQuitStatus BOOLEAN DEFAULT FALSE,
    userQuitDate DATETIME,
    userQuitReason VARCHAR(255)
);

CREATE TABLE dormant_users (
    userId BIGINT PRIMARY KEY,
    userType VARCHAR(255) NOT NULL,
    userName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    userPassword VARCHAR(255) NOT NULL,
    phone VARCHAR(255),
    gender VARCHAR(255),
    birth DATE,
    address VARCHAR(255),
    latitude DECIMAL(13,10),
    longitude DECIMAL(13,10),
    loginFailCount INTEGER DEFAULT 0,
    businessRegNo VARCHAR(255),
    blackUserStatus BOOLEAN DEFAULT FALSE,
    blackRegDate DATETIME,
    blackReason VARCHAR(255),
    userQuitStatus BOOLEAN DEFAULT FALSE,
    userQuitDate DATETIME,
    userQuitReason VARCHAR(255)
);

CREATE TABLE loginHistory (
    loginHistoryId BIGINT PRIMARY KEY AUTO_INCREMENT,
    loginHistory DATETIME NOT NULL,
    loginIp VARCHAR(255) NOT NULL,
    successStatus BOOLEAN NOT NULL,
    userId BIGINT NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(userId)
    ON DELETE CASCADE
);

/* DELIMITER //

CREATE OR REPLACE TRIGGER LOGIN_FAIL_TR
    AFTER INSERT 
    ON loginhistory
    FOR EACH ROW
BEGIN 
    IF NEW.successStatus = FALSE THEN
        UPDATE users
           SET loginFailCount = loginFailCount + 1
         WHERE userId = New.userId; 
    END IF;
END//
 
DELIMITER ;

SELECT * FROM loginhistory;

SELECT
       userId
     , loginFailCount
  FROM users;

INSERT INTO loginhistory
(
  loginAttemptTime
, loginIp
, successStatus
, userId
)
VALUES
(
  NOW(), 'c2a1:69c9:db75:47ad:cb7a:8575:0804:8131', FALSE, 2
);

SELECT * FROM loginhistory;

SELECT
       userId
     , loginFailCount
  FROM users; */

CREATE TABLE cafe (
    cafeId BIGINT PRIMARY KEY AUTO_INCREMENT,
    cafeName VARCHAR(255) NOT NULL,
    cafeAddress VARCHAR(255) NOT NULL,
    cafePhone VARCHAR(255) NOT NULL,
    cafeOpenStatus BOOLEAN NOT NULL DEFAULT FALSE,
    cafeServiceScore DECIMAL(3,2) NOT NULL DEFAULT 0,
    cafeFlavorScore DECIMAL(3,2) NOT NULL DEFAULT 0,
    cafeMoodScore DECIMAL(3,2) NOT NULL DEFAULT 0,
    latitude DECIMAL(13,10) NOT NULL,
    longitude DECIMAL(13,10) NOT NULL,
    franchise BOOLEAN NOT NULL DEFAULT TRUE,
    userId BIGINT NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(userId)
    ON DELETE CASCADE
);


CREATE TABLE category (
    categoryId BIGINT PRIMARY KEY AUTO_INCREMENT,
    categoryName VARCHAR(255) NOT NULL,
    parentCategoryId BIGINT,
    FOREIGN KEY (parentCategoryId) REFERENCES category(categoryId)
    ON DELETE SET NULL
);

-- CREATE TABLE cafe_category (
--     cafeId BIGINT,
--     categoryId BIGINT,
--     PRIMARY KEY (cafeId, categoryId),
--     FOREIGN KEY (cafeId) REFERENCES cafe(cafeId)
--     ON DELETE CASCADE,
--     FOREIGN KEY (categoryId) REFERENCES category(categoryId)
--     ON DELETE CASCADE
-- );

CREATE TABLE menu (
    menuId BIGINT PRIMARY KEY AUTO_INCREMENT,
    menuName VARCHAR(255) NOT NULL,
    useCount INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE cafe_menu (
    cafeId BIGINT,
    menuId BIGINT,
    menuPrice INTEGER NOT NULL,
    menuOrderCount INTEGER NOT NULL,
    menuFlavorScore DECIMAL(3,2) NOT NULL DEFAULT 0,
    menuSalesStatus BOOLEAN NOT NULL DEFAULT TRUE,
    categoryId BIGINT,
    PRIMARY KEY (cafeId, menuId),
    FOREIGN KEY (cafeId) REFERENCES cafe(cafeId)
    ON DELETE CASCADE,
    FOREIGN KEY (menuId) REFERENCES menu(menuId)
    ON DELETE CASCADE,
    FOREIGN KEY (categoryId) REFERENCES category(categoryId)
    ON DELETE SET NULL
);

CREATE TABLE options (
    optionId BIGINT PRIMARY KEY AUTO_INCREMENT,
    optionName VARCHAR(255) NOT NULL,
    useCount INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE cafe_option (
    cafeOptionId BIGINT PRIMARY KEY AUTO_INCREMENT,
    cafeId BIGINT,
    optionId BIGINT,
    optionPrice INTEGER NOT NULL,
    optionContents VARCHAR(3000) NOT NULL,
    optionSalesStatus BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (cafeId) REFERENCES cafe(cafeId)
    ON DELETE CASCADE,
    FOREIGN KEY (optionId) REFERENCES options(optionId)
    ON DELETE CASCADE
);

CREATE TABLE bookmark (
    bookmarkId BIGINT PRIMARY KEY AUTO_INCREMENT,
    alias VARCHAR(255) NOT NULL,
    lastModifyDate DATETIME NOT NULL,
    userId BIGINT NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(userId)
    ON DELETE CASCADE
);

CREATE TABLE review (
    reviewId BIGINT PRIMARY KEY AUTO_INCREMENT,
    reviewTitle VARCHAR(255) NOT NULL,
    reviewContents VARCHAR(3000) NOT NULL,
    reviewDate DATETIME NOT NULL,
    reviewPhotoUrl VARCHAR(255) NOT NULL,
    serviceScore INTEGER NOT NULL DEFAULT 5,
    flavorScore INTEGER NOT NULL DEFAULT 5,
    moodScore INTEGER NOT NULL DEFAULT 5,
    userId BIGINT,
    cafeId BIGINT NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(userId)
    ON DELETE SET NULL,
    FOREIGN KEY (cafeId) REFERENCES cafe(cafeId)
    ON DELETE CASCADE
);

CREATE TABLE comment (
    commentId BIGINT PRIMARY KEY AUTO_INCREMENT,
    commentContents VARCHAR(3000) NOT NULL,
    commentDate DATETIME NOT NULL DEFAULT NOW(),
    userId BIGINT NOT NULL,
    reviewId BIGINT NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(userId)
    ON DELETE CASCADE,
    FOREIGN KEY (reviewId) REFERENCES review(reviewId)
    ON DELETE CASCADE
);

CREATE TABLE menu_list (
    menuListId BIGINT PRIMARY KEY AUTO_INCREMENT,
    cafeId BIGINT NOT NULL,
    menuId BIGINT NOT NULL,
    cafeOptionId BIGINT NOT NULL,
    FOREIGN KEY (cafeId) REFERENCES cafe(cafeId)
    ON DELETE CASCADE,
    FOREIGN KEY (menuId) REFERENCES menu(menuId) -- 해당 메뉴명을 사용하는 카페가 전부 없어지면(= 사용매장수가 0이 되면) 없어짐, 한 매장이 메뉴를 없애도 데이터는 남아 있음
    ON DELETE CASCADE,
    FOREIGN KEY (cafeOptionId) REFERENCES cafe_option(cafeOptionId)
    ON DELETE CASCADE
);

CREATE TABLE combo (
    comboId BIGINT PRIMARY KEY AUTO_INCREMENT,
    menuCount INTEGER NOT NULL,
    optionCount INTEGER NOT NULL,
    reviewId BIGINT,
    menuListId BIGINT NOT NULL,
    bookmarkId BIGINT,
    FOREIGN KEY (reviewId) REFERENCES review(reviewId)
    ON DELETE SET NULL,
    FOREIGN KEY (menuListId) REFERENCES menu_list(menuListId)
    ON DELETE CASCADE,
    FOREIGN KEY (bookmarkId) REFERENCES bookmark(bookmarkId)
    ON DELETE SET NULL
);

-- 데이터 삽입
INSERT INTO users (userType, userName, email, userPassword, phone, gender, birth, address, latitude, longitude, loginFailCount, businessRegNo, blackUserStatus, blackRegDate, blackReason, userQuitStatus, userQuitDate, userQuitReason) VALUES
('관리자', '유레카', 'admin@admin.com', 'admin123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('일반', '남정호', 'vbag@yu.org', 'wrBlSOYi)3', '031-735-9824', '여성', '1959-07-10', '서울특별시 서대문구 선릉3길 (은경조진면)', 41.2540433624, 127.9871058576, 3, NULL, FALSE, NULL, NULL, FALSE, NULL, NULL),
('일반', '장수민', 'cobagsang@yu.org', 'b%Cd%2XyQ', '02-123-4567', '여성', '1982-08-21', '부산광역시 서구 가락로 (지혜이동)', 42.1483473408, 130.4563119673, 0, NULL, FALSE, NULL, NULL, FALSE, NULL, NULL),
('일반', '강준', 'jijongsu@cho.org', '7Q5^&Q%xQY', '051-888-9999', '여성', '1996-03-25', '인천광역시 동구 올림픽대로', 40.0030446212, 127.9870663598, 2, NULL, FALSE, NULL, NULL, FALSE, NULL, NULL),
('일반', '최예지', 'coseong@naver.com', 'D4F*&FjLc$', '043-765-4321', '여성', '1991-11-15', '대전광역시 중구 도산대로', 35.7236505735, 128.6512347952, 0, NULL, FALSE, NULL, NULL, TRUE, '2023-07-07 07:07:07', '사용빈도가 낮아서'),
('일반', '박은정', 'areumjang@yu.com', '%4OT4Wy0%w', '031-622-5413', '남성', '1980-01-08', '서울특별시 종로구 언주28길', 33.1683318551, 124.9577501406, 4, NULL, FALSE, NULL, NULL, TRUE, '2022-02-15 06:43:05', '이용이 불편하고 장애가 많아서'),
('일반', '이준서', 'baggang@nate.com', 'p*T3s#4BZq', '054-321-9876', '남성', '1976-04-07', '대구광역시 중구 독산동', 37.8709254872, 128.6259886071, 3, NULL, TRUE, '2020-05-05 05:05:05', '테러 조장', FALSE, NULL, NULL),
('일반', '주지아', 'gimogsun@baggimgim.com', '_2^SCggngR', '042-356-5052', '남성', '1954-01-12', '울산광역시 남구 영동대로 (중수장이마을)', 33.5841375522, 126.0050150198, 1, NULL, TRUE, '2020-06-10 11:35:19', '욕설', FALSE, NULL, NULL),
('일반', '곽지영', 'eomjongsu@live.com', 'W2)2JRx!AY', '063-076-1164', '남성', '2004-06-19', '울산광역시 서구 서초중앙82가', 37.5764309823, 127.3082269336, 0, NULL, TRUE, '2021-01-01 01:23:45', '음란물', FALSE, NULL, NULL),
('일반', '김지수', 'jiyoung@ji.com', 'p4F*&FjLc$', '042-111-2222', '여성', '1966-05-17', '광주광역시 남구 언주로', 36.1236444785, 127.9870657542, 2, NULL, TRUE, '2018-08-18 18:18:18', '욕설', FALSE, NULL, NULL),
('사업자', '오은지', 'ohjung@live.com', 'D4F@jLc*F$', '02-777-8888', '남성', '1979-07-30', '부산광역시 북구 가산디지털2로', 34.9876543213, 129.1234567891, 0, '327894-123874', FALSE, NULL, NULL, FALSE, NULL, NULL),
('사업자', '조정호', 'vbag1234@yu.org', 'wrBlSOYi)1233', '010-7356-9824', '남성', '1961-07-12', '인천광역시 서구 서곶로', 40.2540433624, 126.9871076546, 0, '800628-145964', FALSE, NULL, NULL, FALSE, NULL, NULL);

SELECT * FROM users;

INSERT INTO cafe (cafeName, cafeAddress, cafePhone, cafeOpenStatus, cafeServiceScore, cafeFlavorScore, cafeMoodScore, latitude, longitude, franchise, userId) VALUES
('카페 오은지', '부산광역시 북구 가산디지털2로 33', '02-777-8889', TRUE, 4.2, 4.3, 4.4, 34.9876543213, 129.1234567890, FALSE, 11),
('카페 조정호 본점', '인천광역시 서구 서곶로 45', '010-7356-9825', TRUE, 3.8, 4.1, 4.0, 40.2540433624, 126.9871076546, TRUE, 12),
('카페 조정호 2호점', '서울특별시 종로구 종로3길 30', '02-1234-5678', TRUE, 4.5, 4.3, 4.4, 37.5730562874, 126.979462342, TRUE, 12),
('나 카페 조정호 아니다', '인천광역시 남동구 예술로 12', '032-111-2222', TRUE, 4.2, 4.4, 4.5, 37.4483568231, 126.701612673, FALSE, 12);

SELECT * FROM cafe;

INSERT INTO category (categoryName,parentCategoryId) VALUES
('음료', NULL),
('푸드', NULL),
('커피', 1),
('티', 1),
('스무디', 1),
('에이드', 1),
('논커피', 1),
('디저트', 2),
('브런치', 2);

SELECT * FROM category;

-- 메뉴 추가
INSERT INTO menu (menuName, useCount) VALUES
('에스프레소', 100),
('아메리카노', 150),
('카페 라떼', 120),
('그린 티 라떼', 90),
('바닐라 라떼', 80),
('카라멜 마키아토', 110),
('아이스 티', 70),
('모카', 95),
('허니브레드', 85),
('레몬 에이드', 50);

SELECT * FROM menu;

-- 카페 오은지의 메뉴 설정
INSERT INTO cafe_menu (cafeId, menuId, menuPrice, menuOrderCount, menuFlavorScore, menuSalesStatus, categoryId) VALUES
(1, 1, 5000, 0, 4.5, TRUE, 3),  -- 에스프레소
(1, 2, 5500, 0, 4.0, TRUE, 3),  -- 아메리카노
(1, 3, 6000, 0, 4.2, TRUE, 3),  -- 카페 라떼
(1, 5, 5800, 0, 4.3, TRUE, 3),  -- 바닐라 라떼
(1, 6, 6200, 0, 4.4, TRUE, 3), -- 카라멜 마키아토
(1, 4, 5300, 0, 4.1, TRUE, 7),  -- 녹차 라떼
(1, 7, 4800, 0, 4.0, TRUE, 4),  -- 아이스 티
(1, 8, 5900, 0, 4.3, TRUE, 8),  -- 모카빵
(1, 9, 5500, 0, 4.2, TRUE, 8),  -- 허니브레드
(1, 10, 4500, 0, 3.9, TRUE, 6); -- 레몬 에이드

SELECT * FROM cafe_menu;

-- 옵션 데이터 추가
INSERT INTO options (optionName, useCount) VALUES
('온도', 1),
('얼음량', 1),
('휘핑크림', 1),
('시럽', 1),
('샷', 1),
('쿠키', 1),
('펄', 1),
('토핑', 1),
('드리즐', 1);

SELECT * FROM options;

-- 카페 오은지 (cafeId = 1)의 옵션 설정
INSERT INTO cafe_option (cafeId, optionId, optionPrice, optionContents, optionSalesStatus) VALUES
(1, 1, 0, '핫', TRUE),
(1, 1, 0, '아이스', TRUE),
(1, 2, 0, '적게', TRUE),
(1, 2, 0, '보통', TRUE),
(1, 2, 0, '많이', TRUE),
(1, 5, 0, '샷 추가 없음', TRUE),
(1, 5, 500, '샷 추가', TRUE),
(1, 3, 500, '기본(추가)', TRUE),
(1, 3, 500, '휘핑 없음', TRUE),
(1, 4, 0, '시럽 없음', TRUE),
(1, 4, 300, '바닐라', TRUE),
(1, 4, 300, '카라멜', TRUE),
(1, 4, 300, '헤이즐넛', TRUE),
(1, 6, 500, '쿠키 추가', TRUE),
(1, 7, 500, '펄 추가', TRUE),
(1, 8, 0, '토핑 기본(추가)', TRUE),
(1, 8, 0, '토핑 제외', TRUE),
(1, 9, 0, '드리즐 기본(추가)', TRUE),
(1, 9, 0, '드리즐 제외', TRUE);

SELECT * FROM cafe_option;

-- menu_list 테이블 데이터 삽입

-- 에스프레소 메뉴 (menuId = 1)
INSERT INTO menu_list (cafeId, menuId, cafeOptionId) VALUES
(1, 1, 1),  -- 온도: 핫
(1, 1, 6), -- 기본 샷
(1, 1, 7); -- 샷 추가

-- 아메리카노 메뉴 (menuId = 2)
INSERT INTO menu_list (cafeId, menuId, cafeOptionId) VALUES
(1, 2, 1),  -- 온도: 핫
(1, 2, 2),  -- 온도: 아이스
(1, 2, 3),  -- 얼음량: 적게
(1, 2, 4),  -- 얼음량: 보통
(1, 2, 5),  -- 얼음량: 많이
(1, 2, 6), -- 기본 샷
(1, 2, 7), -- 샷 추가
(1, 2, 10), -- 시럽: 없음
(1, 2, 11),  -- 시럽: 바닐라
(1, 2, 12),  -- 시럽: 카라멜
(1, 2, 13); -- 시럽: 헤이즐넛

-- 카페 라떼 메뉴 (menuId = 3)
INSERT INTO menu_list (cafeId, menuId, cafeOptionId) VALUES
(1, 3, 1),  -- 온도: 핫
(1, 3, 2),  -- 온도: 아이스
(1, 3, 3),  -- 얼음량: 적게
(1, 3, 4),  -- 얼음량: 보통
(1, 3, 5),  -- 얼음량: 많이
(1, 3, 6), -- 기본 샷
(1, 3, 7), -- 샷 추가
(1, 3, 8),  -- 휘핑크림: 추가
(1, 3, 9),  -- 휘핑크림: 없음
(1, 3, 10), -- 시럽: 없음
(1, 3, 11),  -- 시럽: 바닐라
(1, 3, 12),  -- 시럽: 카라멜
(1, 3, 13); -- 시럽: 헤이즐넛

-- 녹차 라떼 메뉴 (menuId = 4)
INSERT INTO menu_list (cafeId, menuId, cafeOptionId) VALUES
(1, 4, 1),  -- 온도: 핫
(1, 4, 2),  -- 온도: 아이스
(1, 4, 3),  -- 얼음량: 적게
(1, 4, 4),  -- 얼음량: 보통
(1, 4, 5),  -- 얼음량: 많이
(1, 4, 8),  -- 휘핑크림: 추가
(1, 4, 9);  -- 휘핑크림: 없음

-- 바닐라 라떼 메뉴 (menuId = 5)
INSERT INTO menu_list (cafeId, menuId, cafeOptionId) VALUES
(1, 5, 1),  -- 온도: 핫
(1, 5, 2),  -- 온도: 아이스
(1, 5, 3),  -- 얼음량: 적게
(1, 5, 4),  -- 얼음량: 보통
(1, 5, 5),  -- 얼음량: 많이
(1, 5, 6), -- 기본 샷
(1, 5, 7), -- 샷 추가
(1, 5, 8),  -- 휘핑크림: 추가
(1, 5, 9),  -- 휘핑크림: 없음
(1, 5, 10), -- 시럽: 없음
(1, 5, 11),  -- 시럽: 바닐라
(1, 5, 12),  -- 시럽: 카라멜
(1, 5, 13); -- 시럽: 헤이즐넛

-- 카라멜 마키아토 메뉴 (menuId = 6)
INSERT INTO menu_list (cafeId, menuId, cafeOptionId) VALUES
(1, 6, 1),  -- 온도: 핫
(1, 6, 2),  -- 온도: 아이스
(1, 6, 3),  -- 얼음량: 적게
(1, 6, 4),  -- 얼음량: 보통
(1, 6, 5),  -- 얼음량: 많이
(1, 6, 6), -- 기본 샷
(1, 6, 7), -- 샷 추가
(1, 6, 8),  -- 휘핑크림: 추가
(1, 6, 9),  -- 휘핑크림: 없음
(1, 6, 10), -- 시럽: 없음
(1, 6, 11),  -- 시럽: 바닐라
(1, 6, 12),  -- 시럽: 카라멜
(1, 6, 13); -- 시럽: 헤이즐넛

-- 아이스 티 메뉴 (menuId = 7)
INSERT INTO menu_list (cafeId, menuId, cafeOptionId) VALUES
(1, 7, 3),  -- 얼음량: 적게
(1, 7, 4),  -- 얼음량: 보통
(1, 7, 5),  -- 얼음량: 많이
(1, 7, 6), -- 기본 샷
(1, 7, 7);  -- 샷 추가..

-- 모카빵 메뉴 (menuId = 8)
INSERT INTO menu_list (cafeId, menuId, cafeOptionId) VALUES
(1, 8, 8),  -- 휘핑크림: 추가
(1, 8, 9),  -- 휘핑크림: 없음
(1, 8, 10), -- 시럽: 없음
(1, 8, 11),  -- 시럽: 바닐라
(1, 8, 12),  -- 시럽: 카라멜
(1, 8, 13); -- 시럽: 헤이즐넛

-- 허니브레드 메뉴 (menuId = 9)
INSERT INTO menu_list (cafeId, menuId, cafeOptionId) VALUES
(1, 9, 8),  -- 휘핑크림: 추가
(1, 9, 9),  -- 휘핑크림: 없음
(1, 9, 10), -- 시럽: 없음
(1, 9, 11),  -- 시럽: 바닐라
(1, 9, 12),  -- 시럽: 카라멜
(1, 9, 13); -- 시럽: 헤이즐넛

-- 레몬 에이드 메뉴 (menuId = 10)
INSERT INTO menu_list (cafeId, menuId, cafeOptionId) VALUES
(1, 10, 3),  -- 얼음량: 적게
(1, 10, 4),  -- 얼음량: 보통
(1, 10, 5);  -- 얼음량: 많이

SELECT * FROM menu_list;

INSERT INTO bookmark (alias, lastModifyDate, userId) VALUES
('진짜 마쉿숨', NOW(), 2),
('ㄹㅇㄹㅇ마쉿슴ㅋ', '2020-06-10 12:35:19', 2),
('이건 힘든 날 마셔..', '2023-01-10 17:35:19', 2),
('한 잔해', '2010-09-16 14:35:33', 2);

SELECT * FROM bookmark;

INSERT review (reviewTitle, reviewContents, reviewDate, reviewPhotoUrl, serviceScore, flavorScore, moodScore, userId, cafeId) VALUES
('마쉿당', '진짜진짜임', '2020-06-15 17:55:19', 'https://cdxarchivephoto.s3.ap-northeast-2.amazonaws.com/_IMG_1880.jpeg', 5, 5, 5, 2, 1),
('여기도 마쉿당', '진짜진짜진짜임ㅋㅋ', '2021-06-15 17:55:19', 'https://cdxarchivephoto.s3.ap-northeast-2.amazonaws.com/_IMG_1880.jpeg', 5, 5, 5, 2, 1);

SELECT * FROM review;

INSERT comment (commentContents, commentDate, userId, reviewId) VALUES
('ㅋㅋ 감사요 ㅋ 또 오셈 ㅋ', '2020-06-15 17:57:19', 11, 1),
('압도적 감사..!', '2021-06-15 17:55:29', 11, 2);

SELECT * FROM comment;

INSERT combo (menuCount, optionCount, reviewId, menuListId, bookmarkId) VALUES
(1, 1, 1, 1, NULL), -- 에스프레소 핫
(1, 2, 1, 2, NULL), -- 에스프레소 샷 추가 2회
(1, 1, NULL, 4, NULL), -- 아메리카노 아이스
(1, 1, NULL, 6, NULL), -- 아메리카노 얼음 보통
(1, 1, NULL, 8, NULL), -- 아메리카노 기본 샷
(1, 1, NULL, 4, 1), -- 아메리카노 아이스
(1, 1, NULL, 6, 1), -- 아메리카노 얼음 보통
(1, 1, NULL, 8, 1); -- 아메리카노 기본 샷

-- DELETE FROM bookmark WHERE bookmarkId = 1; -- 즐겨찾기 삭제룰
/*
- 회원 삭제 시
1. 사용자인 경우
즐겨찾기 삭제를 한다
리뷰는 -> userId = NULL, 내용 = 삭제된 리뷰입니다. -> 삭제가 아닌 변경
+ (사업자는 회원ID가 NULL인 경우 : 삭제할지 말지 선택 가능하다.)

2. 사업자인 경우
카페 삭제

------------------------------------------------------------------------------------------------------------------------------------------------------------
- 카페 삭제하는 경우
1. 동일명 메뉴가 있는 경우 : 카페별 메뉴 삭제 -> 카페별 옵션 삭제 -> 카페 메뉴판 삭제 -> 조합 삭제 -> 리뷰 삭제 -> 코멘트 삭제
2. 동일명 메뉴가 없는 경우 : 카페별 카테고리 삭제부터 ~~

------------------------------------------------------------------------------------------------------------------------------------------------------------
메뉴 삭제하는 경우
1. 해당 메뉴를 판매하는 마지막 카페 폐업하는 경우 = 카페 삭제와 같은 상태
2. 위와 같은 경우는 아닌 경우 : 판매 여부를 N으로 update

------------------------------------------------------------------------------------------------------------------------------------------------------------
옵션 삭제하는 경우
메뉴와 같음

------------------------------------------------------------------------------------------------------------------------------------------------------------
리뷰 삭제 시
1. 코멘트가 달려 있는 경우 : 리뷰를 삭제하는 것이 아닌, 제목은 빈칸 / 내용은 "삭제된 리뷰입니다." / userId를 NULL -> (알 수 없음) 이 되게끔 update를 해준다.
2. 코멘트가 안 달려 있는 경우 : 리뷰를 삭제한다.
3. 리뷰 삭제 시 조합에 있는 리뷰ID는 NULL로 바꿔준다. (삭제하는 것이 아님)

------------------------------------------------------------------------------------------------------------------------------------------------------------
코멘트 삭제 시
사업자가 삭제하는 경우만 존재

------------------------------------------------------------------------------------------------------------------------------------------------------------
즐겨찾기 삭제 시
1. 조합 테이블에서 즐겨찾기 ID = NULL

------------------------------------------------------------------------------------------------------------------------------------------------------------
휴면 회원으로 이동 -> 6개월
회원 탈퇴 시 정보 보유 -> 1개월

*/
## 유저 (사업자)
-- 19. 카페 등록
-- 입점 문의에 대해서는 이후에
-- insert : cafe에 대한 더미데이터 등록
INSERT INTO cafe (cafeName, cafeAddress, cafePhone, franchise)
VALUES ('카페 이름', '카페 주소', '카페 전화번호', '프랜차이즈 여부');

-- 20. 내 매장 조회
-- select : cafeId 로 사업자 userid가 같은 매장들을 조회
SELECT
	cafeName
	,cafeAddress
	,cafePhone
	,franchise
FROM cafe
WHERE userId = '사업자ID';

-- 21. 카페 수정
-- update : 카페명, 카페 주소, 카페 전화번호, 카페 오픈 여부, 프렌차이즈 여부 수정 가능
UPDATE cafe
SET cafeName = '새 카페 이름',
    cafeAddress = '새 카페 주소',
    cafePhone = '새 카페 전화번호',
    cafeOpenStatus = 'Y',
    franchise = 'N'
WHERE cafeId = '카페ID' 
AND userId = '사업자ID';

-- 22 카테고리 등록
-- insert : 카테고리 더미데이터 삽입
INSERT INTO category (categoryName)
VALUES ('카테고리 이름');

-- 23. 카테고리 명 수정
-- update : 카테고리 명 수정
UPDATE category
SET categoryName = '새 카테고리 이름'
WHERE categoryId = '카테고리ID';

-- 24. 메뉴 등록
-- insert : 메뉴 더미데이터 삽입
INSERT INTO menu (menuName, menuPrice, cafeId) -- 메뉴명은 카페별메뉴명이 필요없는가
VALUES ('메뉴 이름', '메뉴 가격', '카페ID');

-- 25. 메뉴 수정
-- update : 메뉴명 수정, 메뉴 가격 수정, 메뉴 판매 여부 수정
UPDATE menu
SET menuName = '새 메뉴 이름',
    menuPrice = '새 메뉴 가격',
    menuSalesStatus = 'Y'
WHERE menuId = '메뉴ID' 
AND cafeId = '카페ID';

-- 메뉴 삭제
DELETE FROM menu 
WHERE cafeId = '카페ID';

-- 26. 옵션 등록
-- insert : 옵션 더미데이터 삽입
INSERT INTO options (optionName, optionPrice, menuId)
VALUES ('옵션명', '옵션 가격', '메뉴ID');

-- 27. 옵션 수정
-- update : 옵션명 수정, 옵션 가격 수정, 옵션 판매 여부 수정
UPDATE cafe_option
SET optionName = '새 옵션 이름',
    optionPrice = '새 옵션 가격',
    optionSalesStatus = 'Y'
WHERE optionId = '옵션ID' 
AND menuId = '메뉴ID';

-- 옵션 삭제
DELETE FROM cafe_option 
WHERE menuId IN (SELECT menuId FROM menu 
					  WHERE cafeId = '카페ID');

-- 28. 카페, 메뉴, 옵션 삭제

-- 카페 삭제하는 경우
START TRANSACTION;

-- 동일명 메뉴가 있는지 확인
IF EXISTS (SELECT 1 FROM menu WHERE cafeId = '카페ID' 
AND EXISTS (SELECT 1 FROM menu WHERE menuName = '메뉴이름')) 
THEN
    
-- 1. 동일명 메뉴가 있는 경우 : 카페별 메뉴 삭제 -> 카페별 옵션 삭제 -> 카페 메뉴판 삭제 -> 조합 삭제 -> 리뷰 삭제 -> 코멘트 삭제
	 DELETE FROM menu WHERE cafeId = '카페ID';
	 DELETE FROM cafe_option WHERE menuId IN (SELECT menuId FROM menu
														 WHERE cafeId = '카페ID');
    DELETE FROM menu_list WHERE cafeId = '카페ID';
    DELETE FROM combo WHERE cafeId = '카페ID';
    DELETE FROM review WHERE cafeId = '카페ID';
    DELETE FROM comment WHERE reviewId IN (SELECT reviewId FROM review
	 														 WHERE cafeId = '카페ID');
ELSE

-- 2. 동일명 메뉴가 없는 경우 : 카페별 카테고리 삭제부터 ~~
	 DELETE FROM category WHERE cafeId = '카페ID';
	 DELETE FROM menu WHERE cafeId = '카페ID';
    DELETE FROM cafe_option WHERE menuId IN (SELECT menuId FROM menu 
	 													WHERE cafeId = '카페ID');
    DELETE FROM menu_list WHERE cafeId = '카페ID';
    DELETE FROM combo WHERE cafeId = '카페ID';
    DELETE FROM review WHERE cafeId = '카페ID';
    DELETE FROM comment WHERE reviewId IN (SELECT reviewId FROM review
	 														 WHERE cafeId = '카페ID');
END IF;

COMMIT;

-- 메뉴 삭제하는 경우
-- 1. 해당 메뉴를 판매하는 마지막 카페 폐업하는 경우 = 카페 삭제와 같은 상태
-- 2. 위와 같은 경우는 아닌 경우 : 판매 여부를 N으로 update

-- 옵션 삭제하는 경우
-- 메뉴와 같음

-- 29. 코멘트 등록
-- 회원이 리뷰를 단 뒤, 사업자가 코멘트를 달 수 있다.
-- insert : 더미데이터
INSERT INTO comment (commentId, userId, commentContents)
VALUES ('코멘트ID', '사업자ID', '코멘트 내용');

-- 30. 코멘트 수정
-- 사업자는 회원과 달리 매장 이미지로 인해 악의적인 행동은 하지 않을 것으로 생각하여
-- update : 내용 수정 가능
UPDATE comment
SET commentContents = '새 코멘트 내용'
WHERE commentId = '코멘트ID' 
AND userId = '사업자ID';

-- 31. 코멘트 삭제
-- 사업자는 코멘트를 삭제할 수 있음
DELETE FROM comment 
WHERE commentId = '코멘트ID' 
AND userId = '사업자ID';

## 유저(관리자)
-- 32. 회원 관리
-- 악의적인 회원을 블랙리스트로 등록할 수 있음 (update : 블랙리스트 여부, 블랙리스트 등록 일자, 블랙 사유)

-- 모든 회원 조회
SELECT *
FROM users;

-- 특정 회원 조회
SELECT *
FROM users
	WHERE userId = '회원ID';

-- 블랙리스트 등록
UPDATE users
SET blackUserStatus = TRUE 
    ,blackRegDate = NOW()
    ,blackReason = '욕설'
   WHERE userId = '회원ID';
   
-- 블랙리스트 해제
UPDATE users
SET blackUserStatus = FALSE 
    ,blackRegDate = NULL 
    ,blackReason = NULL 
   WHERE userId = '회원ID';
   
-- 33. 매장 관리
-- 사업자의 매장을 등록, 삭제할 수 있어야 함. (사업자에게 매장 등록 시 기본 데이터 입력 구조를 준다는 가정)
-- 폐업 시 매장 삭제 권한이 있어야 

-- 모든 매장 조회
SELECT *
FROM cafe;

-- 특정 매장 조회
SELECT *
FROM cafe
	WHERE cafeId = '카페ID';
	
-- 매장 등록
INSERT INTO cafe (cafeName, cafeAddress, cafePhone, userId, franchise)
VALUES ('카페 이름', '카페 주소', '카페 전화번호', '사업자ID', '프랜차이즈 여부');

-- 매장 삭제
DELETE FROM cafe 
WHERE cafeId = '카페ID';