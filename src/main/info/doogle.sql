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

ALTER TABLE popup
	DROP
		CONSTRAINT popup_type_c
		CASCADE;

ALTER TABLE saving_list
	DROP
		CONSTRAINT saving_list_type_c
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

ALTER TABLE qna_answer
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

DROP INDEX qna_answer_qano_p;

/* �⺻����� */
DROP TRIGGER t_member_delivery;

/* ������ */
DROP TRIGGER t_member_saving;

/* ������ ��� */
DROP TRIGGER t_order_list_saving_list;

/* ȸ�� (�̽���) */
DROP TABLE member 
	CASCADE CONSTRAINTS;

/* ��ǰ(�̽���) */
DROP TABLE product 
	CASCADE CONSTRAINTS;

/* ī�װ�(�̽���) */
DROP TABLE category 
	CASCADE CONSTRAINTS;

/* �ֹ�(�) */
DROP TABLE orders 
	CASCADE CONSTRAINTS;

/* ��ٱ���(������) */
DROP TABLE basket 
	CASCADE CONSTRAINTS;

/* ���(�̽���) */
DROP TABLE grade 
	CASCADE CONSTRAINTS;

/* �����(���α�) */
DROP TABLE delivery 
	CASCADE CONSTRAINTS;

/* ����(�ڿ��) */
DROP TABLE coupon 
	CASCADE CONSTRAINTS;

/* ������(�ڿ��) */
DROP TABLE saving 
	CASCADE CONSTRAINTS;

/* ���԰�˸�(���α�) */
DROP TABLE alarm 
	CASCADE CONSTRAINTS;

/* ��������(���α�) */
DROP TABLE notice 
	CASCADE CONSTRAINTS;

/* 1:1����(���α�) */
DROP TABLE qna 
	CASCADE CONSTRAINTS;

/* �뷮�ֹ�����(�����) */
DROP TABLE bulk_order 
	CASCADE CONSTRAINTS;

/* ��ǰ����(�����) */
DROP TABLE proposition 
	CASCADE CONSTRAINTS;

/* ���������ǵ��(�����) */
DROP TABLE eco 
	CASCADE CONSTRAINTS;

/* �û�°�(������) */
DROP TABLE living 
	CASCADE CONSTRAINTS;

/* ��ǰ�ı�(�̽���) */
DROP TABLE review 
	CASCADE CONSTRAINTS;

/* ��ǰ����(�̽���) */
DROP TABLE product_info 
	CASCADE CONSTRAINTS;

/* ��ǰ�ɼ�(�̽���) */
DROP TABLE product_option 
	CASCADE CONSTRAINTS;

/* �̺�Ʈ(�����) */
DROP TABLE event 
	CASCADE CONSTRAINTS;

/* ����(�) */
DROP TABLE payment 
	CASCADE CONSTRAINTS;

/* �˾�(�����) */
DROP TABLE popup 
	CASCADE CONSTRAINTS;

/* ������(�����) */
DROP TABLE recipe 
	CASCADE CONSTRAINTS;

/* �ֱٺ���ǰ(������) */
DROP TABLE latest 
	CASCADE CONSTRAINTS;

/* ��ǰ����(�̽���) */
DROP TABLE product_qna 
	CASCADE CONSTRAINTS;

/* ������(�ڿ��) */
DROP TABLE my_coupon 
	CASCADE CONSTRAINTS;

/* �����ݳ���(�ڿ��) */
DROP TABLE saving_list 
	CASCADE CONSTRAINTS;

/* �ֹ����(�) */
DROP TABLE order_list 
	CASCADE CONSTRAINTS;

/* ��õ(�̽���) */
DROP TABLE recommend 
	CASCADE CONSTRAINTS;

/* �����ϴ�����(���α�) */
DROP TABLE question 
	CASCADE CONSTRAINTS;

/* ����(�̽���) */
DROP TABLE files 
	CASCADE CONSTRAINTS;

/* 1:1���Ǵ亯 */
DROP TABLE qna_answer 
	CASCADE CONSTRAINTS;

/* ��ٱ��� */
DROP SEQUENCE s_basket;

/* �ֱٺ���ǰ */
DROP SEQUENCE s_latest;

/* �û���� */
DROP SEQUENCE s_living;

/* ���� */
DROP SEQUENCE s_coupon;

/* ��õ */
DROP SEQUENCE s_recommend;

/* ������ */
DROP SEQUENCE s_saving;

/* �����ݳ��� */
DROP SEQUENCE s_saving_list;

/* ������ */
DROP SEQUENCE s_my_coupon;

/* ���԰�˸� */
DROP SEQUENCE s_alarm;

/* ����� */
DROP SEQUENCE s_delivery;

/* ��� */
DROP SEQUENCE s_grade;

/* ȸ�� */
DROP SEQUENCE s_member;

/* ��ǰ���� */
DROP SEQUENCE s_product_info;

/* ��ǰ */
DROP SEQUENCE s_product;

/* ��ǰ�ɼ� */
DROP SEQUENCE s_product_option;

/* ��ǰ���� */
DROP SEQUENCE s_product_qna;

/* ���� */
DROP SEQUENCE s_payment;

/* �ֹ� */
DROP SEQUENCE s_orders;

/* �ֹ���� */
DROP SEQUENCE s_order_list;

/* ���� */
DROP SEQUENCE s_files;

/* ������ */
DROP SEQUENCE s_recipe;

/* �������� */
DROP SEQUENCE s_notice;

/* �����ϴ����� */
DROP SEQUENCE s_question;

/* 1:1���� */
DROP SEQUENCE s_qna;

/* �˾� */
DROP SEQUENCE s_popup;

/* �̺�Ʈ */
DROP SEQUENCE s_event;

/* �뷮�ֹ����� */
DROP SEQUENCE s_bulk_order;

/* ��ǰ���� */
DROP SEQUENCE s_proposition;

/* ���������ǵ�� */
DROP SEQUENCE s_eco;

/* ī�װ� */
DROP SEQUENCE s_category;

/* ��ǰ�ı� */
DROP SEQUENCE s_review;

