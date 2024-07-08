![](sample_data/img/banner.png)
# Ureca
| Your Recommended Cafe

#### 🌱 TEAM
[😺전기범](https://github.com/woodart8)&nbsp;&nbsp;&nbsp;&nbsp;[🐕조제훈](https://github.com/JoJeHuni)&nbsp;&nbsp;&nbsp;&nbsp;[🐢방동호](https://github.com/Bang1999)&nbsp;&nbsp;&nbsp;&nbsp;[🦎최해관](https://github.com/Haegwan-Choe)&nbsp;&nbsp;&nbsp;&nbsp;[🐈이효진](https://github.com/jinjin0528)

#### 기술 스택
![Ubuntu](https://img.shields.io/badge/ubuntu-orange?style=for-the-badge&logo=ubuntu)
![linux](https://img.shields.io/badge/linux-black?style=for-the-badge&logo=linux)
![mariadb](https://img.shields.io/badge/mariadb-gray?style=for-the-badge&logo=mariadb)

#### 협업 툴
![git](https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white)
![github](https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white)
![notion](https://img.shields.io/badge/notion-000000?style=for-the-badge&logo=notion&logoColor=white)
![discord](https://img.shields.io/badge/discord-5865F2?style=for-the-badge&logo=discord&logoColor=white)


### 전체 프로젝트 일정
<details> 
<summary>프로젝트 일정 : 2024년 07월 01일 ~ 2024년 07월 09일(WBS)</summary>
  <div align="center">
    <img src="sample_data/img/projectschedule.png">
  </div>

</details>

### 목차

- [1. 프로젝트 개요](#1-프로젝트-개요)
- [2. 국내외 유사 서비스와 차별성](#2-국내외-유사-서비스와-차별성)
- [3. 프로젝트 설계](#3-프로젝트-설계)
- [4. 프로젝트 수행 결과](#4-프로젝트-수행-결과)
- [5. 프로젝트 수행 체계](#5-프로젝트-수행-체계)
- [6. 팀 회고](#6-팀-회고)
- [7. 참고문헌](#7-참고문헌)

---

## 1. 프로젝트 개요

### 1.1 프로젝트 소개

![Untitled (4)](https://github.com/beyond09-DBDBDeep/Ureca/assets/122279082/131890fa-734c-4b28-b077-1b8b8c5efbdb) |![Untitled (5)](https://github.com/beyond09-DBDBDeep/Ureca/assets/122279082/36c4ac70-0fbc-445b-83bf-baf423aa17b5)
--- | --- | 

**처음 가는 카페에서 어떤 음료를 마실지 고민하시는 모든 분들!**

✔️ 유레카에서 여러 음료의 조합 정보를 서로 공유하며 꿀팁을 얻어가세요!

✔️ 분산되어 있는 카페 정보들을 한 눈에 볼 수 있습니다.

✔️ 가게 별 베스트 메뉴는 다르죠! 서로의 추천으로 메뉴 별 맛집을 찾아가세요.


---
### 1.2 프로젝트 배경

![](sample_data/img/img1.png)

<그림 1> “한국 커피 전문점 매장 추이

국내의 커피 전문점 수는 2023년 기준으로 약 10만 개에 이르며, 카페 창업이 늘어남에 따라 브랜드 간 경쟁이 치열해지고 있다.

카페는 프랜차이즈와 개인 카페로 나뉘는데, 프랜차이즈에는 스타벅스, 커피빈, 메가 커피 등 큰 규모의 카페이고, 개인 카페는 주로 주거 지역이나 핫플레이스 근처의 골목에 위치한 개인 카페이다.

![](sample_data/img/img2.png)

<그림 2> 카페 1회 방문 시 평균 지출 금액

개인 카페는 프랜차이즈 카페와의 가격 경쟁에서 우위를 점하기 어려운데, 이는 프랜차이즈가 큰 규모의 이점을 이용해 원재료 비용을 절감하고 가격을 낮출 수 있기 때문이다.

반면 개인 카페는 규모가 작기 때문에 커피 가격을 낮추는데 한계가 있다. 실제로, 평균 지출 금액을 비교해보면, 대형 프랜차이즈 카페의 가격이 더 경쟁력 있다는 것을 알 수 있다.

![](sample_data/img/img3.png)

<그림 3> 개인 카페를 선호하는 이유

따라서, 개인 카페는 가격 외의 차별화 전략으로 고객들을 찾아오게 해야 한다.

오픈서베이의 설문조사에 따르면, 커피 소비자들이 개인 카페를 선호하는 이유는 다음과 같이 조사되었다. 개인 카페들이 경쟁력을 갖추기 위해서는 특색 있는 인테리어, 맛있는 음료와 디저트 같은 조건을 만족해야 한다는 것이다. 카페에도 쏠림 현상이 강하기 때문에 다른 가게와의 차별화된 메뉴는 매출 상승과 직결된다.

다만, 모든 조건을 만족한다고 하더라도 경쟁에서 무조건 살아남을 수 있는 것은 아니다.

결국 매출을 올리기 위해서는 홍보가 필수적인 부분이며, 개인 카페는 프랜차이즈 카페에 비해 홍보수단이 많지 않은 실정이다. 따라서 본 프로젝트는 홍보가 어려운 개인 카페의 홍보를 도와주고, 사용자로 하여금 다양한 선택지를 가질 수 있게 하는 것을 목표로 한다.

------

## 2. 국내외 유사 서비스와 차별성

### 2.1 관련 서비스

<details>
  <summary> 배달의 민족, 요기요, 쿠팡 </summary>
    <li> 오더(픽업 및 매장 주문) - 음식 카테고리 별 상품 </li>
    <li> 주문내역, 나의 찜(매장) </li>
    <li> 전자영수증 </li>
    <li> 계정 정보 / 개인정보 관리 </li>
    <li> 결제 수단 관리 </li>
  	<li> 배달 서비스 </li>
  	<li> 고객지원</li>
</details>

<details>
  <summary> 스타벅스 </summary>
    <li> 오더(픽업 및 매장 주문) - 음료/푸드/상품 </li>
    <li> 나만의 메뉴(= 즐겨찾기(+ 커스텀 옵션)) </li>
    <li> 홀케이크 예약 </li>
    <li> 장바구니 </li>
    <li> 히스토리(주문 내역 조회) </li>
    <li> 별 히스토리(= 스탬프) </li>
    <li> 전자영수증 </li>
    <li> 계정 정보 / 개인정보 관리 </li>
    <li> 결제 수단 관리 </li>
    <li> 숍(온라인 스토어 : 굿즈 관련) </li>
    <li> 스타벅스 모바일 카드 선물 및 모바일 상품권 선물 </li>
    <li> 배달 서비스 </li>
    <li> 고객지원 </li>
</details>

<details>
  <summary> 메가커피 </summary>
    <li> 멤버쉽(스탬프, 쿠폰, 외부 멤버쉽) </li>
    <li> 주문 </li>
    <li> 새소식(이벤트, 공지사항) </li>
    <li> 약관 및 정책(이용약관) </li>
</details>

<details>
  <summary> 투썸 </summary>
    <li> 마이페이지 </li>
    <li> 메뉴소개 </li>
    <li> 매장찾기 </li>
    <li> 투썸하트(=스탬프) </li>
    <li> 쿠폰함 </li>
    <li> 이벤트 </li>
    <li> 투썸오더(주문 기능) </li>
    <li> 홀케이크24 </li>
    <li> 주문내역 </li>
    <li> 스탬프(이벤트용) </li>
    <li> 선물하기 </li>
    <li> 기프트카드(투썸카드) </li>
    <li> 마이카드(내 투썸카드 등록 및 결제, 관리) </li>
    <li> 공지사항 </li>
    <li> 고객의 소리 </li>
    <li> 제휴카드 (할인 가능 카드) </li>
    <li> 이용약관 </li>
    <li> 가맹정보 및 창업 설명회 </li>
</details>

<details>
  <summary> 빽다방 </summary>
    <li> 스탬프 </li>
    <li> 마이쿠폰 </li>
    <li> 기프트샵(빽다방 상품권 및 기프티콘) </li>
    <li> 오더(픽업 오더 및 배달 오더 </li>
    <li> 이벤트 </li>
    <li> 매장찾기 </li>
    <li> 전자영수증 </li>
    <li> 공지사항 </li>
    <li> 이용안내 </li>
    <li> 마이페이지 </li>
</details>

<details>
  <summary> 패스오더 </summary>
    <li> 원거리 주문, 결제 가능(매장 리스트로 주문, 지도로 주문) </li>
    <li> 테이블 주문, 결제 가능(앉은 테이블에 부착된 QR코드와 NFC인식으로 주문, 결제 가능) </li>
    <li> 맞춤형 광고 제공 </li>
    <li> 매출 분석(월별 판매 분석, 결제 수단, 매출 요약) </li>
    <li> 쿠폰함 </li>
    <li> 포인트 / 스탬프 </li>
    <li> 적립 마켓 </li>
    <li> 선물하기 </li>
    <li> 자주가요(자주가는 매장 등록) </li>
</details>

---
### 2.2 차별성

| 기능\서비스         | “유레카(URECA)”   | 스타벅스          | 메가커피     | 배달의 민족                    |
| ------------------- | ----------------- | ----------------- | ------------ | ------------------------------ |
| 즐겨찾기 저장       | O                 | O                 | X            | △(매장만 찜)                   |
| 리뷰                | O                 | △(기업 자체 설문) | X            | O                              |
| 카페 홍보           | O(위치 기반 노출) | △(자사 홍보)      | △(자사 홍보) | O(일정 요금 지불 후 상단 노출) |
| 각 메뉴의 리뷰 공유 | O                 | X                 | X            | O                              |
| 다양한 매장 입점    | O                 | X                 | X            | O                              |


---
## 3. 프로젝트 설계

### 3.1 FLOW CHARTS

![image](sample_data/img/flowchart.png)



---
### 3.2 프로젝트 요구사항


| 요구사항 ID | 요구사항명 | 요구사항 내용 | 중요도 (상/중/하) | 난이도(상/중/하) |
| --- | --- | --- | --- | --- |
| REQ-001 | 회원 가입 | 사용자는 카페 관리 사이트에 회원 또는 사업자로 가입할 수 있어야 함 | 상 | 하 |
| REQ-002 | 회원 탈퇴 | 사용자는 원한다면 언제든지 탈퇴할 수 있어야 함 | 상 | 하 |
| REQ-003 | 로그인 | 등록된 회원은 아이디(이메일)와 비밀번호를 사용해 로그인할 수 있어야 함 | 상 | 중 |
| REQ-004 | 로그아웃 | 회원은 언제든지 로그아웃할 수 있어야 함 | 상 | 하 |
| REQ-005 | 비밀번호 변경 | 회원은 비밀번호를 변경할 수 있어야 함 | 상 | 하 |
| REQ-006 | 아이디 찾기 | 아이디를 분실한 경우 이름과 전화번호로 찾을 수 있어야 함 | 상 | 하 |
| REQ-007 | 비밀번호 찾기 | 비밀번호를 분실한 경우 아이디, 이름, 전화번호로 찾을 수 있어야 함 | 상 | 하 |
| REQ-008 | 개인 정보 수정 | 사용자는 언제든지 개인 정보를 수정할 수 있어야 함 | 중 | 하 |
| REQ-009 | 매장 조회 | 사용자는 다양한 조건으로 매장을 검색할 수 있어야 함 | 상 | 하 |
| REQ-010 | 메뉴 조회 | 사용자는 다양한 조건으로 메뉴를 검색할 수 있어야 함 | 상 | 하 |
| REQ-011 | 리뷰 조회 | 사용자는 메뉴마다 리뷰를 조회할 수 있어야 함 | 상 | 상 |
| REQ-012 | 옵션 조회 | 사용자는 메뉴를 선택한 후 옵션을 확인할 수 있어야 함 | 상 | 중 |
| REQ-013 | 리뷰 작성 | 사용자는 즐겨찾기 된 조합에 대해 카페에 별점 및 리뷰를 작성할 수 있어야 함 | 상 | 하 |
| REQ-014 | 리뷰 수정 | 사용자는 본인이 작성한 리뷰를 수정할 수 있어야함 | 상 | 하 |
| REQ-015 | 리뷰 삭제 | 사용자는 본인이 작성한 리뷰를 삭제할 수 있어야함 | 상 | 중 |
| REQ-016 | 즐겨찾기 등록 | 사용자는 본인의 메뉴 조합으로 즐겨찾기를 등록할 수 있어야 함 | 상 | 상 |
| REQ-017 | 즐겨찾기 수정 | 사용자는 즐겨찾기에 등록한 정보를 수정할 수 있어야 함 | 상 | 중 |
| REQ-018 | 즐겨찾기 삭제 | 사용자는 즐겨찾기에 등록한 조합을 삭제할 수 있어야 함 | 상 | 상 |
| REQ-019 | 매장 찜 등록, 삭제 | 회원 사용자는 찜해두고 싶은 매장을 등록, 삭제할 수 있어야 함 | 상 | 하 |
| REQ-020 | 로그인 내역 기록 | 사용자가 회원 로그인을 시도하면 그 내역이 기록되어야 함 | 중 | 상 |

### **2) 사업자**

| 요구사항 ID | 요구사항명 | 요구사항 내용 | 중요도(상/중/하) | 난이도(상/중/하) |
| --- | --- | --- | --- | --- |
| REQ-021 | 매장 등록 문의 | 사업자인 사용자는 본인 매장에 대한 정보를 신청할 수 있어야 함 | 상 | 하 |
| REQ-022 | 매장 삭제 문의 | 폐업 시 언제든지 매장 정보를 삭제할 수 있어야 함 | 상 | 하 |
| REQ-023 | 메뉴 등록 | 사업자인 사용자 본인은 언제든지 메뉴를 등록할 수 있어야 함 | 상 | 중 |
| REQ-024 | 메뉴 수정 | 사업자인 사용자 본인은 언제든지 메뉴를 수정할 수 있어야 함 | 상 | 하 |
| REQ-025 | 메뉴 삭제 | 사업자인 사용자 본인은 언제든지 메뉴를 삭제할 수 있어야 함 | 상 | 하 |
| REQ-026 | 오픈 여부 | 사업자인 사용자 본인은 오픈 여부에 대해 언제든지 수정할 수 있어야 함 | 상 | 하 |
| REQ-027 | 옵션 등록 | 사업자인 사용자 본인은 언제든지 메뉴 옵션을 등록할 수 있어야 함 | 상 | 중 |
| REQ-028 | 옵션 수정 | 사업자인 사용자 본인은 언제든지 옵션을 수정할 수 있어야 함 | 상 | 하 |
| REQ-029 | 옵션 삭제 | 사업자인 사용자 본인은 언제든지 옵션을 삭제할 수 있어야 함 | 상 | 하 |
| REQ-030 | 카테고리 등록 | 사업자인 사용자 본인은 언제든지 메뉴 별 카테고리를 등록할 수 있어야 함 | 상 | 하 |
| REQ-031 | 코멘트 등록 | 사업자인 사용자 본인은 언제든지 회원이 남긴 리뷰에 코멘트를 등록할 수 있어야 함 | 상 | 하 |
| REQ-032 | 코멘트 수정 | 사업자인 사용자는 본인이 남긴 코멘트를 수정할 수 있어야 함 | 상 | 하 |
| REQ-033 | 코멘트 삭제 | 사업자인 사용자는 본인이 남긴 코멘트를 삭제할 수 있어야 함 | 상 | 하 |

### **3) 관리자**

| 요구사항 ID | 요구사항명 | 요구사항 내용 | 중요도(상/중/하) | 난이도 (상/중/하) |
| --- | --- | --- | --- | --- |
| REQ-034 | 회원 관리 | 관리자는 회원이나 사업자를 수정, 삭제할 수 있어야 함 | 하 | 하 |
| REQ-035 | 블랙리스트 관리 | 관리자는 회원이나 사업자를 블랙리스트 등록 및 삭제할 수 있어야 함 | 중 | 하 |
| REQ-036 | 매장 관리 | 관리자는 등록된 매장 정보를 수정 및 삭제할 수 있어야 함 | 상 | 상 |
| REQ-037 | 휴면 계정 관리 | 회원을 휴면 계정 상태로 변경하거나 휴면 해제를 할 수 있어야 함 | 중 | 상 |


---
### 3.3 주요기능

#### 1) 일반 회원

- 매장 검색
- 즐겨찾기
- 리뷰

#### 2) 사업자

- 매장 관리
- 메뉴 관리(등록, 수정, 삭제)
- 리뷰에 대한 코멘트

#### 3) 관리자

- 회원 관리
- 매장 관리

---
### 3.4 데이터베이스 모델링

#### (1) 개념 모델

![image](sample_data/img/conModel.png)


#### (2) 논리 모델

![Untitled (2)](sample_data/img/logModel.png)

#### (3) 물리 모델

![Untitled (3)](sample_data/img/phyModel.png)

---
## 4. 프로젝트 수행 결과

### 4.1 테스트 케이스 문서




---
### 4.2 테스트 결과

[![GitHub open issues](https://img.shields.io/github/issues/beyond09-DBDBDeep/Ureca)](https://github.com/beyond09-DBDBDeep/Ureca/issues?q=is%3Aopen+is%3Aissue)

[![GitHub close issues](https://img.shields.io/github/issues-closed/beyond09-DBDBDeep/Ureca)](https://github.com/beyond09-DBDBDeep/Ureca/issues?q=is%3Aissue+is%3Aclosed)

<details>
<summary><b>회원</b></summary>
    <div>
         <details>
         <summary><b>1. 회원가입</b></summary>
         <p><img src="sample_data/testcase/회원/1_회원가입.gif"/></p>
         </details>
	 <details>
         <summary><b>2. 로그인 성공</b></summary>
         <p><img src="sample_data/testcase/회원/2_로그인 성공.gif"/></p>
         </details>
	 <details>
         <summary><b>3. ★★★★로그인 실패</b></summary>
         <p><img src="PNG/Captures/user/회원_회원정보_수정1.png"/></p>
	 <p><img src="PNG/Captures/user/회원_회원정보_수정2.png"/></p>
         </details>
	 <details>
         <summary><b>4. 아이디 찾기</b></summary>
         <p><img src="sample_data/testcase/회원/4_아이디찾기.gif"/></p>
         </details>
	 <details>
         <summary><b>5. 비밀번호 찾기</b></summary>
         <p><img src="sample_data/testcase/회원/5_비밀번호찾기.gif"/></p>
         </details>
	 <details>
         <summary><b>6. 비밀번호 수정</b></summary>
         <p><img src="sample_data/testcase/회원/6_비밀번호수정.gif"/></p>
         </details>
	 <details>
         <summary><b>7. 매장 조회</b></summary>
         <p><img src="sample_data/testcase/회원/7_매장조희.gif"/></p>
         </details>				 
	 <details>
         <summary><b>8. 메뉴 조회</b></summary>
         <p><img src="sample_data/testcase/회원/8_메뉴조회.gif"/></p>
         </details>
     <details>
         <summary><b>9. 옵션 조회</b></summary>
         <p><img src="sample_data/testcase/회원/9_옵션조회.gif"/></p>
         </details>
     <details>
         <summary><b>10. 즐겨찾기 추가</b></summary>
         <p><img src="sample_data/testcase/회원/10_즐겨찾기.gif"/></p>
	 <p><img src="PNG/Captures/user/회원_닉네임검색2.png"/></p>
         </details>
     <details>
         <summary><b>11. ★★★★즐겨찾기 수정</b></summary>
         <p><img src="PNG/Captures/user/회원_닉네임검색1.png"/></p>
	 <p><img src="PNG/Captures/user/회원_닉네임검색2.png"/></p>
         </details>
     <details>
         <summary><b>12. ★★★★즐겨찾기 삭제</b></summary>
         <p><img src="PNG/Captures/user/회원_닉네임검색1.png"/></p>
	 <p><img src="PNG/Captures/user/회원_닉네임검색2.png"/></p>
         </details>
     <details>
         <summary><b>13. 리뷰 추가, 수정</b></summary>
         <p><img src="sample_data/testcase/회원/13,14_리뷰.gif"/></p>
         </details>
     <details>
         <summary><b>14. 리뷰 삭제, 내 리뷰 조회</b></summary>
         <p><img src="sample_data/testcase/회원/15,16_리뷰.gif"/></p>
         </details>
    <details>
         <summary><b>15. 메뉴별 리뷰 조회</b></summary>
         <p><img src="sample_data/testcase/회원/17_메뉴별 리뷰 조회.gif"/></p>
         </details>
    <details>
         <summary><b>16. 카페 찜 추가 및 삭제</b></summary>
         <p><img src="sample_data/testcase/회원/18_카페 찜 추가 및 삭제.gif"/></p>
         </details>     
    </div>
</details>

***
<details>
<summary><b>사업자</b></summary>
	<div>
         <details>
         <summary><b>1. 사업자 회원 등록</b></summary>
         <p><img src="sample_data/testcase/사업자/사업자 01.gif"/></p>
         </details>
         <details>
         <summary><b>2. 카페 등록</b></summary>
         <p><img src="sample_data/testcase/사업자/사업자 02.gif"/></p>
         </details>
         <details>
         <summary><b>3. 내 매장 조회</b></summary>
         <p><img src="sample_data/testcase/사업자/사업자 03. 내 매장 조회.gif"/></p>
         </details>
         <details>
         <summary><b>4. 카페 정보 수정</b></summary>
         <p><img src="sample_data/testcase/사업자/사업자 04. 카페 정보 수정.gif"/></p>
         </details>
         <details>
         <summary><b>5. 카테고리 등록</b></summary>
         <p><img src="sample_data/testcase/사업자/사업자 05. 카테고리 등록.gif"/></p>
         </details>
         <details>
         <summary><b>6-1. 메뉴 등록</b></summary>
         <p><img src="sample_data/testcase/사업자/사업자 06. 메뉴 등록.gif"/></p>
         </details>
         <details>
         <summary><b>6-2. 메뉴 등록 추가 설명</b></summary>
         <p><img src="sample_data/testcase/사업자/사업자 06. 메뉴 등록 추가 설명 사진.png"/></p>
         </details>
         <details>
         <summary><b>7. 메뉴 수정</b></summary>
         <p><img src="sample_data/testcase/사업자/사업자 07. 메뉴 수정.gif"/></p>
         </details>
         <details>
         <summary><b>8. 옵션 등록</b></summary>
         <p><img src="sample_data/testcase/사업자/사업자 08. 옵션 등록.gif"/></p>
         </details>
         <details>
         <summary><b>9. 옵션 수정</b></summary>
         <p><img src="sample_data/testcase/사업자/사업자 09. 옵션 수정.gif"/></p>
         </details>
	 <details>
         <summary><b>10. 메뉴, 옵션 판매 유무 수정(삭제)</b></summary>
         <p><img src="sample_data/testcase/사업자/사업자 10. 메뉴, 옵션 판매 유무 수정 (삭제).gif"/></p>
         </details>
	 <details>
         <summary><b>11. 메뉴판 등록</b></summary>
         <p><img src="sample_data/testcase/사업자/사업자 11. 메뉴판 등록.gif"/></p>
         </details>
	 <details>
         <summary><b>12. 코멘트 등록, 수정, 삭제</b></summary>
         <p><img src="sample_data/testcase/사업자/사업자 12. 코멘트 등록, 수정, 삭제.gif"/></p>
         </details>    
    </div>
</details>

***
<details>
<summary><b>관리자</b></summary>
    <div>
	 <details>
         <summary><b>1. 블랙리스트 회원 관리</b></summary>
         <p><img src="sample_data/testcase/관리자/01_블랙리스트 회원 관리.gif"/></p>
         </details>
	 <details>
         <summary><b>2. 휴면 계정 관리</b></summary>
         <p><img src="sample_data/testcase/관리자/02_휴면 계정 관리.gif"/></p>
         </details>
   <details>
         <summary><b>3. 탈퇴 회원 관리</b></summary>
         <p><img src="sample_data/testcase/관리자/03_탈퇴 회원 관리.gif"/></p>
         </details>
  <details>
         <summary><b>4. 매장 관리</b></summary>
         <p><img src="sample_data/testcase/관리자/04_매장관리.gif"/></p>
         </details>
 <details>
         <summary><b>5. 메뉴에 대한 리뷰 카운트</b></summary>
         <p><img src="sample_data/testcase/관리자/05_메뉴에 대한 리뷰 카운트.gif"/></p>
         </details>        
    </div>
</details>

***


## 5. 프로젝트 수행 체계

### 5.1 팀원 인적사항

| 이름   | 전공                      | 희망직무                    | MBTI | Email                                               |
| ------ | ------------------------- | --------------------------- | ---- | --------------------------------------------------- |
| 전기범 | 소프트웨어학부            | 웹 풀스택 개발자            | INFJ | [kibeom1145@gmail.com](mailto:kibeom1145@gmail.com) |
| 조제훈 | 컴퓨터공학부              | 백엔드 개발자               | ESFJ | [cho9759@inu.ac.kr](mailto:cho9759@inu.ac.kr)       |
| 최해관 | 불교학부/융합소프트웨어   | PM / 백엔드 개발자          | ENTJ | [kkhagwan@naver.com](mailto:kkhagwan@naver.com)     |
| 이효진 | 국어국문학과/컴퓨터공학과 | 데이터 보안 / 백엔드 개발자 | INFJ | jin12lee@naver.com                                  |
| 방동호 | 모바일시스템공학과        | 백엔드 개발자               | INFP | bangdh1593@gmail.com                                |

---

### 5.2 프로젝트 수행 일정



---

### 5.3 프로젝트 수행 방법

![image](https://github.com/beyond09-DBDBDeep/Ureca/assets/105059540/6f2c805a-dbc8-467c-bcf6-f977c26e2d0a)

Ubuntu Linux를 이용하여 DB 서버를 Master-Slave 형태로 Replication하였고,

권한 설정을 통해 Slave는 SELECT만 처리하게 하고, 나머지 쿼리는 Master가 처리하게 하여 서버의 부하를 줄였다.

---
## 6. 팀 회고

---
## 7. 참고 문헌

- <그림 1> : https://www.loud.kr/article/successcase/79001
- <그림 2> : https://www.loud.kr/article/successcase/79001
- <그림 3> : https://www.loud.kr/article/successcase/79001
- https://www.sisajournal.com/news/articleView.html?idxno=250943 **, 2022.11.21**
