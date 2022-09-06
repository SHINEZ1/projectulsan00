--후기게시판

drop table review_board;

--테이블 생성
create table review_board(
    rnumber        number(8),
    rcategory      varchar2(10),
    rtitle            clob,
    rid               varchar2(30),
    nickname       varchar2(30),
    rcdate          timestamp default systimestamp,
    rudate          timestamp default systimestamp,
    rcontent       clob,
    rhit             number(8),
    rlike            number(5)    
);

--기본키
alter table review_board add constraint review_board_rnumber_pk primary key(rnumber);
--not null
alter table review_board modify rcdate constraint review_board_rcdate_nn not null;
alter table review_board modify rudate constraint review_board_rudate_nn not null;

--외래키
id (rid)
닉네임 (nickname)
회원테이블에서

--시퀀스생성
drop sequence review_board_rnumber_seq;
create sequence review_board_rnumber_seq;

--생성
insert into review_board (rnumber,rcategory,rtitle,rid,nickname,rcontent)
      values(review_board_rnumber_seq.nextval, '공연','가을음악회','user1@test.com','별칭1','재밌어요');
insert into review_board (rnumber,rcategory,rtitle,rid,nickname,rcontent)
      values(review_board_rnumber_seq.nextval, '전시','울산1988','user2@test.com','별칭2','노잼');
insert into review_board (rnumber,rcategory,rtitle,rid,nickname,rcontent)
      values(review_board_rnumber_seq.nextval, '공연','달빛음악회','user3@test.com','별칭3','꼭보세요');

--조회
select rnumber,rcategory,rtitle,rid,nickname,rcdate,rudate,rhit,rlike
from review_board
where rtitle like '%음악%';

--수정
update review_board
  set rcategory = '공연',
      rtitle = '겨울음악회',
      rudate = systimestamp,
      rcontent = '매우 재밌어요'
where rnumber = '2';

commit;

--삭제
delete from review_board
where rnumber = '2';

select *
from review_board;


--조회수
--<update id="updateViewCnt">
--        update board
--        set view_cnt = view_cnt + 1
--        where board_num = #{boardNum};
--</update>
    





--후기게시판 댓글

drop table review_reply;

--테이블 생성
create table review_reply(
    r_number      number(8),
    rnumber       varchar2(40),
    rid              varchar2(30),
    nickname      varchar2(30),
    r_content      clob,
    r_cdate        timestamp default systimestamp,
    r_udate        timestamp default systimestamp
);

--기본키
alter table review_reply add constraint review_reply_r_number_pk primary key(r_number);

--not null
alter table review_reply modify r_cdate constraint review_reply_r_cdate_nn not null;
alter table review_reply modify r_udate constraint review_reply_r_udate_nn not null;

--외래키
리뷰게시판 번호
아이디
닉네임

--시퀀스생성
drop sequence review_reply_r_number_seq;
create sequence review_reply_r_number_seq;

--생성
insert into review_reply (r_number,rid,nickname,r_content)
 values(review_reply_r_number_seq.nextval, 'user4@test.com','별칭4','재밌어요');
insert into review_reply (r_number,rid,nickname,r_content)
 values(review_reply_r_number_seq.nextval, 'user5@test.com','별칭5','노잼');
insert into review_reply (r_number,rid,nickname,r_content)
 values(review_reply_r_number_seq.nextval, 'user6@test.com','별칭6','꿀잼');

--수정
update review_reply
   set r_content = '그저그래요',
       r_udate = systimestamp
 where r_number = '1';

select *
from review_reply;


commit;
 --삭제
delete from review_reply
 where r_number = '1';






--홍보게시판

drop table ad_board;

--테이블 생성
create table ad_board(
    anumber        number(8),
    acategory      varchar2(10),
    atitle            clob,
    aid               varchar2(30),
    nickname       varchar2(30),
    acdate          timestamp default systimestamp,
    audate          timestamp default systimestamp,
    acontent       clob,
    ahit             number(8),
    alike            number(5)    
);

--기본키
alter table ad_board add constraint ad_board_anumber_pk primary key(anumber);

--not null
alter table ad_board modify acdate constraint ad_board_acdate_nn not null;
alter table ad_board modify audate constraint ad_board_audate_nn not null;

--외래키
id (aid)
닉네임 (nickname)
회원테이블에서

--시퀀스생성
drop sequence ad_board_anumber_seq;
create sequence ad_board_anumber_seq;

--생성
insert into ad_board (anumber,acategory,atitle,aid,nickname,acontent)
      values(ad_board_anumber_seq.nextval, '공연','오케스트라 정기연주회','user7@test.com','별칭7','오세요');
insert into ad_board (anumber,acategory,atitle,aid,nickname,acontent)
      values(ad_board_anumber_seq.nextval, '전시','미술전시회','user8@test.com','별칭8','재밌습니다');
insert into ad_board (anumber,acategory,atitle,aid,nickname,acontent)
      values(ad_board_anumber_seq.nextval, '공연','달빛음악회','user9@test.com','별칭9','꼭보러오세요');

--조회
select anumber,acategory,atitle,aid,nickname,acdate,audate,ahit,alike
from ad_board
where atitle like '%음악%';

--수정
update ad_board
  set acategory = '전시',
       atitle = '미술품전시회',
       audate = systimestamp,
       acontent = '매우 재밌습니다'
where anumber = '2';

commit;

--삭제
delete from ad_board
where anumber = '2';

select *
from ad_board;


--조회수
--<update id="updateViewCnt">
--        update board
--        set view_cnt = view_cnt + 1
--        where board_num = #{boardNum};
--</update>












//홍보게시판 댓글
drop table ad_reply;

--테이블 생성
create table ad_reply(
    a_number      number(8),
    anumber       varchar2(40),
    aid              varchar2(30),
    nickname      varchar2(30),
    a_content      clob,
    a_cdate        timestamp default systimestamp,
    a_udate        timestamp default systimestamp
);

--기본키
alter table ad_reply add constraint ad_reply_a_number_pk primary key(a_number);

--not null
alter table ad_reply modify a_cdate constraint ad_reply_a_cdate_nn not null;
alter table ad_reply modify a_udate constraint ad_reply_a_udate_nn not null;

--외래키
홍보게시판 번호
아이디
닉네임

--시퀀스생성
drop sequence ad_reply_a_number_seq;
create sequence ad_reply_a_number_seq;

--생성
insert into ad_reply (a_number,aid,nickname,a_content)
 values(ad_reply_a_number_seq.nextval, 'user10@test.com','별칭10','재밌어요');
insert into ad_reply (a_number,aid,nickname,a_content)
 values(ad_reply_a_number_seq.nextval, 'user11@test.com','별칭11','노잼');
insert into ad_reply (a_number,aid,nickname,a_content)
 values(ad_reply_a_number_seq.nextval, 'user12@test.com','별칭12','꿀잼');

--수정
update ad_reply
   set a_content = '그저그래요',
       a_udate = systimestamp
 where a_number = '1';

select *
from ad_reply;


commit;
 --삭제
delete from ad_reply
 where a_number = '1';
