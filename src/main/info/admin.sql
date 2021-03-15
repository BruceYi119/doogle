-- 관리자 회원 등록
insert into member(mno, id, pw, name, phone, birth, zipcode, addr, addr_detail, email, mtype) values(s_member.nextval, 'admin', 'c8ce1d14c04f911e23fd69da4a1b5c0a61a3fd0cac5482a099c1714eade0b6155d4a045fc05ca38325946fa5493925a65e181dcc208c757e31e3529432a53595', '관리자', '010-9140-1058', '1983-01-19', '06241', '서울특별시 강남구 강남대로 358', '상세주소', '01191401058@naver.com', 'a');
commit;