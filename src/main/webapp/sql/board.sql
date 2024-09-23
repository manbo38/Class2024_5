-- 일반 게시판
select * from tab;
select * from seq;
select * from board;

-- 데이터 입력
insert into board values(board_seq.nextval,'윈터','winter@sm.com',
'SM소속 가수','1234',sysdate,0,'SM 에스파','222.183.0.1');

select count(*) from board;

create table board(
num number primary key,
writer varchar2(20) not null,
email varchar2(30),
subject varchar2(50) not null,
passwd varchar2(20) not null,
reg_date timestamp not null,
readcount number default 0,
content varchar2(2000) not null,
ip varchar2(20) not null );

create sequence board_seq
start with 1
increment by 1
nocache;