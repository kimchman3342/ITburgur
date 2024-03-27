/**
 * 테이블 생성
 * 샘플데이터 추가
 */


-- 테이블 삭제
DROP TABLE BG_BUYS;
DROP TABLE BG_MENU_OPTION;
DROP TABLE BG_MENU;
DROP TABLE BG_USER;

DROP SEQUENCE BG_BUYS_SEQ;
DROP SEQUENCE BG_MENU_OPTION_SEQ;
DROP SEQUENCE BG_MENU;



-- 햄버거 메인 테이블
CREATE TABLE BG_MENU(
   menu_code CHAR(7) PRIMARY KEY,	
   menu_name VARCHAR2(50) NOT NULL,
   menu_desc VARCHAR2(500) ,	-- 메뉴 설명
   price NUMBER(7) NOT NULL,
   create_dttm TIMESTAMP,		-- 생성일시
   img_name VARCHAR2(100)		-- 이미지파일명
);

ALTER SESSION SET nls_timestamp_format='YYYY-MM-DD HH24:MI:SS';
-- 샘플 데이터 생성
INSERT INTO BG_MENU
VALUES ('BGS1234', '치폴레 핫 치킨', 'Chipotle Hot Chicken', 5000, '2022-06-08 15:40:49', '1.png');

INSERT INTO BG_MENU
VALUES ('BGS0001', '비스크 치즈 새우', 'Bisque Cheese Shrimp', 6000, '2023-06-08 15:40:49', '2.png');

SELECT  * FROM BG_MENU;


-- 햄버거 옵션 테이블
CREATE TABLE BG_MENU_OPTION(
   option_seq NUMBER(8) PRIMARY KEY,
   option_name VARCHAR2(100) NOT NULL,
   option_price NUMBER(7) NOT NULL,
   option_desc VARCHAR2(500) ,	-- 메누 옵션 설명
   create_dttm TIMESTAMP NOT NULL,	-- 생성일시
   menu_code CHAR(7) NOT NULL,
   FOREIGN KEY (menu_code)				
			REFERENCES BG_MENU(menu_code)
);
-- 시퀀스 생성
CREATE SEQUENCE BG_MENU_OPTION_SEQ;

-- 샘플 데이터 생성
INSERT INTO BG_MENU_OPTION
VALUES (BG_MENU_OPTION_SEQ.nextval, '콜라', 2000, '(펩시콜라)', '2022-06-08 15:40:49', 'BGS1234');
INSERT INTO BG_MENU_OPTION
VALUES (BG_MENU_OPTION_SEQ.nextval, '한라봉패션후르츠에이드', 2500, '싱그러운 제주 청귤과 상큼한 라임의 만남', '2022-06-08 15:40:49', 'BGS1234');

INSERT INTO BG_MENU_OPTION
VALUES (BG_MENU_OPTION_SEQ.nextval, '청귤라임에이드', 2500, '싱그러운 제주 청귤과 상큼한 라임의 만남', '2023-06-08 15:40:49', 'BGS0001');

INSERT INTO BG_MENU_OPTION
VALUES (BG_MENU_OPTION_SEQ.nextval, '한라봉패션후르츠에이드', 2500, '제주 한라봉과 패션후르츠로 상큼하고 달콤한 에이드', '2023-06-08 15:40:49', 'BGS0001');

SELECT  * FROM BG_MENU_OPTION;

-- DELETE FROM BG_MENU_OPTION WHERE OPTION_seq = 9;

-- 유저 테이블
CREATE TABLE BG_USER(
   user_id VARCHAR2(50) PRIMARY KEY,
   user_password VARCHAR2(500) NOT NULL,
   user_name VARCHAR2(100),
   create_dttm TIMESTAMP
);

INSERT INTO BG_USER
VALUES ('admin', '0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c', '관리자', '2024-03-11 15:40:49');
INSERT INTO BG_USER
VALUES ('test01', '0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c', '테스트계정', '2024-03-11 15:40:49');

SELECT  * FROM BG_USER;

-- 햄버거 구매관리 테이블
CREATE TABLE BG_BUYS(
   buy_seq NUMBER(8) PRIMARY KEY,
   menu_code CHAR(7) NOT NULL,			-- 메뉴코드 ex) BGS1234
   order_id VARCHAR2(500) NOT NULL,		-- 매뉴코드7자리_주문일시 ex) BGS1234_20240312111321 
   detail_option_seq VARCHAR2(1000), 	-- 구매한 메뉴옵션 pk , 콤마로 연결 ex)7,8
   detail_option_desc VARCHAR2(1000), 	-- 구매한 메뉴옵션 설명 ex)한라봉패션후르츠에이드 `수량`개,콜라 `수량`개
   amount 	NUMBER(8) NOT NULL,			-- 총 결제금액 = 메뉴가격 + 메뉴옵션가격합계 ex ) 5000+ (2500*1 + 2000*2)
   user_id	VARCHAR2(50)  NOT NULL,		-- 구매자 아이디
   pay_type VARCHAR2(100) NOT NULL, 	-- 결제수단	
   payment_key VARCHAR2(500) NOT NULL, 	
   create_dttm  TIMESTAMP NOT NULL,
   FOREIGN KEY (menu_code)				
			REFERENCES BG_MENU(menu_code),
   FOREIGN KEY (user_id)				
			REFERENCES BG_USER(user_id)				
);
-- 시퀀스 생성
CREATE SEQUENCE BG_BUYS_SEQ;

-- 샘플데이터
INSERT INTO BG_BUYS
VALUES (BG_BUYS_SEQ.nextval, 'BGS1234', 'BGS1234_20240312111321', '7,8', '한라봉패션후르츠에이드 1개,콜라 2개', 11000, 'test01', '신용 카드', 'ex78adg7799', '2024-03-12 14:40:49');

INSERT INTO BG_BUYS
VALUES (BG_BUYS_SEQ.nextval, 'BGS1234', 'BGS1234_20240312111459', '7', '한라봉패션후르츠에이드 1개', 7500, 'test01', '신용 카드', 'ex11adg3355', '2024-03-12 10:41:49');




-------------------------------------------------------------------






CREATE TABLE BG_NOTICE(
   idx char(7) NOT NULL,
   notice_title varchar2(30) NOT NULL,
   notice_content varchar2(3000) NOT NULL,
   read_count TIMESTAMP,
   notice_date varchar2(200),
   notice_image varchar2(200)
);

