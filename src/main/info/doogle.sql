-- ������Ʈ ���̺� �����̽� ����
create tablespace doogle datafile 'D:\db\doogle.dbf' size 200m default storage(initial 80k next 80k minextents 1 maxextents 121 pctincrease 80) online;

-- ������Ʈ ���� ����
create user doogle identified by enffl default tablespace doogle;

-- ����, ���ҽ� �����ֱ�
grant connect, resource to doogle;

-- ȸ�� ���̺� (�̽���)
drop table member;
drop sequence s_member;
create sequence s_member;
create table member(
	mno number constraint member_mno_p primary key,													-- Ű
	id varchar2(50) constraint member_id_n not null,													-- ���̵�
	pw char(128) constraint member_pw_n not null,														-- ��й�ȣ(sha512)
	name varchar2(30) constraint member_name_n not null,												-- �̸�
	phone varchar2(20) constraint member_phone_n not null,											-- ����ó
	birth varchar2(20) constraint member_birth_n not null,											-- �������
	zipcode varchar2(10) constraint member_zipcode_n not null,										-- �����ȣ
	addr varchar2(300) constraint member_addr_n not null,											-- �ּ�
	addr_detail varchar2(300) constraint member_addr_detail_n not null,								-- ���ּ�
	email varchar2(30) constraint member_email_n not null,											-- �̸���
	mtype char(1) default 'n',																			-- ������ ���� 'a' = ������, 'n' = '�Ϲ�ȸ��'
	del_yn char(1) default 'n',																		-- Ż�𿩺� 'n' = Ż��x, 'y' = Ż��o
	writedate date default sysdate,																	-- ������
	constraint member_mtype_c check (mtype in ('a','n')),
	constraint member_del_yn_c check (del_yn in ('y','n'))
);

-- ������ ȸ�� ���
insert into member values(s_member.nextval, 'admin', '38252f54a15f38fe15c2bb2304bbf1b27f0f17f9b6d7998ba4ac3833d5842c9d23f2ec6f468708f702204b7cf408fdb13391b82c9baea6137b4a4dce19537bb3', '������', '010-1234-1234', '1983-01-19', '06241', '����Ư���� ������ ������� 358', '���ּ�', 'pirates119@gmail.com', 'a', 'n', sysdate);

-- ������ ȸ������ ����¡ó�� Ȯ���� ���� ������ ��������
--GRANT EXECUTE ON DBMS_LOCK TO doogle;
--
--DECLARE
--i number := 1;
--BEGIN
--
--    LOOP
--        insert into member values(s_member.nextval, 'admin' || i, '38252f54a15f38fe15c2bb2304bbf1b27f0f17f9b6d7998ba4ac3833d5842c9d23f2ec6f468708f702204b7cf408fdb13391b82c9baea6137b4a4dce19537bb3', '������', '010-1234-1234', '1983-01-19', '06241', '����Ư���� ������ ������� 358', '���ּ�', 'pirates119@gmail.com', 'a', 'n', sysdate);
--        i := i + 1;
--        DBMS_LOCK.SLEEP(01);
--    EXIT WHEN i > 105;
--    END LOOP;
--
--    commit;
--END;
--/