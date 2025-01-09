create table tbl_jumin_201809(
jumin char(14) not null primary key,
pname varchar2(16),
tel varchar2(13),
address varchar2(10)
);

create table tbl_hosp_202109(
hospcode char(4) not null primary key,
hospname varchar2(10),
hosptel varchar2(10),
hospaddr varchar2(10)
);

create table tbl_vaccresv_202109(
resvno char(8) not null primary key,
jumin char(14),
vcode char(4),
hospcode char(4),
resvdate char(8),
resvtime char(4)
);

insert into tbl_jumin_201809 values('700101-1000001', '김주민', '010-1234-0001', '서울');
insert into tbl_jumin_201809 values('700101-2000002', '이주민', '010-1234-0002', '서울');
insert into tbl_jumin_201809 values('700101-1000003', '박주민', '010-1234-0003', '서울');
insert into tbl_jumin_201809 values('700101-2000004', '조주민', '010-1234-0004', '대전');
insert into tbl_jumin_201809 values('700101-1000005', '홍주민', '010-1234-0005', '대전');
insert into tbl_jumin_201809 values('700101-2000006', '나주민', '010-1234-0006', '대구');
insert into tbl_jumin_201809 values('700101-1000007', '황주민', '010-1234-0007', '대구');
insert into tbl_jumin_201809 values('700101-2000008', '용주민', '010-1234-0008', '광주');
insert into tbl_jumin_201809 values('700101-1000009', '백주민', '010-1234-0009', '광주');
insert into tbl_jumin_201809 values('700101-2000010', '송주민', '010-1234-0010', '광주');

insert into tbl_hosp_202109 values('H001', '가-병원', '1588-0001', '서울');
insert into tbl_hosp_202109 values('H002', '나-병원', '1588-0002', '대전');
insert into tbl_hosp_202109 values('H003', '다-병원', '1588-0003', '대구');
insert into tbl_hosp_202109 values('H004', '라-병원', '1588-0004', '광주');

insert into tbl_vaccresv_202109 values('20210001', '700101-1000001', 'V001', 'H001', '20210901', '0920');
insert into tbl_vaccresv_202109 values('20210002', '700101-2000002', 'V001', 'H002', '20210901', '1030');
insert into tbl_vaccresv_202109 values('20210003', '700101-1000003', 'V002', 'H003', '20210902', '1130');
insert into tbl_vaccresv_202109 values('20210004', '700101-2000004', 'V002', 'H001', '20210902', '1230');
insert into tbl_vaccresv_202109 values('20210005', '700101-1000005', 'V002', 'H002', '20210902', '1330');
insert into tbl_vaccresv_202109 values('20210006', '700101-2000006', 'V003', 'H003', '20210903', '1430');
insert into tbl_vaccresv_202109 values('20210007', '700101-1000007', 'V003', 'H001', '20210903', '1530');
insert into tbl_vaccresv_202109 values('20210008', '700101-2000008', 'V003', 'H002', '20210903', '1630');
insert into tbl_vaccresv_202109 values('20210009', '700101-1000009', 'V003', 'H003', '20210904', '1730');
insert into tbl_vaccresv_202109 values('20210010', '700101-2000010', 'V003', 'H001', '20210904', '1830');

<--ListConfirm-->
select tv.resvno, tj.pname, tj.jumin, substr(tj.jumin, 8, 1), tj.tel, substr(tv.resvdate, 1, 4), substr(tv.resvdate, 5, 2), substr(tv.resvdate, 7, 2), substr(tv.resvtime, 1, 2), substr(tv.resvtime, 3, 2), th.hospname, th.hosptel, th.hospaddr, tv.vcode
from tbl_jumin_201809 tj, tbl_hosp_202109 th, tbl_vaccresv_202109 tv
where tj.jumin = tv.jumin and th.hospcode = tv.hospcode;

<--RegiConfirm-->
insert into tbl_vaccresv_202109 values(?, ?, ?, ?, ?, ?);

<--Result1-->
select tv.hospcode, th.hospname, count(tv.hospcode) 
from tbl_hosp_202109 th, tbl_vaccresv_202109 tv 
where th.hospcode = tv.hospcode 
group by tv.hospcode, th.hospname 
order by tv.hospcode;

<--Result2-->
select count(*) from tbl_vaccresv_202109;