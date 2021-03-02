ALTER TABLE member
	DROP
		CONSTRAINT member_del_yn_c
		CASCADE;

ALTER TABLE member
	DROP
		CONSTRAINT member_mtype_c
		CASCADE;

ALTER TABLE member
	DROP
		CONSTRAINT member_gender_c
		CASCADE;

ALTER TABLE product
	DROP
		CONSTRAINT product_pack_type_c
		CASCADE;

ALTER TABLE product
	DROP
		CONSTRAINT product_dis_yn_c
		CASCADE;

ALTER TABLE product
	DROP
		CONSTRAINT product_earn_yn_c
		CASCADE;

ALTER TABLE product
	DROP
		CONSTRAINT product_sel_yn_c
		CASCADE;

ALTER TABLE product
	DROP
		CONSTRAINT product_only_yn_c
		CASCADE;

ALTER TABLE product
	DROP
		CONSTRAINT product_od_yn_c
		CASCADE;

ALTER TABLE category
	DROP
		CONSTRAINT category_type_c
		CASCADE;

ALTER TABLE orders
	DROP
		CONSTRAINT orders_type_c
		CASCADE;

ALTER TABLE delivery
	DROP
		CONSTRAINT delivery_default_yn_c
		CASCADE;

ALTER TABLE delivery
	DROP
		CONSTRAINT delivery_type_c
		CASCADE;

ALTER TABLE coupon
	DROP
		CONSTRAINT coupon_dis_type_c
		CASCADE;

ALTER TABLE notice
	DROP
		CONSTRAINT notice_type_c
		CASCADE;

ALTER TABLE bulk_order
	DROP
		CONSTRAINT bulk_order_type_c
		CASCADE;

ALTER TABLE payment
	DROP
		CONSTRAINT payment_type_c
		CASCADE;

ALTER TABLE popup
	DROP
		CONSTRAINT popup_type_c
		CASCADE;

ALTER TABLE order_list
	DROP
		CONSTRAINT order_list_type_c
		CASCADE;

ALTER TABLE question
	DROP
		CONSTRAINT question_type_c
		CASCADE;

ALTER TABLE member
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE product
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE category
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE orders
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE basket
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE grade
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE delivery
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE coupon
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE saving
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE alarm
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE notice
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE qna
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE bulk_order
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE proposition
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE eco
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE living
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE review
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE product_info
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE product_option
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE event
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE payment
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE popup
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE recipe
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE latest
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE product_qna
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE my_coupon
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE saving_list
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE order_list
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE recommend
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE question
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

ALTER TABLE files
	DROP
		PRIMARY KEY
		CASCADE
		KEEP INDEX;

DROP INDEX member_mno_i;

DROP INDEX product_pno_i;

DROP INDEX category_ctno_i;

DROP INDEX orders_ono_i;

DROP INDEX basket_bno_p;

DROP INDEX grade_gno_i;

DROP INDEX delivery_dno_i;

DROP INDEX coupon_cno_i;

DROP INDEX saving_svno_i;

DROP INDEX alarm_ano_i;

DROP INDEX notice_nno_i;

DROP INDEX qna_qnno_i;

DROP INDEX bulk_order_bono_i;

DROP INDEX proposition_ppno_i;

DROP INDEX eco_epno_i;

DROP INDEX living_lno_i;

DROP INDEX review_rvno_i;

DROP INDEX product_info_pino_i;

DROP INDEX product_option_pono_i;

DROP INDEX event_eno_i;

DROP INDEX payment_pmno_i;

DROP INDEX popup_puno_i;

DROP INDEX recipe_rno_i;

DROP INDEX latest_ltno_i;

DROP INDEX product_qna_pqno_i;

DROP INDEX my_coupon_mcno_i;

DROP INDEX saving_list_svlno_i;

DROP INDEX order_list_olno_i;

DROP INDEX recommend_rcno_i;

DROP INDEX question_qno_i;

DROP INDEX files_fno_i;

/* 회원 (이승준) */
DROP TABLE member 
	CASCADE CONSTRAINTS;

/* 상품(이승준) */
DROP TABLE product 
	CASCADE CONSTRAINTS;

/* 카테고리(이승준) */
DROP TABLE category 
	CASCADE CONSTRAINTS;

/* 주문(헨리) */
DROP TABLE orders 
	CASCADE CONSTRAINTS;

/* 장바구니(정지원) */
DROP TABLE basket 
	CASCADE CONSTRAINTS;

/* 등급(이승준) */
DROP TABLE grade 
	CASCADE CONSTRAINTS;

/* 배송지(강민규) */
DROP TABLE delivery 
	CASCADE CONSTRAINTS;

/* 쿠폰(박용순) */
DROP TABLE coupon 
	CASCADE CONSTRAINTS;

/* 적립금(박용순) */
DROP TABLE saving 
	CASCADE CONSTRAINTS;

/* 재입고알림(강민규) */
DROP TABLE alarm 
	CASCADE CONSTRAINTS;

/* 공지사항(강민규) */
DROP TABLE notice 
	CASCADE CONSTRAINTS;

/* 1:1문의(강민규) */
DROP TABLE qna 
	CASCADE CONSTRAINTS;

/* 대량주문문의(김희수) */
DROP TABLE bulk_order 
	CASCADE CONSTRAINTS;

/* 상품제안(김희수) */
DROP TABLE proposition 
	CASCADE CONSTRAINTS;

/* 에코포장피드백(김희수) */
DROP TABLE eco 
	CASCADE CONSTRAINTS;

/* 늘사는것(정지원) */
DROP TABLE living 
	CASCADE CONSTRAINTS;

/* 상품후기(이승준) */
DROP TABLE review 
	CASCADE CONSTRAINTS;

/* 상품설명(이승준) */
DROP TABLE product_info 
	CASCADE CONSTRAINTS;

/* 상품옵션(이승준) */
DROP TABLE product_option 
	CASCADE CONSTRAINTS;

/* 이벤트(진우람) */
DROP TABLE event 
	CASCADE CONSTRAINTS;

/* 결제(헨리) */
DROP TABLE payment 
	CASCADE CONSTRAINTS;

/* 팝업(진우람) */
DROP TABLE popup 
	CASCADE CONSTRAINTS;

/* 레시피(진우람) */
DROP TABLE recipe 
	CASCADE CONSTRAINTS;

/* 최근본상품(정지원) */
DROP TABLE latest 
	CASCADE CONSTRAINTS;

/* 상품문의(이승준) */
DROP TABLE product_qna 
	CASCADE CONSTRAINTS;

/* 내쿠폰(박용순) */
DROP TABLE my_coupon 
	CASCADE CONSTRAINTS;

/* 적립금내역(박용순) */
DROP TABLE saving_list 
	CASCADE CONSTRAINTS;

