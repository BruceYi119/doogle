update product p set p.fno = (select f.fno from files f where f.pno = p.pno) WHERE EXISTS (select 0 from files f where f.pno = p.pno);
commit;