/* 1:1���Ǵ亯 */
DROP SEQUENCE s_qna_answer;

/* ��ٱ��� */
CREATE SEQUENCE s_basket;

/* �ֱٺ���ǰ */
CREATE SEQUENCE s_latest;

/* �û���� */
CREATE SEQUENCE s_living;

/* ���� */
CREATE SEQUENCE s_coupon;

/* ��õ */
CREATE SEQUENCE s_recommend;

/* ������ */
CREATE SEQUENCE s_saving;

/* �����ݳ��� */
CREATE SEQUENCE s_saving_list;

/* ������ */
CREATE SEQUENCE s_my_coupon;

/* ���԰�˸� */
CREATE SEQUENCE s_alarm;

/* ����� */
CREATE SEQUENCE s_delivery;

/* ��� */
CREATE SEQUENCE s_grade;

/* ȸ�� */
CREATE SEQUENCE s_member;

/* ��ǰ���� */
CREATE SEQUENCE s_product_info;

/* ��ǰ */
CREATE SEQUENCE s_product;

/* ��ǰ�ɼ� */
CREATE SEQUENCE s_product_option;

/* ��ǰ���� */
CREATE SEQUENCE s_product_qna;

/* ���� */
CREATE SEQUENCE s_payment;

/* �ֹ� */
CREATE SEQUENCE s_orders;

/* �ֹ���� */
CREATE SEQUENCE s_order_list;

/* ���� */
CREATE SEQUENCE s_files;

/* ������ */
CREATE SEQUENCE s_recipe;

/* �������� */
CREATE SEQUENCE s_notice;

/* �����ϴ����� */
CREATE SEQUENCE s_question;

/* 1:1���� */
CREATE SEQUENCE s_qna;

/* �˾� */
CREATE SEQUENCE s_popup;

/* �̺�Ʈ */
CREATE SEQUENCE s_event;

/* �뷮�ֹ����� */
CREATE SEQUENCE s_bulk_order;

/* ��ǰ���� */
CREATE SEQUENCE s_proposition;

/* ���������ǵ�� */
CREATE SEQUENCE s_eco;

/* ī�װ� */
CREATE SEQUENCE s_category;

/* ��ǰ�ı� */
CREATE SEQUENCE s_review;

/* 1:1���Ǵ亯 */
CREATE SEQUENCE s_qna_answer;

/* ȸ�� (�̽���) */
CREATE TABLE member (
	mno NUMBER NOT NULL, /* ȸ����ȣ */
	gno NUMBER DEFAULT 1 NOT NULL, /* ��޹�ȣ */
	id VARCHAR2(50) NOT NULL, /* ���̵� */
	pw CHAR(128) NOT NULL, /* ��й�ȣ */
	name VARCHAR2(30) NOT NULL, /* �̸� */
	phone VARCHAR2(20) NOT NULL, /* ����ó */
	birth VARCHAR2(20) NOT NULL, /* ���� */
	gender CHAR(1) DEFAULT 'm' NOT NULL, /* ���� */
	zipcode VARCHAR2(20) NOT NULL, /* �����ȣ */
	addr VARCHAR2(300) NOT NULL, /* �ּ� */
	addr_detail VARCHAR2(300) NOT NULL, /* ���ּ� */
	email VARCHAR2(30) NOT NULL, /* �̸��� */
	mtype CHAR(1) DEFAULT 'n' NOT NULL, /* ȸ������ */
	del_yn CHAR(1) DEFAULT 'n' NOT NULL, /* Ż�𿩺� */
	writedate DATE DEFAULT sysdate NOT NULL /* ������ */
);

COMMENT ON TABLE member IS 'ȸ�� (�̽���)';

COMMENT ON COLUMN member.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN member.gno IS '��޹�ȣ';

COMMENT ON COLUMN member.id IS '���̵�';

COMMENT ON COLUMN member.pw IS '��й�ȣ';

COMMENT ON COLUMN member.name IS '�̸�';

COMMENT ON COLUMN member.phone IS '����ó';

COMMENT ON COLUMN member.birth IS '����';

COMMENT ON COLUMN member.gender IS '����';

COMMENT ON COLUMN member.zipcode IS '�����ȣ';

COMMENT ON COLUMN member.addr IS '�ּ�';

COMMENT ON COLUMN member.addr_detail IS '���ּ�';

COMMENT ON COLUMN member.email IS '�̸���';

COMMENT ON COLUMN member.mtype IS 'ȸ������';

COMMENT ON COLUMN member.del_yn IS 'Ż�𿩺�';

COMMENT ON COLUMN member.writedate IS '������';

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
		CHECK (mtype in ('a','n'));

ALTER TABLE member
	ADD
		CONSTRAINT member_gender_c
		CHECK (gender in ('m','f'));

/* �⺻����� */
CREATE TRIGGER t_member_delivery
AFTER INSERT ON member
FOR EACH ROW
DECLARE
BEGIN
  IF INSERTING THEN 
    insert into delivery(dno, mno, addr, addr_detail, receive_name, phone) values (s_delivery.nextval, :NEW.mno, :NEW.addr, :NEW.addr_detail, :NEW.name, :NEW.phone);
  END IF;
END;
/

/* ������ */
CREATE TRIGGER t_member_saving
AFTER INSERT ON member
FOR EACH ROW
DECLARE
BEGIN
  IF INSERTING THEN 
    insert into saving(svno, mno) values (s_saving.nextval, :NEW.mno);
  END IF;
END;
/

