--1)
drop table contents_review;
drop table contents;



--�������ø��
create table contents(
				cmt20id VARCHAR2(11),
				cmenu VARCHAR2(11),
				cprfnm CLOB,
				cposter CLOB,
				cprfpdfrom DATE,
				cprfpdto DATE,
				prfruntime CLOB,
				dtguidance CLOB,
				centrpsnm VARCHAR2(20),
				cfcltynm CLOB,
				cprfage VARCHAR2(20),
				csty CLOB,
				cpcseguidance VARCHAR2(80)
);

--�⺻Ű/����
alter table contents add constraint contents_id_pk primary key (cmt20id);
alter table contents modify cprfnm constraint contents_title_nn not null;
alter table contents modify cmt20id constraint contents_id_nn not null;

--��������������
create table contents_review(
            cre_id VARCHAR2(11),
            c_id VARCHAR2(11),
            nickname VARCHAR2(30),
            cre_review CLOB,
			c_cdate TIMESTAMP,
			c_udate TIMESTAMP
);

--�⺻Ű/����
alter table contents_review add constraint review_cre_id_pk primary key (cre_id);
alter table contents_review modify cre_id constraint contents_review_cre_id_nn not null;


--�ܷ�Ű
alter table contents_review add constraint contents_review_c_id_fk 
        FOREIGN key(c_id) references contents(cmt20id);

commit;


--2)

--�������ø�� �ӽõ�����
insert into contents values('PF197254', '����', '��2ȸ ��Ʋ ��Ƽ��Ʈ �ܼ�Ʈ', 'http://www.kopis.or.kr/upload/pfmPoster/PF_PF197254_220830_105936.jpg', '2022.08.29', '2022.08.29', '1�ð� 20��', '������(19:30)', '�ش���������', '�Ե��ܼ�ƮȦ (�Ե��ܼ�ƮȦ)', '�� 7�� �̻�', 'http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF197254_220830_1059360.jpg', '20,000��');
insert into contents values('PF197218', '����', 'SAC on screen, �¸�� ���� [����]', 'http://www.kopis.or.kr/upload/pfmPoster/PF_PF197218_220829_153237.jpg', '2022.08.26', '2022.09.06', '1�ð� 50��', 'ȭ����(15:00)', '�ش���������', '���ֹ���ȸ��', '�� 5�� �̻�', 'http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF197218_220829_0419510.jpg', '���� ����');
insert into contents values('PF197207', '����', 'ã�ư��� Let��s DMZ [��õ]', 'http://www.kopis.or.kr/upload/pfmPoster/PF_PF197207_220829_150949.jpg', '2022.08.27', '2022.08.27', '1�ð� 20��', '�������(15:00)', '�ش���������', '��õ��ƮȦ', '�� 7�� �̻�', 'http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF197207_220829_0309490.jpg', '���� ����');
insert into contents values('PF197197', '����', '�츮 �Ҹ� ���� ������, ���غ��Ҹ� ������Ʈ', 'http://www.kopis.or.kr/upload/pfmPoster/PF_PF197254_220830_105936.jpg', '2022.08.26', '2022.08.26', '1�ð� 30��', '������(19:30)', '�ش���������', '�Ե��ܼ�ƮȦ (�Ե��ܼ�ƮȦ)', '�� 7�� �̻�', 'http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF197254_220830_1059360.jpg', '���� ����');
insert into contents values('PF197161', '����', '��,������ ������ ���ϰ� ���ϰ�!', 'http://www.kopis.or.kr/upload/pfmPoster/PF_PF197161_220829_133411.jpg', '2022.08.30', '2022.08.30', '1�ð� 20��', 'ȭ����(19:30)', '�ش���������', '���ƶ�����', '�� 6�� �̻�', 'http://www.kopis.or.kr/upload/pfmIntroImage/PF_PF197254_220830_1059360.jpg', '���� ����');


--�������������� �ӽõ�����
insert into contents_review values('1', 'PF197254', '1��', '��վ��','05-01-03','05-01-03');
insert into contents_review values('2', 'PF197218', '2��', '���ƿ�','05-01-03','05-01-03');
insert into contents_review values('3', 'PF197207', '3��', '���� �����ϴ�. ��ſ����.','05-01-03','05-01-03');
insert into contents_review values('4', 'PF197197', '4��', '���ο����. �������� �־��.','05-01-03','05-01-03');
insert into contents_review values('5', 'PF197161', '5��', '����~','05-01-03','05-01-03');

commit;

select * from contents;
select * from contents_review;

desc contents;
desc contents_review;

update contents
   set cmenu = '�з�',
        cprfnm = '��������',
        cposter = '�̹������',
        cprfpdfrom = '2022.08.29',
        cprfpdto =  '2022.08.29',
        prfruntime = '��Ÿ��',
        dtguidance = '�ð�',
        centrpsnm = '��ȹ/���ۻ�',
        cfcltynm = '���',
        cprfage = '��������',
        csty = '����',
        cpcseguidance = '���'
 where cmt20id = 'PF197254';