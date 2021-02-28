drop table test;
drop table test1;
drop SEQUENCE s_test;
drop SEQUENCE s_test1;
create SEQUENCE s_test;
create SEQUENCE s_test1;
create table test(
    tno number primary key,
    con varchar2(100)
);
create table test1(
    tno1 number primary key,
    con varchar2(100),
    tno number
);