/* ��ǰ(�̽���) */
CREATE TABLE product (
	pno NUMBER NOT NULL, /* ��ǰ��ȣ */
	brand VARCHAR2(300), /* �귣��� */
	name VARCHAR2(300) NOT NULL, /* ��ǰ�� */
	subject VARCHAR2(300), /* ������ */
	sel_unit VARCHAR2(100) DEFAULT '1��', /* �ǸŴ��� */
	weight VARCHAR2(100) DEFAULT '0g', /* �߷�/�뷮 */
	pack_type CHAR(1) DEFAULT 'd' NOT NULL, /* ����Ÿ�� */
	info VARCHAR2(500), /* �ȳ����� */
	price NUMBER NOT NULL, /* ���� */
	discount NUMBER DEFAULT 0 NOT NULL, /* ������ */
	dis_yn CHAR(1) DEFAULT 'n' NOT NULL, /* ���ο��� */
	earn NUMBER DEFAULT 0 NOT NULL, /* ������ */
	earn_yn CHAR(1) DEFAULT 'n' NOT NULL, /* �������� */
	ctno NUMBER NOT NULL, /* ī�װ���ȣ(��) */
	ctno1 NUMBER, /* ī�װ���ȣ(��) */
	ctno2 NUMBER, /* ī�װ���ȣ(��) */
	only_yn CHAR(1) DEFAULT 'n' NOT NULL, /* �α۸��� */
	od_yn CHAR(1) DEFAULT 'n' NOT NULL, /* ������ */
	fno VARCHAR2(100), /* ��ǰ�̹��� */
	quantity NUMBER DEFAULT 0 NOT NULL, /* ���� */
	sel_yn CHAR(1) DEFAULT 'y' NOT NULL, /* �Ǹſ��� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE product IS '��ǰ(�̽���)';

COMMENT ON COLUMN product.pno IS '��ǰ��ȣ';

COMMENT ON COLUMN product.brand IS '�귣���';

COMMENT ON COLUMN product.name IS '��ǰ��';

COMMENT ON COLUMN product.subject IS '������';

COMMENT ON COLUMN product.sel_unit IS '�ǸŴ���';

COMMENT ON COLUMN product.weight IS '�߷�/�뷮';

COMMENT ON COLUMN product.pack_type IS '����Ÿ��';

COMMENT ON COLUMN product.info IS '�ȳ�����';

COMMENT ON COLUMN product.price IS '����';

COMMENT ON COLUMN product.discount IS '������';

COMMENT ON COLUMN product.dis_yn IS '���ο���';

COMMENT ON COLUMN product.earn IS '������';

COMMENT ON COLUMN product.earn_yn IS '��������';

COMMENT ON COLUMN product.ctno IS 'ī�װ���ȣ(��)';

COMMENT ON COLUMN product.ctno1 IS 'ī�װ���ȣ(��)';

COMMENT ON COLUMN product.ctno2 IS 'ī�װ���ȣ(��)';

COMMENT ON COLUMN product.only_yn IS '�α۸���';

COMMENT ON COLUMN product.od_yn IS '������';

COMMENT ON COLUMN product.fno IS '��ǰ�̹���';

COMMENT ON COLUMN product.quantity IS '����';

COMMENT ON COLUMN product.sel_yn IS '�Ǹſ���';

COMMENT ON COLUMN product.writedate IS '�����';

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

/* ī�װ�(�̽���) */
CREATE TABLE category (
	ctno NUMBER NOT NULL, /* ī�װ���ȣ */
	name VARCHAR2(100) NOT NULL, /* ī�װ��� */
	lv NUMBER(1) DEFAULT 0 NOT NULL, /* ī�װ����� */
	pctno NUMBER, /* �θ�ī�װ���ȣ */
	type CHAR(1) DEFAULT 'p' NOT NULL, /* ī�װ�Ÿ�� */
	idx NUMBER DEFAULT 1 NOT NULL, /* ���� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE category IS 'ī�װ�(�̽���)';

COMMENT ON COLUMN category.ctno IS 'ī�װ���ȣ';

COMMENT ON COLUMN category.name IS 'ī�װ���';

COMMENT ON COLUMN category.lv IS 'ī�װ�����';

COMMENT ON COLUMN category.pctno IS '�θ�ī�װ���ȣ';

COMMENT ON COLUMN category.type IS 'ī�װ�Ÿ��';

COMMENT ON COLUMN category.idx IS '����';

COMMENT ON COLUMN category.writedate IS '�����';

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
		CHECK (type in ('p','o','q','t','f','e','c','d','r'));

/* �ֹ�(�) */
CREATE TABLE orders (
	ono NUMBER NOT NULL, /* �ֹ���ȣ */
	mno NUMBER NOT NULL, /* ȸ����ȣ */
	type CHAR(1) DEFAULT 'o' NOT NULL, /* �ֹ����� */
	product_cnt NUMBER DEFAULT 0 NOT NULL, /* �ѻ�ǰ�� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE orders IS '�ֹ�(�)';

COMMENT ON COLUMN orders.ono IS '�ֹ���ȣ';

COMMENT ON COLUMN orders.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN orders.type IS '�ֹ�����';

COMMENT ON COLUMN orders.product_cnt IS '�ѻ�ǰ��';

COMMENT ON COLUMN orders.writedate IS '�����';

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

/* ��ٱ���(������) */
CREATE TABLE basket (
	bno NUMBER NOT NULL, /* ��ٱ��Ϲ�ȣ */
	mno NUMBER NOT NULL, /* ȸ����ȣ */
	pno NUMBER NOT NULL, /* ��ǰ��ȣ */
	pono NUMBER, /* ��ǰ�ɼǹ�ȣ */
	quantity NUMBER DEFAULT 0 NOT NULL, /* ���� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE basket IS '��ٱ���(������)';

COMMENT ON COLUMN basket.bno IS '��ٱ��Ϲ�ȣ';

COMMENT ON COLUMN basket.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN basket.pno IS '��ǰ��ȣ';

COMMENT ON COLUMN basket.pono IS '��ǰ�ɼǹ�ȣ';

COMMENT ON COLUMN basket.quantity IS '����';

COMMENT ON COLUMN basket.writedate IS '�����';

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

/* ���(�̽���) */
CREATE TABLE grade (
	gno NUMBER NOT NULL, /* ��޹�ȣ */
	name VARCHAR2(200) NOT NULL, /* ��޸� */
	case VARCHAR2(500) NOT NULL, /* ������� */
	earn NUMBER DEFAULT 0 NOT NULL, /* ������ */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE grade IS '���(�̽���)';

COMMENT ON COLUMN grade.gno IS '��޹�ȣ';

COMMENT ON COLUMN grade.name IS '��޸�';

COMMENT ON COLUMN grade.case IS '�������';

COMMENT ON COLUMN grade.earn IS '������';

COMMENT ON COLUMN grade.writedate IS '�����';

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

/* �����(���α�) */
CREATE TABLE delivery (
	dno NUMBER NOT NULL, /* �������ȣ */
	mno NUMBER NOT NULL, /* ȸ����ȣ */
	addr VARCHAR2(300) NOT NULL, /* �ּ� */
	addr_detail VARCHAR2(300) NOT NULL, /* ���ּ� */
	receive_name VARCHAR2(100) NOT NULL, /* �����ôº� */
	phone VARCHAR2(20) NOT NULL, /* �ڵ��� */
	type CHAR(1) DEFAULT 't' NOT NULL, /* ������� */
	default_yn CHAR(1) DEFAULT 'y' NOT NULL, /* �⺻����� */
	pickuptype VARCHAR2(300), /* ������ */
	pickuptype_content VARCHAR2(300), /* ���������� */
	pickuptype_detail VARCHAR2(300), /* ���������γ��� */
	delivery_msg VARCHAR2(300), /* ��ۿϷ�޼��� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE delivery IS '�����(���α�)';

COMMENT ON COLUMN delivery.dno IS '�������ȣ';

COMMENT ON COLUMN delivery.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN delivery.addr IS '�ּ�';

COMMENT ON COLUMN delivery.addr_detail IS '���ּ�';

COMMENT ON COLUMN delivery.receive_name IS '�����ôº�';

COMMENT ON COLUMN delivery.phone IS '�ڵ���';

COMMENT ON COLUMN delivery.type IS '�������';

COMMENT ON COLUMN delivery.default_yn IS '�⺻�����';

COMMENT ON COLUMN delivery.pickuptype IS '������';

COMMENT ON COLUMN delivery.pickuptype_content IS '����������';

COMMENT ON COLUMN delivery.pickuptype_detail IS '���������γ���';

COMMENT ON COLUMN delivery.delivery_msg IS '��ۿϷ�޼���';

COMMENT ON COLUMN delivery.writedate IS '�����';

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

/* ����(�ڿ��) */
CREATE TABLE coupon (
	cno NUMBER NOT NULL, /* ������ȣ */
	pno VARCHAR2(100), /* ��ǰ��ȣ */
	content CLOB NOT NULL, /* �������� */
	discount NUMBER DEFAULT 0 NOT NULL, /* ������ */
	dis_price NUMBER DEFAULT 0 NOT NULL, /* ���αݾ� */
	dis_type CHAR(1) DEFAULT 'd' NOT NULL, /* ���α��� */
	srat_expiry DATE DEFAULT sysdate NOT NULL, /* ��ȿ�Ⱓ(������) */
	end_expiry DATE DEFAULT sysdate NOT NULL, /* ��ȿ�Ⱓ(������) */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE coupon IS '����(�ڿ��)';

COMMENT ON COLUMN coupon.cno IS '������ȣ';

COMMENT ON COLUMN coupon.pno IS '��ǰ��ȣ';

COMMENT ON COLUMN coupon.content IS '��������';

COMMENT ON COLUMN coupon.discount IS '������';

COMMENT ON COLUMN coupon.dis_price IS '���αݾ�';

COMMENT ON COLUMN coupon.dis_type IS '���α���';

COMMENT ON COLUMN coupon.srat_expiry IS '��ȿ�Ⱓ(������)';

COMMENT ON COLUMN coupon.end_expiry IS '��ȿ�Ⱓ(������)';

COMMENT ON COLUMN coupon.writedate IS '�����';

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

/* ������(�ڿ��) */
CREATE TABLE saving (
	svno NUMBER NOT NULL, /* �����ݹ�ȣ */
	mno NUMBER NOT NULL, /* ȸ����ȣ */
	credit NUMBER DEFAULT 0 NOT NULL, /* ������ */
	exp_credit NUMBER DEFAULT 0 NOT NULL, /* �Ҹ꿹�������� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE saving IS '������(�ڿ��)';

COMMENT ON COLUMN saving.svno IS '�����ݹ�ȣ';

COMMENT ON COLUMN saving.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN saving.credit IS '������';

COMMENT ON COLUMN saving.exp_credit IS '�Ҹ꿹��������';

COMMENT ON COLUMN saving.writedate IS '�����';

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

/* ���԰�˸�(���α�) */
CREATE TABLE alarm (
	ano NUMBER NOT NULL, /* ���԰��ȣ */
	mno NUMBER NOT NULL, /* ȸ����ȣ */
	pno NUMBER NOT NULL, /* ��ǰ��ȣ */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE alarm IS '���԰�˸�(���α�)';

COMMENT ON COLUMN alarm.ano IS '���԰��ȣ';

COMMENT ON COLUMN alarm.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN alarm.pno IS '��ǰ��ȣ';

COMMENT ON COLUMN alarm.writedate IS '�����';

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

/* ��������(���α�) */
CREATE TABLE notice (
	nno NUMBER NOT NULL, /* �������׹�ȣ */
	title VARCHAR2(500) NOT NULL, /* ���� */
	content CLOB NOT NULL, /* ���� */
	name VARCHAR2(30) DEFAULT '������' NOT NULL, /* �ۼ��� */
	read_cnt NUMBER DEFAULT 0 NOT NULL, /* ��ȸ�� */
	type CHAR(1) DEFAULT 'y' NOT NULL, /* ���⿩�� */
	state NUMBER DEFAULT 0 NOT NULL, /* ���� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE notice IS '��������(���α�)';

COMMENT ON COLUMN notice.nno IS '�������׹�ȣ';

COMMENT ON COLUMN notice.title IS '����';

COMMENT ON COLUMN notice.content IS '����';

COMMENT ON COLUMN notice.name IS '�ۼ���';

COMMENT ON COLUMN notice.read_cnt IS '��ȸ��';

COMMENT ON COLUMN notice.type IS '���⿩��';

COMMENT ON COLUMN notice.state IS '����';

COMMENT ON COLUMN notice.writedate IS '�����';

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

/* 1:1����(���α�) */
CREATE TABLE qna (
	qnno NUMBER NOT NULL, /* ���ǹ�ȣ */
	mno NUMBER NOT NULL, /* ȸ����ȣ */
	ono NUMBER NOT NULL, /* �ֹ���ȣ */
	title VARCHAR2(500) NOT NULL, /* ���� */
	content CLOB NOT NULL, /* ���� */
	ctno NUMBER NOT NULL, /* ī�װ���ȣ */
	name VARCHAR2(30) NOT NULL, /* �ۼ��� */
	email VARCHAR2(50), /* �̸��� */
	email_yn CHAR(1) DEFAULT 'n' NOT NULL, /* �̸��ϼ��ſ��� */
	phone VARCHAR2(30), /* �ڵ�����ȣ */
	phone_yn CHAR(1) DEFAULT 'n' NOT NULL, /* ���ڼ��ſ��� */
	fno VARCHAR2(100), /* ���Ϲ�ȣ */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE qna IS '1:1����(���α�)';

COMMENT ON COLUMN qna.qnno IS '���ǹ�ȣ';

COMMENT ON COLUMN qna.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN qna.ono IS '�ֹ���ȣ';

COMMENT ON COLUMN qna.title IS '����';

COMMENT ON COLUMN qna.content IS '����';

COMMENT ON COLUMN qna.ctno IS 'ī�װ���ȣ';

COMMENT ON COLUMN qna.name IS '�ۼ���';

COMMENT ON COLUMN qna.email IS '�̸���';

COMMENT ON COLUMN qna.email_yn IS '�̸��ϼ��ſ���';

COMMENT ON COLUMN qna.phone IS '�ڵ�����ȣ';

COMMENT ON COLUMN qna.phone_yn IS '���ڼ��ſ���';

COMMENT ON COLUMN qna.fno IS '���Ϲ�ȣ';

COMMENT ON COLUMN qna.writedate IS '�����';

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

/* �뷮�ֹ�����(�����) */
CREATE TABLE bulk_order (
	bono NUMBER NOT NULL, /* �뷮�ֹ���ȣ */
	name VARCHAR2(30) NOT NULL, /* ��û���̸� */
	phone VARCHAR2(20) NOT NULL, /* ��û�ڿ���ó */
	email VARCHAR2(30), /* ��û���̸��� */
	hopedate DATE DEFAULT sysdate NOT NULL, /* ��������� */
	type CHAR(1) DEFAULT 'o' NOT NULL, /* ���������� */
	question CLOB, /* ���ǻ��� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE bulk_order IS '�뷮�ֹ�����(�����)';

COMMENT ON COLUMN bulk_order.bono IS '�뷮�ֹ���ȣ';

COMMENT ON COLUMN bulk_order.name IS '��û���̸�';

COMMENT ON COLUMN bulk_order.phone IS '��û�ڿ���ó';

COMMENT ON COLUMN bulk_order.email IS '��û���̸���';

COMMENT ON COLUMN bulk_order.hopedate IS '���������';

COMMENT ON COLUMN bulk_order.type IS '����������';

COMMENT ON COLUMN bulk_order.question IS '���ǻ���';

COMMENT ON COLUMN bulk_order.writedate IS '�����';

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

/* ��ǰ����(�����) */
CREATE TABLE proposition (
	ppno NUMBER NOT NULL, /* ���ȹ�ȣ */
	id VARCHAR2(50), /* �ۼ��� */
	title VARCHAR2(500) NOT NULL, /* ���� */
	content CLOB NOT NULL, /* ���� */
	ctno NUMBER NOT NULL, /* ī�װ���ȣ */
	fno VARCHAR2(100), /* ���Ϲ�ȣ */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE proposition IS '��ǰ����(�����)';

COMMENT ON COLUMN proposition.ppno IS '���ȹ�ȣ';

COMMENT ON COLUMN proposition.id IS '�ۼ���';

COMMENT ON COLUMN proposition.title IS '����';

COMMENT ON COLUMN proposition.content IS '����';

COMMENT ON COLUMN proposition.ctno IS 'ī�װ���ȣ';

COMMENT ON COLUMN proposition.fno IS '���Ϲ�ȣ';

COMMENT ON COLUMN proposition.writedate IS '�����';

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

/* ���������ǵ��(�����) */
CREATE TABLE eco (
	epno NUMBER NOT NULL, /* �ǵ���ȣ */
	id VARCHAR2(50), /* �ۼ��� */
	title VARCHAR2(500) NOT NULL, /* ���� */
	content CLOB NOT NULL, /* ���� */
	ctno NUMBER NOT NULL, /* ī�װ���ȣ */
	name VARCHAR2(500) NOT NULL, /* ��ǰ�� */
	fno VARCHAR2(100), /* ���Ϲ�ȣ */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE eco IS '���������ǵ��(�����)';

COMMENT ON COLUMN eco.epno IS '�ǵ���ȣ';

COMMENT ON COLUMN eco.id IS '�ۼ���';

COMMENT ON COLUMN eco.title IS '����';

COMMENT ON COLUMN eco.content IS '����';

COMMENT ON COLUMN eco.ctno IS 'ī�װ���ȣ';

COMMENT ON COLUMN eco.name IS '��ǰ��';

COMMENT ON COLUMN eco.fno IS '���Ϲ�ȣ';

COMMENT ON COLUMN eco.writedate IS '�����';

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

/* �û�°�(������) */
CREATE TABLE living (
	lno NUMBER NOT NULL, /* �û�°͹�ȣ */
	mno NUMBER NOT NULL, /* ȸ����ȣ */
	pno NUMBER NOT NULL, /* ��ǰ��ȣ */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE living IS '�û�°�(������)';

COMMENT ON COLUMN living.lno IS '�û�°͹�ȣ';

COMMENT ON COLUMN living.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN living.pno IS '��ǰ��ȣ';

COMMENT ON COLUMN living.writedate IS '�����';

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

/* ��ǰ�ı�(�̽���) */
CREATE TABLE review (
	rvno NUMBER NOT NULL, /* �ı��ȣ */
	mno NUMBER NOT NULL, /* ȸ����ȣ */
	pno NUMBER NOT NULL, /* ��ǰ��ȣ */
	title VARCHAR2(500) NOT NULL, /* ���� */
	content CLOB NOT NULL, /* ���� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE review IS '��ǰ�ı�(�̽���)';

COMMENT ON COLUMN review.rvno IS '�ı��ȣ';

COMMENT ON COLUMN review.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN review.pno IS '��ǰ��ȣ';

COMMENT ON COLUMN review.title IS '����';

COMMENT ON COLUMN review.content IS '����';

COMMENT ON COLUMN review.writedate IS '�����';

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

/* ��ǰ����(�̽���) */
CREATE TABLE product_info (
	pino NUMBER NOT NULL, /* �����ȣ */
	pno NUMBER NOT NULL, /* ��ǰ��ȣ */
	description CLOB NOT NULL, /* �󼼼��� */
	info CLOB NOT NULL, /* ������ */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE product_info IS '��ǰ����(�̽���)';

COMMENT ON COLUMN product_info.pino IS '�����ȣ';

COMMENT ON COLUMN product_info.pno IS '��ǰ��ȣ';

COMMENT ON COLUMN product_info.description IS '�󼼼���';

COMMENT ON COLUMN product_info.info IS '������';

COMMENT ON COLUMN product_info.writedate IS '�����';

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

/* ��ǰ�ɼ�(�̽���) */
CREATE TABLE product_option (
	pono NUMBER NOT NULL, /* �ɼǹ�ȣ */
	pno NUMBER NOT NULL, /* ��ǰ��ȣ */
	price NUMBER DEFAULT 0 NOT NULL, /* ���� */
	name VARCHAR2(300) NOT NULL, /* �ɼǸ� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE product_option IS '��ǰ�ɼ�(�̽���)';

COMMENT ON COLUMN product_option.pono IS '�ɼǹ�ȣ';

COMMENT ON COLUMN product_option.pno IS '��ǰ��ȣ';

COMMENT ON COLUMN product_option.price IS '����';

COMMENT ON COLUMN product_option.name IS '�ɼǸ�';

COMMENT ON COLUMN product_option.writedate IS '�����';

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

/* �̺�Ʈ(�����) */
CREATE TABLE event (
	eno NUMBER NOT NULL, /* �̺�Ʈ��ȣ */
	fno_main NUMBER NOT NULL, /* �����̹��� */
	content CLOB, /* ���� */
	link VARCHAR2(300) NOT NULL, /* ��ũ */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE event IS '�̺�Ʈ(�����)';

COMMENT ON COLUMN event.eno IS '�̺�Ʈ��ȣ';

COMMENT ON COLUMN event.fno_main IS '�����̹���';

COMMENT ON COLUMN event.content IS '����';

COMMENT ON COLUMN event.link IS '��ũ';

COMMENT ON COLUMN event.writedate IS '�����';

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

/* ����(�) */
CREATE TABLE payment (
	pmno NUMBER NOT NULL, /* ������ȣ */
	mno NUMBER NOT NULL, /* ȸ����ȣ */
	ono NUMBER NOT NULL, /* �ֹ���ȣ */
	type CHAR(1) DEFAULT 'c' NOT NULL, /* ������� */
	payment NUMBER DEFAULT 0 NOT NULL, /* �����ݾ� */
	saving NUMBER DEFAULT 0 NOT NULL, /* �����ݰ����ݾ� */
	delivery_price NUMBER DEFAULT 0, /* ��ۺ� */
	product_dis_price NUMBER DEFAULT 0, /* ��ǰ���αݾ� */
	coupon_dis_price NUMBER DEFAULT 0, /* �������� */
	saving_price NUMBER DEFAULT 0, /* ���������ݾ� */
	product_total_price NUMBER DEFAULT 0, /* ��ǰ�ݾ� */
	card_name VARCHAR2(300), /* ī��� */
	card_month VARCHAR2(300), /* �ҺαⰣ */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE payment IS '����(�)';

COMMENT ON COLUMN payment.pmno IS '������ȣ';

COMMENT ON COLUMN payment.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN payment.ono IS '�ֹ���ȣ';

COMMENT ON COLUMN payment.type IS '�������';

COMMENT ON COLUMN payment.payment IS '�����ݾ�';

COMMENT ON COLUMN payment.saving IS '�����ݰ����ݾ�';

COMMENT ON COLUMN payment.delivery_price IS '��ۺ�';

COMMENT ON COLUMN payment.product_dis_price IS '��ǰ���αݾ�';

COMMENT ON COLUMN payment.coupon_dis_price IS '��������';

COMMENT ON COLUMN payment.saving_price IS '���������ݾ�';

COMMENT ON COLUMN payment.product_total_price IS '��ǰ�ݾ�';

COMMENT ON COLUMN payment.card_name IS 'ī���';

COMMENT ON COLUMN payment.card_month IS '�ҺαⰣ';

COMMENT ON COLUMN payment.writedate IS '�����';

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

/* �˾�(�����) */
CREATE TABLE popup (
	puno NUMBER NOT NULL, /* �˾���ȣ */
	title VARCHAR2(500) NOT NULL, /* ���� */
	content CLOB NOT NULL, /* ���� */
	start_date DATE DEFAULT sysdate NOT NULL, /* ������ */
	end_date DATE DEFAULT sysdate NOT NULL, /* ������ */
	top NUMBER DEFAULT 0, /* �� */
	bottom NUMBER DEFAULT 0, /* �Ʒ� */
	left NUMBER DEFAULT 0, /* ���� */
	right NUMBER DEFAULT 0, /* ������ */
	width VARCHAR2(30) DEFAULT '0', /* �ʺ� */
	height VARCHAR2(30) DEFAULT '0', /* ���� */
	type CHAR(1) DEFAULT 'y' NOT NULL, /* Ȱ��ȭ���� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE popup IS '�˾�(�����)';

COMMENT ON COLUMN popup.puno IS '�˾���ȣ';

COMMENT ON COLUMN popup.title IS '����';

COMMENT ON COLUMN popup.content IS '����';

COMMENT ON COLUMN popup.start_date IS '������';

COMMENT ON COLUMN popup.end_date IS '������';

COMMENT ON COLUMN popup.top IS '��';

COMMENT ON COLUMN popup.bottom IS '�Ʒ�';

COMMENT ON COLUMN popup.left IS '����';

COMMENT ON COLUMN popup.right IS '������';

COMMENT ON COLUMN popup.width IS '�ʺ�';

COMMENT ON COLUMN popup.height IS '����';

COMMENT ON COLUMN popup.type IS 'Ȱ��ȭ����';

COMMENT ON COLUMN popup.writedate IS '�����';

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

/* ������(�����) */
CREATE TABLE recipe (
	rno NUMBER NOT NULL, /* �����ǹ�ȣ */
	title VARCHAR2(500) NOT NULL, /* ���� */
	content CLOB NOT NULL, /* ���� */
	ctno NUMBER NOT NULL, /* ī�װ� */
	fno NUMBER NOT NULL, /* �̹��� */
	name VARCHAR2(30) NOT NULL, /* �ۼ��� */
	read_cnt NUMBER DEFAULT 0 NOT NULL, /* ��ȸ�� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE recipe IS '������(�����)';

COMMENT ON COLUMN recipe.rno IS '�����ǹ�ȣ';

COMMENT ON COLUMN recipe.title IS '����';

COMMENT ON COLUMN recipe.content IS '����';

COMMENT ON COLUMN recipe.ctno IS 'ī�װ�';

COMMENT ON COLUMN recipe.fno IS '�̹���';

COMMENT ON COLUMN recipe.name IS '�ۼ���';

COMMENT ON COLUMN recipe.read_cnt IS '��ȸ��';

COMMENT ON COLUMN recipe.writedate IS '�����';

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

/* �ֱٺ���ǰ(������) */
CREATE TABLE latest (
	ltno NUMBER NOT NULL, /* �ֱٺ���ǰ��ȣ */
	mno NUMBER NOT NULL, /* ȸ����ȣ */
	pno NUMBER NOT NULL, /* ��ǰ��ȣ */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE latest IS '�ֱٺ���ǰ(������)';

COMMENT ON COLUMN latest.ltno IS '�ֱٺ���ǰ��ȣ';

COMMENT ON COLUMN latest.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN latest.pno IS '��ǰ��ȣ';

COMMENT ON COLUMN latest.writedate IS '�����';

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

/* ��ǰ����(�̽���) */
CREATE TABLE product_qna (
	pqno NUMBER NOT NULL, /* ��ǰ���ǹ�ȣ */
	pno NUMBER NOT NULL, /* ��ǰ��ȣ */
	mno NUMBER NOT NULL, /* ȸ����ȣ */
	title VARCHAR2(500) NOT NULL, /* ���� */
	content CLOB NOT NULL, /* ���� */
	email_yn CHAR(1) DEFAULT 'n' NOT NULL, /* �̸��ϴ亯���� */
	phone_yn CHAR(1) DEFAULT 'n' NOT NULL, /* ���ڴ亯���� */
	secret_yn CHAR(1) DEFAULT 'n' NOT NULL, /* ��бۿ��� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE product_qna IS '��ǰ����(�̽���)';

COMMENT ON COLUMN product_qna.pqno IS '��ǰ���ǹ�ȣ';

COMMENT ON COLUMN product_qna.pno IS '��ǰ��ȣ';

COMMENT ON COLUMN product_qna.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN product_qna.title IS '����';

COMMENT ON COLUMN product_qna.content IS '����';

COMMENT ON COLUMN product_qna.email_yn IS '�̸��ϴ亯����';

COMMENT ON COLUMN product_qna.phone_yn IS '���ڴ亯����';

COMMENT ON COLUMN product_qna.secret_yn IS '��бۿ���';

COMMENT ON COLUMN product_qna.writedate IS '�����';

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

/* ������(�ڿ��) */
CREATE TABLE my_coupon (
	mcno NUMBER NOT NULL, /* ��������ȣ */
	cno NUMBER NOT NULL, /* ������ȣ */
	mno NUMBER NOT NULL, /* ȸ����ȣ */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE my_coupon IS '������(�ڿ��)';

COMMENT ON COLUMN my_coupon.mcno IS '��������ȣ';

COMMENT ON COLUMN my_coupon.cno IS '������ȣ';

COMMENT ON COLUMN my_coupon.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN my_coupon.writedate IS '�����';

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

/* �����ݳ���(�ڿ��) */
CREATE TABLE saving_list (
	svlno NUMBER NOT NULL, /* �����ݳ�����ȣ */
	svno NUMBER NOT NULL, /* �����ݹ�ȣ */
	mno NUMBER NOT NULL, /* ȸ����ȣ */
	olno NUMBER NOT NULL, /* �ֹ���Ϲ�ȣ */
	credit NUMBER DEFAULT 0 NOT NULL, /* �ݾ� */
	expiry DATE DEFAULT add_months(sysdate, +1) NOT NULL, /* ��ȿ�Ⱓ */
	type CHAR(1) DEFAULT 'p' NOT NULL, /* ���� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE saving_list IS '�����ݳ���(�ڿ��)';

COMMENT ON COLUMN saving_list.svlno IS '�����ݳ�����ȣ';

COMMENT ON COLUMN saving_list.svno IS '�����ݹ�ȣ';

COMMENT ON COLUMN saving_list.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN saving_list.olno IS '�ֹ���Ϲ�ȣ';

COMMENT ON COLUMN saving_list.credit IS '�ݾ�';

COMMENT ON COLUMN saving_list.expiry IS '��ȿ�Ⱓ';

COMMENT ON COLUMN saving_list.type IS '����';

COMMENT ON COLUMN saving_list.writedate IS '�����';

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

ALTER TABLE saving_list
	ADD
		CONSTRAINT saving_list_type_c
		CHECK (type in ('p','m'));

/* �ֹ����(�) */
CREATE TABLE order_list (
	olno NUMBER NOT NULL, /* �ֹ���Ϲ�ȣ */
	mno NUMBER NOT NULL, /* ȸ����ȣ */
	ono NUMBER NOT NULL, /* �ֹ���ȣ */
	pno NUMBER NOT NULL, /* ��ǰ��ȣ */
	pono NUMBER, /* ��ǰ�ɼǹ�ȣ */
	type CHAR(1) DEFAULT 'd' NOT NULL, /* ���� */
	quantity NUMBER DEFAULT 0 NOT NULL, /* ���� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE order_list IS '�ֹ����(�)';

COMMENT ON COLUMN order_list.olno IS '�ֹ���Ϲ�ȣ';

COMMENT ON COLUMN order_list.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN order_list.ono IS '�ֹ���ȣ';

COMMENT ON COLUMN order_list.pno IS '��ǰ��ȣ';

COMMENT ON COLUMN order_list.pono IS '��ǰ�ɼǹ�ȣ';

COMMENT ON COLUMN order_list.type IS '����';

COMMENT ON COLUMN order_list.quantity IS '����';

COMMENT ON COLUMN order_list.writedate IS '�����';

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

/* ������ ��� */
CREATE TRIGGER t_order_list_saving_list
AFTER INSERT ON order_list
FOR EACH ROW
DECLARE
vsvno saving.svno%type;
vsaving_price payment.saving_price%type;
vproduct_cnt orders.product_cnt%type;
BEGIN
  IF INSERTING THEN 
    select svno into vsvno from saving where mno = :NEW.mno;
    select product_cnt into vproduct_cnt from orders where ono = :NEW.ono and mno = :NEW.mno;
    select saving_price into vsaving_price from payment where ono = :NEW.ono and mno = :NEW.mno;
    insert into saving_list(svlno, svno, mno, olno, credit) values (s_saving_list.nextval, vsvno, :NEW.mno, :NEW.olno, vsaving_price / vproduct_cnt);
   update saving
   set credit = (select sum(credit) from saving_list where mno = :NEW.mno),
        exp_credit = (select sum(credit) from saving_list where to_char(expiry,'yy/mm/dd') = to_char((select min(expiry) from saving_list where mno = :NEW.mno),'yy/mm/dd') and mno = :NEW.mno)
   where mno = :NEW.mno;
  END IF;
END;
/

/* ��õ(�̽���) */
CREATE TABLE recommend (
	rcno NUMBER NOT NULL, /* ��õ��ȣ */
	mno NUMBER NOT NULL, /* ȸ����ȣ */
	id VARCHAR2(50) NOT NULL, /* ȸ�����̵� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE recommend IS '��õ(�̽���)';

COMMENT ON COLUMN recommend.rcno IS '��õ��ȣ';

COMMENT ON COLUMN recommend.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN recommend.id IS 'ȸ�����̵�';

COMMENT ON COLUMN recommend.writedate IS '�����';

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

/* �����ϴ�����(���α�) */
CREATE TABLE question (
	qno NUMBER NOT NULL, /* �����ϴ�������ȣ */
	title VARCHAR2(500) NOT NULL, /* ���� */
	content CLOB NOT NULL, /* ���� */
	ctno NUMBER NOT NULL, /* ī�װ���ȣ */
	type CHAR(1) DEFAULT 'y' NOT NULL, /* ���⿩�� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE question IS '�����ϴ�����(���α�)';

COMMENT ON COLUMN question.qno IS '�����ϴ�������ȣ';

COMMENT ON COLUMN question.title IS '����';

COMMENT ON COLUMN question.content IS '����';

COMMENT ON COLUMN question.ctno IS 'ī�װ���ȣ';

COMMENT ON COLUMN question.type IS '���⿩��';

COMMENT ON COLUMN question.writedate IS '�����';

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

/* ����(�̽���) */
CREATE TABLE files (
	fno NUMBER NOT NULL, /* ���Ϲ�ȣ */
	mno NUMBER, /* ȸ����ȣ */
	pno NUMBER, /* ��ǰ��ȣ */
	name VARCHAR2(200) NOT NULL, /* ���ϸ� */
	real_name VARCHAR2(200) NOT NULL, /* �������ϸ� */
	loc VARCHAR2(500) DEFAULT '/static/upload/img/shop/product/' NOT NULL, /* ��� */
	ctno NUMBER NOT NULL, /* ī�װ���ȣ */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE files IS '����(�̽���)';

COMMENT ON COLUMN files.fno IS '���Ϲ�ȣ';

COMMENT ON COLUMN files.mno IS 'ȸ����ȣ';

COMMENT ON COLUMN files.pno IS '��ǰ��ȣ';

COMMENT ON COLUMN files.name IS '���ϸ�';

COMMENT ON COLUMN files.real_name IS '�������ϸ�';

COMMENT ON COLUMN files.loc IS '���';

COMMENT ON COLUMN files.ctno IS 'ī�װ���ȣ';

COMMENT ON COLUMN files.writedate IS '�����';

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

/* 1:1���Ǵ亯 */
CREATE TABLE qna_answer (
	qano NUMBER NOT NULL, /* 1:1�亯��ȣ */
	qnno NUMBER NOT NULL, /* 1:1���ǹ�ȣ */
	name VARCHAR2(30) NOT NULL, /* �̸� */
	content CLOB NOT NULL, /* ���� */
	writedate DATE DEFAULT sysdate NOT NULL /* ����� */
);

COMMENT ON TABLE qna_answer IS '1:1���Ǵ亯';

COMMENT ON COLUMN qna_answer.qano IS '1:1�亯��ȣ';

COMMENT ON COLUMN qna_answer.qnno IS '1:1���ǹ�ȣ';

COMMENT ON COLUMN qna_answer.name IS '�̸�';

COMMENT ON COLUMN qna_answer.content IS '����';

COMMENT ON COLUMN qna_answer.writedate IS '�����';

CREATE UNIQUE INDEX qna_answer_qano_p
	ON qna_answer (
		qano ASC
	);

ALTER TABLE qna_answer
	ADD
		CONSTRAINT qna_answer_qano_p
		PRIMARY KEY (
			qano
		);