/* 주문목록(헨리) */
DROP TABLE order_list 
	CASCADE CONSTRAINTS;

/* 추천(이승준) */
DROP TABLE recommend 
	CASCADE CONSTRAINTS;

/* 자주하는질문(강민규) */
DROP TABLE question 
	CASCADE CONSTRAINTS;

/* 파일(이승준) */
DROP TABLE files 
	CASCADE CONSTRAINTS;

/* 장바구니 */
DROP SEQUENCE s_basket;

/* 최근본상품 */
DROP SEQUENCE s_latest;

/* 늘사즌것 */
DROP SEQUENCE s_living;

/* 쿠폰 */
DROP SEQUENCE s_coupon;

/* 추천 */
DROP SEQUENCE s_recommend;

/* 적립금 */
DROP SEQUENCE s_saving;

/* 적립금내역 */
DROP SEQUENCE s_saving_list;

/* 내쿠폰 */
DROP SEQUENCE s_my_coupon;

/* 재입고알림 */
DROP SEQUENCE s_alarm;

/* 배송지 */
DROP SEQUENCE s_delivery;

/* 등급 */
DROP SEQUENCE s_grade;

/* 회원 */
DROP SEQUENCE s_member;

/* 상품설명 */
DROP SEQUENCE s_product_info;

/* 상품 */
DROP SEQUENCE s_product;

/* 상품옵션 */
DROP SEQUENCE s_product_option;

/* 상품문의 */
DROP SEQUENCE s_product_qna;

/* 결제 */
DROP SEQUENCE s_payment;

/* 주문 */
DROP SEQUENCE s_orders;

/* 주문목록 */
DROP SEQUENCE s_order_list;

/* 파일 */
DROP SEQUENCE s_files;

/* 레시피 */
DROP SEQUENCE s_recipe;

/* 공지사항 */
DROP SEQUENCE s_norice;

/* 자주하는질문 */
DROP SEQUENCE s_question;

/* 1:1문의 */
DROP SEQUENCE s_qna;

/* 팝업 */
DROP SEQUENCE s_popup;

/* 이벤트 */
DROP SEQUENCE s_event;

/* 대량주문문의 */
DROP SEQUENCE s_bulk_order;

/* 상품제안 */
DROP SEQUENCE s_proposition;

/* 에코포장피드백 */
DROP SEQUENCE s_eco;

/* 카테고리 */
DROP SEQUENCE s_category;

/* 상품후기 */
DROP SEQUENCE s_review;

/* 장바구니 */
CREATE SEQUENCE s_basket;

/* 최근본상품 */
CREATE SEQUENCE s_latest;

/* 늘사즌것 */
CREATE SEQUENCE s_living;

/* 쿠폰 */
CREATE SEQUENCE s_coupon;

/* 추천 */
CREATE SEQUENCE s_recommend;

/* 적립금 */
CREATE SEQUENCE s_saving;

/* 적립금내역 */
CREATE SEQUENCE s_saving_list;

/* 내쿠폰 */
CREATE SEQUENCE s_my_coupon;

/* 재입고알림 */
CREATE SEQUENCE s_alarm;

/* 배송지 */
CREATE SEQUENCE s_delivery;

/* 등급 */
CREATE SEQUENCE s_grade;

/* 회원 */
CREATE SEQUENCE s_member;

/* 상품설명 */
CREATE SEQUENCE s_product_info;

/* 상품 */
CREATE SEQUENCE s_product;

/* 상품옵션 */
CREATE SEQUENCE s_product_option;

/* 상품문의 */
CREATE SEQUENCE s_product_qna;

/* 결제 */
CREATE SEQUENCE s_payment;

/* 주문 */
CREATE SEQUENCE s_orders;

/* 주문목록 */
CREATE SEQUENCE s_order_list;

/* 파일 */
CREATE SEQUENCE s_files;

/* 레시피 */
CREATE SEQUENCE s_recipe;

/* 공지사항 */
CREATE SEQUENCE s_norice;

/* 자주하는질문 */
CREATE SEQUENCE s_question;

/* 1:1문의 */
CREATE SEQUENCE s_qna;

/* 팝업 */
CREATE SEQUENCE s_popup;

/* 이벤트 */
CREATE SEQUENCE s_event;

/* 대량주문문의 */
CREATE SEQUENCE s_bulk_order;

/* 상품제안 */
CREATE SEQUENCE s_proposition;

/* 에코포장피드백 */
CREATE SEQUENCE s_eco;

/* 카테고리 */
CREATE SEQUENCE s_category;

/* 상품후기 */
CREATE SEQUENCE s_review;

/* 회원 (이승준) */
CREATE TABLE member (
	mno NUMBER NOT NULL, /* 회원번호 */
	gno NUMBER NOT NULL, /* 등급번호 */
	id VARCHAR2(50) NOT NULL, /* 아이디 */
	pw CHAR(128) NOT NULL, /* 비밀번호 */
	name VARCHAR2(30) NOT NULL, /* 이름 */
	phone VARCHAR2(20) NOT NULL, /* 연락처 */
	birth VARCHAR2(20) NOT NULL, /* 생일 */
	gender CHAR(1) DEFAULT 'm' NOT NULL, /* 성별 */
	zipcode VARCHAR2(20) NOT NULL, /* 우편번호 */
	addr VARCHAR2(300) NOT NULL, /* 주소 */
	addr_detail VARCHAR2(300) NOT NULL, /* 상세주소 */
	email VARCHAR2(30) NOT NULL, /* 이메일 */
	mtype CHAR(1) DEFAULT 'n' NOT NULL, /* 회원구분 */
	del_yn CHAR(1) DEFAULT 'y' NOT NULL, /* 탈퇴여부 */
	writedate DATE DEFAULT sysdate NOT NULL /* 가입일 */
);

COMMENT ON TABLE member IS '회원 (이승준)';

COMMENT ON COLUMN member.mno IS '회원번호';

COMMENT ON COLUMN member.gno IS '등급번호';

COMMENT ON COLUMN member.id IS '아이디';

COMMENT ON COLUMN member.pw IS '비밀번호';

COMMENT ON COLUMN member.name IS '이름';

COMMENT ON COLUMN member.phone IS '연락처';

COMMENT ON COLUMN member.birth IS '생일';

COMMENT ON COLUMN member.gender IS '성별';

COMMENT ON COLUMN member.zipcode IS '우편번호';

COMMENT ON COLUMN member.addr IS '주소';

COMMENT ON COLUMN member.addr_detail IS '상세주소';

COMMENT ON COLUMN member.email IS '이메일';

COMMENT ON COLUMN member.mtype IS '회원구분';

COMMENT ON COLUMN member.del_yn IS '탈퇴여부';

COMMENT ON COLUMN member.writedate IS '가입일';

