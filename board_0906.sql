--�ı�Խ���

drop table review_board;

--���̺� ����
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

--�⺻Ű
alter table review_board add constraint review_board_rnumber_pk primary key(rnumber);
--not null
alter table review_board modify rcdate constraint review_board_rcdate_nn not null;
alter table review_board modify rudate constraint review_board_rudate_nn not null;

--�ܷ�Ű
id (rid)
�г��� (nickname)
ȸ�����̺���

--����������
drop sequence review_board_rnumber_seq;
create sequence review_board_rnumber_seq;

--����
insert into review_board (rnumber,rcategory,rtitle,rid,nickname,rcontent)
      values(review_board_rnumber_seq.nextval, '����','��������ȸ','user1@test.com','��Ī1','��վ��');
insert into review_board (rnumber,rcategory,rtitle,rid,nickname,rcontent)
      values(review_board_rnumber_seq.nextval, '����','���1988','user2@test.com','��Ī2','����');
insert into review_board (rnumber,rcategory,rtitle,rid,nickname,rcontent)
      values(review_board_rnumber_seq.nextval, '����','�޺�����ȸ','user3@test.com','��Ī3','��������');

--��ȸ
select rnumber,rcategory,rtitle,rid,nickname,rcdate,rudate,rhit,rlike
from review_board
where rtitle like '%����%';

--����
update review_board
  set rcategory = '����',
      rtitle = '�ܿ�����ȸ',
      rudate = systimestamp,
      rcontent = '�ſ� ��վ��'
where rnumber = '2';

commit;

--����
delete from review_board
where rnumber = '2';

select *
from review_board;


--��ȸ��
--<update id="updateViewCnt">
--        update board
--        set view_cnt = view_cnt + 1
--        where board_num = #{boardNum};
--</update>
    





--�ı�Խ��� ���

drop table review_reply;

--���̺� ����
create table review_reply(
    r_number      number(8),
    rnumber       varchar2(40),
    rid              varchar2(30),
    nickname      varchar2(30),
    r_content      clob,
    r_cdate        timestamp default systimestamp,
    r_udate        timestamp default systimestamp
);

--�⺻Ű
alter table review_reply add constraint review_reply_r_number_pk primary key(r_number);

--not null
alter table review_reply modify r_cdate constraint review_reply_r_cdate_nn not null;
alter table review_reply modify r_udate constraint review_reply_r_udate_nn not null;

--�ܷ�Ű
����Խ��� ��ȣ
���̵�
�г���

--����������
drop sequence review_reply_r_number_seq;
create sequence review_reply_r_number_seq;

--����
insert into review_reply (r_number,rid,nickname,r_content)
 values(review_reply_r_number_seq.nextval, 'user4@test.com','��Ī4','��վ��');
insert into review_reply (r_number,rid,nickname,r_content)
 values(review_reply_r_number_seq.nextval, 'user5@test.com','��Ī5','����');
insert into review_reply (r_number,rid,nickname,r_content)
 values(review_reply_r_number_seq.nextval, 'user6@test.com','��Ī6','����');

--����
update review_reply
   set r_content = '�����׷���',
       r_udate = systimestamp
 where r_number = '1';

select *
from review_reply;


commit;
 --����
delete from review_reply
 where r_number = '1';






--ȫ���Խ���

drop table ad_board;

--���̺� ����
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

--�⺻Ű
alter table ad_board add constraint ad_board_anumber_pk primary key(anumber);

--not null
alter table ad_board modify acdate constraint ad_board_acdate_nn not null;
alter table ad_board modify audate constraint ad_board_audate_nn not null;

--�ܷ�Ű
id (aid)
�г��� (nickname)
ȸ�����̺���

--����������
drop sequence ad_board_anumber_seq;
create sequence ad_board_anumber_seq;

--����
insert into ad_board (anumber,acategory,atitle,aid,nickname,acontent)
      values(ad_board_anumber_seq.nextval, '����','���ɽ�Ʈ�� ���⿬��ȸ','user7@test.com','��Ī7','������');
insert into ad_board (anumber,acategory,atitle,aid,nickname,acontent)
      values(ad_board_anumber_seq.nextval, '����','�̼�����ȸ','user8@test.com','��Ī8','��ս��ϴ�');
insert into ad_board (anumber,acategory,atitle,aid,nickname,acontent)
      values(ad_board_anumber_seq.nextval, '����','�޺�����ȸ','user9@test.com','��Ī9','������������');

--��ȸ
select anumber,acategory,atitle,aid,nickname,acdate,audate,ahit,alike
from ad_board
where atitle like '%����%';

--����
update ad_board
  set acategory = '����',
       atitle = '�̼�ǰ����ȸ',
       audate = systimestamp,
       acontent = '�ſ� ��ս��ϴ�'
where anumber = '2';

commit;

--����
delete from ad_board
where anumber = '2';

select *
from ad_board;


--��ȸ��
--<update id="updateViewCnt">
--        update board
--        set view_cnt = view_cnt + 1
--        where board_num = #{boardNum};
--</update>












//ȫ���Խ��� ���
drop table ad_reply;

--���̺� ����
create table ad_reply(
    a_number      number(8),
    anumber       varchar2(40),
    aid              varchar2(30),
    nickname      varchar2(30),
    a_content      clob,
    a_cdate        timestamp default systimestamp,
    a_udate        timestamp default systimestamp
);

--�⺻Ű
alter table ad_reply add constraint ad_reply_a_number_pk primary key(a_number);

--not null
alter table ad_reply modify a_cdate constraint ad_reply_a_cdate_nn not null;
alter table ad_reply modify a_udate constraint ad_reply_a_udate_nn not null;

--�ܷ�Ű
ȫ���Խ��� ��ȣ
���̵�
�г���

--����������
drop sequence ad_reply_a_number_seq;
create sequence ad_reply_a_number_seq;

--����
insert into ad_reply (a_number,aid,nickname,a_content)
 values(ad_reply_a_number_seq.nextval, 'user10@test.com','��Ī10','��վ��');
insert into ad_reply (a_number,aid,nickname,a_content)
 values(ad_reply_a_number_seq.nextval, 'user11@test.com','��Ī11','����');
insert into ad_reply (a_number,aid,nickname,a_content)
 values(ad_reply_a_number_seq.nextval, 'user12@test.com','��Ī12','����');

--����
update ad_reply
   set a_content = '�����׷���',
       a_udate = systimestamp
 where a_number = '1';

select *
from ad_reply;


commit;
 --����
delete from ad_reply
 where a_number = '1';
