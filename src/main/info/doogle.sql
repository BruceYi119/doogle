-- 프로젝트 테이블 스페이스 생성
create tablespace doogle datafile 'D:\db\doogle.dbf' size 200m default storage(initial 80k next 80k minextents 1 maxextents 121 pctincrease 80) online;

-- 프로젝트 계정 생성
create user doogle identified by enffl default tablespace doogle;

-- 접속, 리소스 권한주기
grant connect, resource to doogle;

-- 회원 테이블 (이승준)
drop table member;
drop sequence s_member;
create sequence s_member;
create table member(
	mno number constraint member_mno_p primary key,													-- 키
	id varchar2(50) constraint member_id_n not null,													-- 아이디
	pw char(128) constraint member_pw_n not null,														-- 비밀번호(sha512)
	name varchar2(30) constraint member_name_n not null,												-- 이름
	phone varchar2(20) constraint member_phone_n not null,											-- 연락처
	birth varchar2(20) constraint member_birth_n not null,											-- 생년월일
	zipcode varchar2(10) constraint member_zipcode_n not null,										-- 우편번호
	addr varchar2(300) constraint member_addr_n not null,											-- 주소
	addr_detail varchar2(300) constraint member_addr_detail_n not null,								-- 상세주소
	email varchar2(30) constraint member_email_n not null,											-- 이메일
	mtype char(1) default 'n',																			-- 관리자 여부 'a' = 관리자, 'n' = '일반회원'
	del_yn char(1) default 'n',																		-- 탈퇴여부 'n' = 탈퇴x, 'y' = 탈퇴o
	writedate date default sysdate,																	-- 가입일
	constraint member_mtype_c check (mtype in ('a','n')),
	constraint member_del_yn_c check (del_yn in ('y','n'))
);

-- 관리자 회원 등록
insert into member values(s_member.nextval, 'admin', '38252f54a15f38fe15c2bb2304bbf1b27f0f17f9b6d7998ba4ac3833d5842c9d23f2ec6f468708f702204b7cf408fdb13391b82c9baea6137b4a4dce19537bb3', '관리자', '010-1234-1234', '1983-01-19', '06241', '서울특별시 강남구 강남대로 358', '상세주소', 'pirates119@gmail.com', 'a', 'n', sysdate);

-- 관리자 회원정보 페이징처리 확인을 위한 데이터 생성쿼리
--GRANT EXECUTE ON DBMS_LOCK TO doogle;
--
--DECLARE
--i number := 1;
--BEGIN
--
--    LOOP
--        insert into member values(s_member.nextval, 'admin' || i, '38252f54a15f38fe15c2bb2304bbf1b27f0f17f9b6d7998ba4ac3833d5842c9d23f2ec6f468708f702204b7cf408fdb13391b82c9baea6137b4a4dce19537bb3', '관리자', '010-1234-1234', '1983-01-19', '06241', '서울특별시 강남구 강남대로 358', '상세주소', 'pirates119@gmail.com', 'a', 'n', sysdate);
--        i := i + 1;
--        DBMS_LOCK.SLEEP(01);
--    EXIT WHEN i > 105;
--    END LOOP;
--
--    commit;
--END;
--/