CREATE UNIQUE INDEX member_mno_i
	ON member (
		mno ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT member_mno_p
		PRIMARY KEY (
			mno
		);

ALTER TABLE member
	ADD
		CONSTRAINT member_del_yn_c
		CHECK (del_yn in ('y','n'));

ALTER TABLE member
	ADD
		CONSTRAINT member_mtype_c
		CHECK (del_yn in ('a','n'));

ALTER TABLE member
	ADD
		CONSTRAINT member_gender_c
		CHECK (gender in ('m','f'));

/* 상품(이승준) */
CREATE TABLE product (
	pno NUMBER NOT NULL, /* 상품번호 */
	brand VARCHAR2(300), /* 브랜드명 */
	name VARCHAR2(300) NOT NULL, /* 상품명 */
	subject VARCHAR2(300), /* 부제목 */
	sel_unit VARCHAR2(100) NOT NULL, /* 판매단위 */
	weight VARCHAR2(100) NOT NULL, /* 중량/용량 */
	pack_type CHAR(1) DEFAULT 'd' NOT NULL, /* 포장타입 */
	info VARCHAR2(500), /* 안내사항 */
	price NUMBER NOT NULL, /* 가격 */
	discount NUMBER DEFAULT 0 NOT NULL, /* 할인율 */
	dis_yn CHAR(1) DEFAULT 'n' NOT NULL, /* 할인여부 */
	earn NUMBER DEFAULT 0 NOT NULL, /* 적립율 */
	earn_yn CHAR(1) DEFAULT 'n' NOT NULL, /* 적립여부 */
	ctno NUMBER NOT NULL, /* 카테고리번호(대) */
	ctno1 NUMBER, /* 카테고리번호(중) */
	ctno2 NUMBER, /* 카테고리번호(소) */
	only_yn CHAR(1) DEFAULT 'n' NOT NULL, /* 두글만팜 */
	od_yn CHAR(1) DEFAULT 'n' NOT NULL, /* 최저가 */
	fno VARCHAR2(100) NOT NULL, /* 상품이미지 */
	quantity NUMBER DEFAULT 0 NOT NULL, /* 수량 */
	sel_yn CHAR(1) DEFAULT 'y' NOT NULL, /* 판매여부 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE product IS '상품(이승준)';

COMMENT ON COLUMN product.pno IS '상품번호';

COMMENT ON COLUMN product.brand IS '브랜드명';

COMMENT ON COLUMN product.name IS '상품명';

COMMENT ON COLUMN product.subject IS '부제목';

COMMENT ON COLUMN product.sel_unit IS '판매단위';

COMMENT ON COLUMN product.weight IS '중량/용량';

COMMENT ON COLUMN product.pack_type IS '포장타입';

COMMENT ON COLUMN product.info IS '안내사항';

COMMENT ON COLUMN product.price IS '가격';

COMMENT ON COLUMN product.discount IS '할인율';

COMMENT ON COLUMN product.dis_yn IS '할인여부';

COMMENT ON COLUMN product.earn IS '적립율';

COMMENT ON COLUMN product.earn_yn IS '적립여부';

COMMENT ON COLUMN product.ctno IS '카테고리번호(대)';

COMMENT ON COLUMN product.ctno1 IS '카테고리번호(중)';

COMMENT ON COLUMN product.ctno2 IS '카테고리번호(소)';

COMMENT ON COLUMN product.only_yn IS '두글만팜';

COMMENT ON COLUMN product.od_yn IS '최저가';

COMMENT ON COLUMN product.fno IS '상품이미지';

COMMENT ON COLUMN product.quantity IS '수량';

COMMENT ON COLUMN product.sel_yn IS '판매여부';

COMMENT ON COLUMN product.writedate IS '등록일';

CREATE UNIQUE INDEX product_pno_i
	ON product (
		pno ASC
	);

ALTER TABLE product
	ADD
		CONSTRAINT product_pno_p
		PRIMARY KEY (
			pno
		);

ALTER TABLE product
	ADD
		CONSTRAINT product_pack_type_c
		CHECK (pack_type in ('d','r','c','f'));

ALTER TABLE product
	ADD
		CONSTRAINT product_dis_yn_c
		CHECK (dis_yn in ('y','n'));

ALTER TABLE product
	ADD
		CONSTRAINT product_earn_yn_c
		CHECK (earn_yn in ('y','n'));

ALTER TABLE product
	ADD
		CONSTRAINT product_sel_yn_c
		CHECK (sel_yn in ('y','n'));

ALTER TABLE product
	ADD
		CONSTRAINT product_only_yn_c
		CHECK (only_yn in ('y','n'));

ALTER TABLE product
	ADD
		CONSTRAINT product_od_yn_c
		CHECK (od_yn in ('y','n'));

/* 카테고리(이승준) */
CREATE TABLE category (
	ctno NUMBER NOT NULL, /* 카테고리번호 */
	name VARCHAR2(100) NOT NULL, /* 카테고리명 */
	lv NUMBER(1) DEFAULT 0 NOT NULL, /* 카테고리레벨 */
	pctno NUMBER, /* 부모카테고리번호 */
	type CHAR(1) DEFAULT 'p' NOT NULL, /* 카테고리타입 */
	idx NUMBER DEFAULT 1 NOT NULL, /* 순서 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE category IS '카테고리(이승준)';

COMMENT ON COLUMN category.ctno IS '카테고리번호';

COMMENT ON COLUMN category.name IS '카테고리명';

COMMENT ON COLUMN category.lv IS '카테고리레벨';

COMMENT ON COLUMN category.pctno IS '부모카테고리번호';

COMMENT ON COLUMN category.type IS '카테고리타입';

COMMENT ON COLUMN category.idx IS '순서';

COMMENT ON COLUMN category.writedate IS '등록일';

CREATE UNIQUE INDEX category_ctno_i
	ON category (
		ctno ASC
	);

ALTER TABLE category
	ADD
		CONSTRAINT category_ctno_p
		PRIMARY KEY (
			ctno
		);

ALTER TABLE category
	ADD
		CONSTRAINT category_type_c
		CHECK (type in ('p','o','q','t','f','e','c','d'));

/* 주문(헨리) */
CREATE TABLE orders (
	ono NUMBER NOT NULL, /* 주문번호 */
	mno NUMBER NOT NULL, /* 회원번호 */
	type CHAR(1) DEFAULT 'o' NOT NULL, /* 주문상태 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE orders IS '주문(헨리)';

COMMENT ON COLUMN orders.ono IS '주문번호';

COMMENT ON COLUMN orders.mno IS '회원번호';

COMMENT ON COLUMN orders.type IS '주문상태';

COMMENT ON COLUMN orders.writedate IS '등록일';

CREATE UNIQUE INDEX orders_ono_i
	ON orders (
		ono ASC,
		mno ASC
	);

ALTER TABLE orders
	ADD
		CONSTRAINT orders_ono_p
		PRIMARY KEY (
			ono,
			mno
		);

ALTER TABLE orders
	ADD
		CONSTRAINT orders_type_c
		CHECK (type in ('o','s','c','d'));

/* 장바구니(정지원) */
CREATE TABLE basket (
	bno NUMBER NOT NULL, /* 장바구니번호 */
	mno NUMBER NOT NULL, /* 회원번호 */
	pno NUMBER NOT NULL, /* 상품번호 */
	pono NUMBER, /* 상품옵션번호 */
	quantity NUMBER DEFAULT 0 NOT NULL, /* 수량 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE basket IS '장바구니(정지원)';

COMMENT ON COLUMN basket.bno IS '장바구니번호';

COMMENT ON COLUMN basket.mno IS '회원번호';

COMMENT ON COLUMN basket.pno IS '상품번호';

COMMENT ON COLUMN basket.pono IS '상품옵션번호';

COMMENT ON COLUMN basket.quantity IS '수량';

COMMENT ON COLUMN basket.writedate IS '등록일';

CREATE UNIQUE INDEX basket_bno_p
	ON basket (
		bno ASC,
		mno ASC,
		pno ASC
	);

ALTER TABLE basket
	ADD
		CONSTRAINT basket_bno_p
		PRIMARY KEY (
			bno,
			mno,
			pno
		);

/* 등급(이승준) */
CREATE TABLE grade (
	gno NUMBER NOT NULL, /* 등급번호 */
	name VARCHAR2(200) NOT NULL, /* 등급명 */
	case VARCHAR2(500) NOT NULL, /* 등급조건 */
	earn NUMBER DEFAULT 0 NOT NULL, /* 적립율 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE grade IS '등급(이승준)';

COMMENT ON COLUMN grade.gno IS '등급번호';

COMMENT ON COLUMN grade.name IS '등급명';

COMMENT ON COLUMN grade.case IS '등급조건';

COMMENT ON COLUMN grade.earn IS '적립율';

COMMENT ON COLUMN grade.writedate IS '등록일';

CREATE UNIQUE INDEX grade_gno_i
	ON grade (
		gno ASC
	);

ALTER TABLE grade
	ADD
		CONSTRAINT grade_gno_p
		PRIMARY KEY (
			gno
		);

/* 배송지(강민규) */
CREATE TABLE delivery (
	dno NUMBER NOT NULL, /* 배송지번호 */
	mno NUMBER NOT NULL, /* 회원번호 */
	addr VARCHAR2(300) NOT NULL, /* 주소 */
	addr_detail VARCHAR2(300) NOT NULL, /* 상세주소 */
	receive_name VARCHAR2(100) NOT NULL, /* 받으시는분 */
	phone VARCHAR2(20) NOT NULL, /* 핸드폰 */
	type CHAR(1) DEFAULT 't' NOT NULL, /* 배송유형 */
	default_yn CHAR(1) DEFAULT 'y' NOT NULL, /* 기본배송지 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE delivery IS '배송지(강민규)';

COMMENT ON COLUMN delivery.dno IS '배송지번호';

COMMENT ON COLUMN delivery.mno IS '회원번호';

COMMENT ON COLUMN delivery.addr IS '주소';

COMMENT ON COLUMN delivery.addr_detail IS '상세주소';

COMMENT ON COLUMN delivery.receive_name IS '받으시는분';

COMMENT ON COLUMN delivery.phone IS '핸드폰';

COMMENT ON COLUMN delivery.type IS '배송유형';

COMMENT ON COLUMN delivery.default_yn IS '기본배송지';

COMMENT ON COLUMN delivery.writedate IS '등록일';

CREATE UNIQUE INDEX delivery_dno_i
	ON delivery (
		dno ASC,
		mno ASC
	);

ALTER TABLE delivery
	ADD
		CONSTRAINT delivery_dno_p
		PRIMARY KEY (
			dno,
			mno
		);

ALTER TABLE delivery
	ADD
		CONSTRAINT delivery_default_yn_c
		CHECK (default_yn in ('y','n'));

ALTER TABLE delivery
	ADD
		CONSTRAINT delivery_type_c
		CHECK (type in ('t','s'));

/* 쿠폰(박용순) */
CREATE TABLE coupon (
	cno NUMBER NOT NULL, /* 쿠폰번호 */
	pno VARCHAR2(100), /* 상품번호 */
	content CLOB NOT NULL, /* 쿠폰내용 */
	discount NUMBER DEFAULT 0 NOT NULL, /* 할인율 */
	dis_price NUMBER DEFAULT 0 NOT NULL, /* 할인금액 */
	dis_type CHAR(1) DEFAULT 'd' NOT NULL, /* 할인구분 */
	srat_expiry DATE DEFAULT sysdate NOT NULL, /* 유효기간(시작일) */
	end_expiry DATE DEFAULT sysdate NOT NULL, /* 유효기간(만료일) */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE coupon IS '쿠폰(박용순)';

COMMENT ON COLUMN coupon.cno IS '쿠폰번호';

COMMENT ON COLUMN coupon.pno IS '상품번호';

COMMENT ON COLUMN coupon.content IS '쿠폰내용';

COMMENT ON COLUMN coupon.discount IS '할인율';

COMMENT ON COLUMN coupon.dis_price IS '할인금액';

COMMENT ON COLUMN coupon.dis_type IS '할인구분';

COMMENT ON COLUMN coupon.srat_expiry IS '유효기간(시작일)';

COMMENT ON COLUMN coupon.end_expiry IS '유효기간(만료일)';

COMMENT ON COLUMN coupon.writedate IS '등록일';

CREATE UNIQUE INDEX coupon_cno_i
	ON coupon (
		cno ASC
	);

ALTER TABLE coupon
	ADD
		CONSTRAINT coupon_cno_p
		PRIMARY KEY (
			cno
		);

ALTER TABLE coupon
	ADD
		CONSTRAINT coupon_dis_type_c
		CHECK (dis_type in ('d','p','a'));

/* 적립금(박용순) */
CREATE TABLE saving (
	svno NUMBER NOT NULL, /* 적립금번호 */
	mno NUMBER NOT NULL, /* 회원번호 */
	credit NUMBER DEFAULT 0 NOT NULL, /* 적립금 */
	exp_credit NUMBER DEFAULT 0 NOT NULL, /* 소멸예정적립금 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE saving IS '적립금(박용순)';

COMMENT ON COLUMN saving.svno IS '적립금번호';

COMMENT ON COLUMN saving.mno IS '회원번호';

COMMENT ON COLUMN saving.credit IS '적립금';

COMMENT ON COLUMN saving.exp_credit IS '소멸예정적립금';

COMMENT ON COLUMN saving.writedate IS '등록일';

CREATE UNIQUE INDEX saving_svno_i
	ON saving (
		svno ASC,
		mno ASC
	);

ALTER TABLE saving
	ADD
		CONSTRAINT saving_svno_p
		PRIMARY KEY (
			svno,
			mno
		);

/* 재입고알림(강민규) */
CREATE TABLE alarm (
	ano NUMBER NOT NULL, /* 재입고번호 */
	mno NUMBER NOT NULL, /* 회원번호 */
	pno NUMBER NOT NULL, /* 상품번호 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE alarm IS '재입고알림(강민규)';

COMMENT ON COLUMN alarm.ano IS '재입고번호';

COMMENT ON COLUMN alarm.mno IS '회원번호';

COMMENT ON COLUMN alarm.pno IS '상품번호';

COMMENT ON COLUMN alarm.writedate IS '등록일';

CREATE UNIQUE INDEX alarm_ano_i
	ON alarm (
		ano ASC,
		mno ASC,
		pno ASC
	);

ALTER TABLE alarm
	ADD
		CONSTRAINT alarm_ano_p
		PRIMARY KEY (
			ano,
			mno,
			pno
		);

/* 공지사항(강민규) */
CREATE TABLE notice (
	nno NUMBER NOT NULL, /* 공지사항번호 */
	title VARCHAR2(500) NOT NULL, /* 제목 */
	content CLOB NOT NULL, /* 내용 */
	name VARCHAR2(30) DEFAULT '관리자' NOT NULL, /* 작성자 */
	read_cnt NUMBER DEFAULT 0 NOT NULL, /* 조회수 */
	type CHAR(1) DEFAULT 'y' NOT NULL, /* 노출여부 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE notice IS '공지사항(강민규)';

COMMENT ON COLUMN notice.nno IS '공지사항번호';

COMMENT ON COLUMN notice.title IS '제목';

COMMENT ON COLUMN notice.content IS '내용';

COMMENT ON COLUMN notice.name IS '작성자';

COMMENT ON COLUMN notice.read_cnt IS '조회수';

COMMENT ON COLUMN notice.type IS '노출여부';

COMMENT ON COLUMN notice.writedate IS '등록일';

CREATE UNIQUE INDEX notice_nno_i
	ON notice (
		nno ASC
	);

ALTER TABLE notice
	ADD
		CONSTRAINT notice_nno_p
		PRIMARY KEY (
			nno
		);

ALTER TABLE notice
	ADD
		CONSTRAINT notice_type_c
		CHECK (type in ('y','n'));

/* 1:1문의(강민규) */
CREATE TABLE qna (
	qnno NUMBER NOT NULL, /* 문의번호 */
	mno NUMBER NOT NULL, /* 회원번호 */
	ono NUMBER NOT NULL, /* 주문번호 */
	title VARCHAR2(500) NOT NULL, /* 제목 */
	content CLOB NOT NULL, /* 내용 */
	ctno NUMBER NOT NULL, /* 카테고리번호 */
	name VARCHAR2(30) NOT NULL, /* 작성자 */
	email VARCHAR2(50), /* 이메일 */
	email_yn CHAR(1) DEFAULT 'n' NOT NULL, /* 이메일수신여부 */
	phone VARCHAR2(30), /* 핸드폰번호 */
	phone_yn CHAR(1) DEFAULT 'n' NOT NULL, /* 문자수신여부 */
	fno VARCHAR2(100), /* 파일번호 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE qna IS '1:1문의(강민규)';

COMMENT ON COLUMN qna.qnno IS '문의번호';

COMMENT ON COLUMN qna.mno IS '회원번호';

COMMENT ON COLUMN qna.ono IS '주문번호';

COMMENT ON COLUMN qna.title IS '제목';

COMMENT ON COLUMN qna.content IS '내용';

COMMENT ON COLUMN qna.ctno IS '카테고리번호';

COMMENT ON COLUMN qna.name IS '작성자';

COMMENT ON COLUMN qna.email IS '이메일';

COMMENT ON COLUMN qna.email_yn IS '이메일수신여부';

COMMENT ON COLUMN qna.phone IS '핸드폰번호';

COMMENT ON COLUMN qna.phone_yn IS '문자수신여부';

COMMENT ON COLUMN qna.fno IS '파일번호';

COMMENT ON COLUMN qna.writedate IS '등록일';

CREATE UNIQUE INDEX qna_qnno_i
	ON qna (
		qnno ASC,
		mno ASC,
		ono ASC
	);

ALTER TABLE qna
	ADD
		CONSTRAINT qna_qnno_p
		PRIMARY KEY (
			qnno,
			mno,
			ono
		);

/* 대량주문문의(김희수) */
CREATE TABLE bulk_order (
	bono NUMBER NOT NULL, /* 대량주문번호 */
	name VARCHAR2(30) NOT NULL, /* 신청자이름 */
	phone VARCHAR2(20) NOT NULL, /* 신청자연락처 */
	email VARCHAR2(30), /* 신청자이메일 */
	hopedate DATE DEFAULT sysdate NOT NULL, /* 수령희망일 */
	type CHAR(1) DEFAULT 'o' NOT NULL, /* 수령지구분 */
	question CLOB, /* 문의사항 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE bulk_order IS '대량주문문의(김희수)';

COMMENT ON COLUMN bulk_order.bono IS '대량주문번호';

COMMENT ON COLUMN bulk_order.name IS '신청자이름';

COMMENT ON COLUMN bulk_order.phone IS '신청자연락처';

COMMENT ON COLUMN bulk_order.email IS '신청자이메일';

COMMENT ON COLUMN bulk_order.hopedate IS '수령희망일';

COMMENT ON COLUMN bulk_order.type IS '수령지구분';

COMMENT ON COLUMN bulk_order.question IS '문의사항';

COMMENT ON COLUMN bulk_order.writedate IS '등록일';

CREATE UNIQUE INDEX bulk_order_bono_i
	ON bulk_order (
		bono ASC
	);

ALTER TABLE bulk_order
	ADD
		CONSTRAINT bulk_order_bono_p
		PRIMARY KEY (
			bono
		);

ALTER TABLE bulk_order
	ADD
		CONSTRAINT bulk_order_type_c
		CHECK (type in ('o','m'));

/* 상품제안(김희수) */
CREATE TABLE proposition (
	ppno NUMBER NOT NULL, /* 제안번호 */
	title VARCHAR2(500) NOT NULL, /* 제목 */
	content CLOB NOT NULL, /* 내용 */
	ctno NUMBER NOT NULL, /* 카테고리번호 */
	fno VARCHAR2(100), /* 파일번호 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE proposition IS '상품제안(김희수)';

COMMENT ON COLUMN proposition.ppno IS '제안번호';

COMMENT ON COLUMN proposition.title IS '제목';

COMMENT ON COLUMN proposition.content IS '내용';

COMMENT ON COLUMN proposition.ctno IS '카테고리번호';

COMMENT ON COLUMN proposition.fno IS '파일번호';

COMMENT ON COLUMN proposition.writedate IS '등록일';

CREATE UNIQUE INDEX proposition_ppno_i
	ON proposition (
		ppno ASC
	);

ALTER TABLE proposition
	ADD
		CONSTRAINT proposition_ppno_p
		PRIMARY KEY (
			ppno
		);

/* 에코포장피드백(김희수) */
CREATE TABLE eco (
	epno NUMBER NOT NULL, /* 피드백번호 */
	title VARCHAR2(500) NOT NULL, /* 제목 */
	content CLOB NOT NULL, /* 내용 */
	ctno NUMBER NOT NULL, /* 카테고리번호 */
	pname VARCHAR2(500) NOT NULL, /* 상품명 */
	fno VARCHAR2(100), /* 파일번호 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE eco IS '에코포장피드백(김희수)';

COMMENT ON COLUMN eco.epno IS '피드백번호';

COMMENT ON COLUMN eco.title IS '제목';

COMMENT ON COLUMN eco.content IS '내용';

COMMENT ON COLUMN eco.ctno IS '카테고리번호';

COMMENT ON COLUMN eco.pname IS '상품명';

COMMENT ON COLUMN eco.fno IS '파일번호';

COMMENT ON COLUMN eco.writedate IS '등록일';

CREATE UNIQUE INDEX eco_epno_i
	ON eco (
		epno ASC
	);

ALTER TABLE eco
	ADD
		CONSTRAINT eco_epno_p
		PRIMARY KEY (
			epno
		);

/* 늘사는것(정지원) */
CREATE TABLE living (
	lno NUMBER NOT NULL, /* 늘사는것번호 */
	mno NUMBER NOT NULL, /* 회원번호 */
	pno NUMBER NOT NULL, /* 상품번호 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE living IS '늘사는것(정지원)';

COMMENT ON COLUMN living.lno IS '늘사는것번호';

COMMENT ON COLUMN living.mno IS '회원번호';

COMMENT ON COLUMN living.pno IS '상품번호';

COMMENT ON COLUMN living.writedate IS '등록일';

CREATE UNIQUE INDEX living_lno_i
	ON living (
		lno ASC,
		mno ASC,
		pno ASC
	);

ALTER TABLE living
	ADD
		CONSTRAINT living_lno_p
		PRIMARY KEY (
			lno,
			mno,
			pno
		);

/* 상품후기(이승준) */
CREATE TABLE review (
	rvno NUMBER NOT NULL, /* 후기번호 */
	mno NUMBER NOT NULL, /* 회원번호 */
	pno NUMBER NOT NULL, /* 상품번호 */
	title VARCHAR2(500) NOT NULL, /* 제목 */
	content CLOB NOT NULL, /* 내용 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE review IS '상품후기(이승준)';

COMMENT ON COLUMN review.rvno IS '후기번호';

COMMENT ON COLUMN review.mno IS '회원번호';

COMMENT ON COLUMN review.pno IS '상품번호';

COMMENT ON COLUMN review.title IS '제목';

COMMENT ON COLUMN review.content IS '내용';

COMMENT ON COLUMN review.writedate IS '등록일';

CREATE UNIQUE INDEX review_rvno_i
	ON review (
		rvno ASC,
		mno ASC,
		pno ASC
	);

ALTER TABLE review
	ADD
		CONSTRAINT review_rvno_p
		PRIMARY KEY (
			rvno,
			mno,
			pno
		);

/* 상품설명(이승준) */
CREATE TABLE product_info (
	pino NUMBER NOT NULL, /* 설명번호 */
	pno NUMBER NOT NULL, /* 상품번호 */
	description CLOB NOT NULL, /* 상세설명 */
	info CLOB NOT NULL, /* 상세정보 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE product_info IS '상품설명(이승준)';

COMMENT ON COLUMN product_info.pino IS '설명번호';

COMMENT ON COLUMN product_info.pno IS '상품번호';

COMMENT ON COLUMN product_info.description IS '상세설명';

COMMENT ON COLUMN product_info.info IS '상세정보';

COMMENT ON COLUMN product_info.writedate IS '등록일';

CREATE UNIQUE INDEX product_info_pino_i
	ON product_info (
		pino ASC,
		pno ASC
	);

ALTER TABLE product_info
	ADD
		CONSTRAINT product_info_pino_p
		PRIMARY KEY (
			pino,
			pno
		);

/* 상품옵션(이승준) */
CREATE TABLE product_option (
	pono NUMBER NOT NULL, /* 옵션번호 */
	pno NUMBER NOT NULL, /* 상품번호 */
	price NUMBER DEFAULT 0 NOT NULL, /* 가격 */
	name VARCHAR2(300) NOT NULL, /* 옵션명 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE product_option IS '상품옵션(이승준)';

COMMENT ON COLUMN product_option.pono IS '옵션번호';

COMMENT ON COLUMN product_option.pno IS '상품번호';

COMMENT ON COLUMN product_option.price IS '가격';

COMMENT ON COLUMN product_option.name IS '옵션명';

COMMENT ON COLUMN product_option.writedate IS '등록일';

CREATE UNIQUE INDEX product_option_pono_i
	ON product_option (
		pono ASC,
		pno ASC
	);

ALTER TABLE product_option
	ADD
		CONSTRAINT product_option_pono_p
		PRIMARY KEY (
			pono,
			pno
		);

/* 이벤트(진우람) */
CREATE TABLE event (
	eno NUMBER NOT NULL, /* 이벤트번호 */
	fno_main NUMBER NOT NULL, /* 메인이미지 */
	content CLOB, /* 내용 */
	link VARCHAR2(300) NOT NULL, /* 링크 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE event IS '이벤트(진우람)';

COMMENT ON COLUMN event.eno IS '이벤트번호';

COMMENT ON COLUMN event.fno_main IS '메인이미지';

COMMENT ON COLUMN event.content IS '내용';

COMMENT ON COLUMN event.link IS '링크';

COMMENT ON COLUMN event.writedate IS '등록일';

CREATE UNIQUE INDEX event_eno_i
	ON event (
		eno ASC
	);

ALTER TABLE event
	ADD
		CONSTRAINT event_eno_p
		PRIMARY KEY (
			eno
		);

/* 결제(헨리) */
CREATE TABLE payment (
	pmno NUMBER NOT NULL, /* 결제번호 */
	mno NUMBER NOT NULL, /* 회원번호 */
	ono NUMBER NOT NULL, /* 주문번호 */
	type CHAR(1) DEFAULT 'c' NOT NULL, /* 결제방법 */
	payment NUMBER DEFAULT 0 NOT NULL, /* 결제금액 */
	saving NUMBER DEFAULT 0 NOT NULL, /* 적립금결제금액 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE payment IS '결제(헨리)';

COMMENT ON COLUMN payment.pmno IS '결제번호';

COMMENT ON COLUMN payment.mno IS '회원번호';

COMMENT ON COLUMN payment.ono IS '주문번호';

COMMENT ON COLUMN payment.type IS '결제방법';

COMMENT ON COLUMN payment.payment IS '결제금액';

COMMENT ON COLUMN payment.saving IS '적립금결제금액';

COMMENT ON COLUMN payment.writedate IS '등록일';

CREATE UNIQUE INDEX payment_pmno_i
	ON payment (
		pmno ASC,
		mno ASC,
		ono ASC
	);

ALTER TABLE payment
	ADD
		CONSTRAINT payment_pmno_p
		PRIMARY KEY (
			pmno,
			mno,
			ono
		);

ALTER TABLE payment
	ADD
		CONSTRAINT payment_type_c
		CHECK (type in ('c','b','p','m'));

/* 팝업(진우람) */
CREATE TABLE popup (
	puno NUMBER NOT NULL, /* 팝업번호 */
	title VARCHAR2(500) NOT NULL, /* 제목 */
	content CLOB NOT NULL, /* 내용 */
	start_date DATE DEFAULT sysdate NOT NULL, /* 시작일 */
	end_date DATE DEFAULT sysdate NOT NULL, /* 종료일 */
	top NUMBER DEFAULT 0, /* 위 */
	bottom NUMBER, /* 아래 */
	left NUMBER, /* 오른쪽 */
	right NUMBER DEFAULT 0, /* 왼쪽 */
	type CHAR(1) DEFAULT 'y' NOT NULL, /* 활성화여부 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE popup IS '팝업(진우람)';

COMMENT ON COLUMN popup.puno IS '팝업번호';

COMMENT ON COLUMN popup.title IS '제목';

COMMENT ON COLUMN popup.content IS '내용';

COMMENT ON COLUMN popup.start_date IS '시작일';

COMMENT ON COLUMN popup.end_date IS '종료일';

COMMENT ON COLUMN popup.top IS '위';

COMMENT ON COLUMN popup.bottom IS '아래';

COMMENT ON COLUMN popup.left IS '오른쪽';

COMMENT ON COLUMN popup.right IS '왼쪽';

COMMENT ON COLUMN popup.type IS '활성화여부';

COMMENT ON COLUMN popup.writedate IS '등록일';

CREATE UNIQUE INDEX popup_puno_i
	ON popup (
		puno ASC
	);

ALTER TABLE popup
	ADD
		CONSTRAINT popup_puno_p
		PRIMARY KEY (
			puno
		);

ALTER TABLE popup
	ADD
		CONSTRAINT popup_type_c
		CHECK (type in ('y','n'));

/* 레시피(진우람) */
CREATE TABLE recipe (
	rno NUMBER NOT NULL, /* 레시피번호 */
	title VARCHAR2(500) NOT NULL, /* 제목 */
	content CLOB NOT NULL, /* 내용 */
	fno NUMBER NOT NULL, /* 이미지 */
	name VARCHAR2(30) NOT NULL, /* 작성자 */
	read_cnt NUMBER DEFAULT 0 NOT NULL, /* 조회수 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE recipe IS '레시피(진우람)';

COMMENT ON COLUMN recipe.rno IS '레시피번호';

COMMENT ON COLUMN recipe.title IS '제목';

COMMENT ON COLUMN recipe.content IS '내용';

COMMENT ON COLUMN recipe.fno IS '이미지';

COMMENT ON COLUMN recipe.name IS '작성자';

COMMENT ON COLUMN recipe.read_cnt IS '조회수';

COMMENT ON COLUMN recipe.writedate IS '등록일';

CREATE UNIQUE INDEX recipe_rno_i
	ON recipe (
		rno ASC
	);

ALTER TABLE recipe
	ADD
		CONSTRAINT recipe_rno_p
		PRIMARY KEY (
			rno
		);

/* 최근본상품(정지원) */
CREATE TABLE latest (
	ltno NUMBER NOT NULL, /* 최근본상품번호 */
	mno NUMBER NOT NULL, /* 회원번호 */
	pno NUMBER NOT NULL, /* 상품번호 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE latest IS '최근본상품(정지원)';

COMMENT ON COLUMN latest.ltno IS '최근본상품번호';

COMMENT ON COLUMN latest.mno IS '회원번호';

COMMENT ON COLUMN latest.pno IS '상품번호';

COMMENT ON COLUMN latest.writedate IS '등록일';

CREATE UNIQUE INDEX latest_ltno_i
	ON latest (
		ltno ASC,
		mno ASC,
		pno ASC
	);

ALTER TABLE latest
	ADD
		CONSTRAINT latest_ltno_p
		PRIMARY KEY (
			ltno,
			mno,
			pno
		);

/* 상품문의(이승준) */
CREATE TABLE product_qna (
	pqno NUMBER NOT NULL, /* 상품문의번호 */
	pno NUMBER NOT NULL, /* 상품번호 */
	mno NUMBER NOT NULL, /* 회원번호 */
	title VARCHAR2(500) NOT NULL, /* 제목 */
	content CLOB NOT NULL, /* 내용 */
	email_yn CHAR(1) DEFAULT 'n' NOT NULL, /* 이메일답변여부 */
	phone_yn CHAR(1) DEFAULT 'n' NOT NULL, /* 문자답변여부 */
	secret_yn CHAR(1) DEFAULT 'n' NOT NULL, /* 비밀글여부 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE product_qna IS '상품문의(이승준)';

COMMENT ON COLUMN product_qna.pqno IS '상품문의번호';

COMMENT ON COLUMN product_qna.pno IS '상품번호';

COMMENT ON COLUMN product_qna.mno IS '회원번호';

COMMENT ON COLUMN product_qna.title IS '제목';

COMMENT ON COLUMN product_qna.content IS '내용';

COMMENT ON COLUMN product_qna.email_yn IS '이메일답변여부';

COMMENT ON COLUMN product_qna.phone_yn IS '문자답변여부';

COMMENT ON COLUMN product_qna.secret_yn IS '비밀글여부';

COMMENT ON COLUMN product_qna.writedate IS '등록일';

CREATE UNIQUE INDEX product_qna_pqno_i
	ON product_qna (
		pqno ASC,
		pno ASC,
		mno ASC
	);

ALTER TABLE product_qna
	ADD
		CONSTRAINT product_qna_pqno_p
		PRIMARY KEY (
			pqno,
			pno,
			mno
		);

/* 내쿠폰(박용순) */
CREATE TABLE my_coupon (
	mcno NUMBER NOT NULL, /* 내쿠폰번호 */
	cno NUMBER NOT NULL, /* 쿠폰번호 */
	mno NUMBER NOT NULL, /* 회원번호 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE my_coupon IS '내쿠폰(박용순)';

COMMENT ON COLUMN my_coupon.mcno IS '내쿠폰번호';

COMMENT ON COLUMN my_coupon.cno IS '쿠폰번호';

COMMENT ON COLUMN my_coupon.mno IS '회원번호';

COMMENT ON COLUMN my_coupon.writedate IS '등록일';

CREATE UNIQUE INDEX my_coupon_mcno_i
	ON my_coupon (
		mcno ASC,
		cno ASC,
		mno ASC
	);

ALTER TABLE my_coupon
	ADD
		CONSTRAINT my_coupon_mcno_p
		PRIMARY KEY (
			mcno,
			cno,
			mno
		);

/* 적립금내역(박용순) */
CREATE TABLE saving_list (
	svlno NUMBER NOT NULL, /* 적립금내역번호 */
	svno NUMBER NOT NULL, /* 적립금번호 */
	mno NUMBER NOT NULL, /* 회원번호 */
	credit NUMBER DEFAULT 0 NOT NULL, /* 금액 */
	expiry DATE DEFAULT sysdate NOT NULL, /* 유효기간 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE saving_list IS '적립금내역(박용순)';

COMMENT ON COLUMN saving_list.svlno IS '적립금내역번호';

COMMENT ON COLUMN saving_list.svno IS '적립금번호';

COMMENT ON COLUMN saving_list.mno IS '회원번호';

COMMENT ON COLUMN saving_list.credit IS '금액';

COMMENT ON COLUMN saving_list.expiry IS '유효기간';

COMMENT ON COLUMN saving_list.writedate IS '등록일';

CREATE UNIQUE INDEX saving_list_svlno_i
	ON saving_list (
		svlno ASC,
		svno ASC,
		mno ASC
	);

ALTER TABLE saving_list
	ADD
		CONSTRAINT saving_list_svlno_p
		PRIMARY KEY (
			svlno,
			svno,
			mno
		);

/* 주문목록(헨리) */
CREATE TABLE order_list (
	olno NUMBER NOT NULL, /* 주문목록번호 */
	mno NUMBER NOT NULL, /* 회원번호 */
	ono NUMBER NOT NULL, /* 주문번호 */
	pno NUMBER NOT NULL, /* 상품번호 */
	type CHAR(1) DEFAULT 'd' NOT NULL, /* 상태 */
	quantity NUMBER DEFAULT 0 NOT NULL, /* 수량 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE order_list IS '주문목록(헨리)';

COMMENT ON COLUMN order_list.olno IS '주문목록번호';

COMMENT ON COLUMN order_list.mno IS '회원번호';

COMMENT ON COLUMN order_list.ono IS '주문번호';

COMMENT ON COLUMN order_list.pno IS '상품번호';

COMMENT ON COLUMN order_list.type IS '상태';

COMMENT ON COLUMN order_list.quantity IS '수량';

COMMENT ON COLUMN order_list.writedate IS '등록일';

CREATE UNIQUE INDEX order_list_olno_i
	ON order_list (
		olno ASC,
		mno ASC,
		ono ASC
	);

ALTER TABLE order_list
	ADD
		CONSTRAINT order_list_olno_p
		PRIMARY KEY (
			olno,
			mno,
			ono
		);

ALTER TABLE order_list
	ADD
		CONSTRAINT order_list_type_c
		CHECK (type in ('d','c'));

/* 추천(이승준) */
CREATE TABLE recommend (
	rcno NUMBER NOT NULL, /* 추천번호 */
	mno NUMBER NOT NULL, /* 회원번호 */
	id VARCHAR2(50) NOT NULL, /* 회원아이디 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE recommend IS '추천(이승준)';

COMMENT ON COLUMN recommend.rcno IS '추천번호';

COMMENT ON COLUMN recommend.mno IS '회원번호';

COMMENT ON COLUMN recommend.id IS '회원아이디';

COMMENT ON COLUMN recommend.writedate IS '등록일';

CREATE UNIQUE INDEX recommend_rcno_i
	ON recommend (
		rcno ASC
	);

ALTER TABLE recommend
	ADD
		CONSTRAINT recommend_rcno_p
		PRIMARY KEY (
			rcno
		);

/* 자주하는질문(강민규) */
CREATE TABLE question (
	qno NUMBER NOT NULL, /* 자주하는질문번호 */
	title VARCHAR2(500) NOT NULL, /* 제목 */
	content CLOB NOT NULL, /* 내용 */
	ctno NUMBER NOT NULL, /* 카테고리번호 */
	type CHAR(1) DEFAULT 'y' NOT NULL, /* 노출여부 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE question IS '자주하는질문(강민규)';

COMMENT ON COLUMN question.qno IS '자주하는질문번호';

COMMENT ON COLUMN question.title IS '제목';

COMMENT ON COLUMN question.content IS '내용';

COMMENT ON COLUMN question.ctno IS '카테고리번호';

COMMENT ON COLUMN question.type IS '노출여부';

COMMENT ON COLUMN question.writedate IS '등록일';

CREATE UNIQUE INDEX question_qno_i
	ON question (
		qno ASC
	);

ALTER TABLE question
	ADD
		CONSTRAINT question_qno_p
		PRIMARY KEY (
			qno
		);

ALTER TABLE question
	ADD
		CONSTRAINT question_type_c
		CHECK (type in ('y','n'));

/* 파일(이승준) */
CREATE TABLE files (
	fno NUMBER NOT NULL, /* 파일번호 */
	mno NUMBER, /* 회원번호 */
	name VARCHAR2(200) NOT NULL, /* 파일명 */
	real_name VARCHAR2(200) NOT NULL, /* 실제파일명 */
	loc VARCHAR2(500) DEFAULT '/static/upload/img/shop/product/' NOT NULL, /* 경로 */
	ctno NUMBER NOT NULL, /* 카테고리번호 */
	writedate DATE DEFAULT sysdate NOT NULL /* 등록일 */
);

COMMENT ON TABLE files IS '파일(이승준)';

COMMENT ON COLUMN files.fno IS '파일번호';

COMMENT ON COLUMN files.mno IS '회원번호';

COMMENT ON COLUMN files.name IS '파일명';

COMMENT ON COLUMN files.real_name IS '실제파일명';

COMMENT ON COLUMN files.loc IS '경로';

COMMENT ON COLUMN files.ctno IS '카테고리번호';

COMMENT ON COLUMN files.writedate IS '등록일';

CREATE UNIQUE INDEX files_fno_i
	ON files (
		fno ASC
	);

ALTER TABLE files
	ADD
		CONSTRAINT files_fno_p
		PRIMARY KEY (
			fno
		);