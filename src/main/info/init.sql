-- 프로젝트 테이블 스페이스 생성
create tablespace doogle datafile 'D:\db\doogle.dbf' size 200m default storage(initial 80k next 80k minextents 1 maxextents 121 pctincrease 80) online;

-- 프로젝트 계정 생성
create user doogle identified by enffl default tablespace doogle;

-- 접속, 리소스 권한주기
grant connect, resource to doogle;

-- 프로젝트 데이터 생성
--@D:\projectWorkspace\doogle\src\main\info\doogle.sql
--PURGE RECYCLEBIN;
--관리자페이지 에서 카테고리 등록
--@D:\projectWorkspace\doogle\src\main\info\admin.sql
--@D:\projectWorkspace\doogle\src\main\info\product.sql
--@D:\projectWorkspace\doogle\src\main\info\grade.sql
--@D:\projectWorkspace\doogle\src\main\info\files.sql
--@D:\projectWorkspace\doogle\src\main\info\product_update.sql
--@D:\projectWorkspace\doogle\src\main\info\delete_product.sql
--@D:\projectWorkspace\doogle\src\main\info\delete_file.sql
--@D:\projectWorkspace\doogle\src\main\info\question.sql
--@D:\projectWorkspace\doogle\src\main\info\notice.sql
--@D:\projectWorkspace\doogle\src\main\info\kimheesu.sql
--@D:\projectWorkspace\doogle\src\main\info\qna.sql
--insert into category(ctno,name,lv,type,idx,writedate) values(s_CATEGORY.nextval,'이벤트',0,'f',6,sysdate);
--delete from category where ctno in (3,128);
--alter table product add best_yn char(1) default 'n';
--alter table product add new_yn char(1) default 'n';
--UPDATE product a SET (a.best_yn) = 'y' WHERE EXISTS (SELECT 0 FROM (select * from (select * from product order by DBMS_RANDOM.RANDOM) where rownum < 51) b where b.pno = a.pno);
--UPDATE product a SET (a.new_yn) = 'y' WHERE EXISTS (SELECT 0 FROM (select * from (select * from product order by DBMS_RANDOM.RANDOM) where rownum < 51) b where b.pno = a.pno);
--commit;