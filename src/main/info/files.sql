insert into files(fno, name, real_name, loc, ctno, pno) select s_files.nextval,  pno || '.jpg', pno || '.jpg' real_name, '/static/upload/img/shop/product/', 284, pno from product;
commit;