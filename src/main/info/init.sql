-- 프로젝트 테이블 스페이스 생성
create tablespace doogle datafile 'D:\db\doogle.dbf' size 200m default storage(initial 80k next 80k minextents 1 maxextents 121 pctincrease 80) online;

-- 프로젝트 계정 생성
create user doogle identified by enffl default tablespace doogle;

-- 접속, 리소스 권한주기
grant connect, resource to doogle;

-- 프로젝트 데이터 생성
--@D:\projectWorkspace\doogle\src\main\info\doogle.sql
--PURGE RECYCLEBIN;
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
--insert into category(ctno,name,lv,type,idx,writedate) values(s_CATEGORY.nextval,'이벤트',0,'f',6,sysdate);
--delete from category where ctno in (3,128);
--commit;