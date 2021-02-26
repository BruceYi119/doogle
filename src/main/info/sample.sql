select * from basket;
--insert into basket values(2,1,9,null,1,sysdate);
select * from product;
--insert into product values(9,'[빙그레]','조스바','a','b','c','d','없음',900,0,'n',0,'n',1,1,1,'1,3,5',99,'y',sysdate);
select * from files;
--insert into files values(22,1,'조스바.png','test','test',32,sysdate);
select b.*, p.pname, f.name from basket b left join product p on b.pno = p.pno left join files f on REGEXP_SUBSTR(p.fno, '[^,]+', 1, 1) = f.fno;