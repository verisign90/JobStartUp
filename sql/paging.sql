select * from notice;

select * from notice_file;

commit;

SELECT MAX(not_no) FROM NOTICE;

insert into notice (NOT_TITLE, NOT_CONTENT, NOT_REGDATE)
values ('페이징20', '페이징내용20', sysdate);

insert into notice (NOT_TITLE, NOT_CONTENT, NOT_REGDATE, NOT_CATEGORY)
values ('페이징23', '페이징내용23', SYSTIMESTAMP , 'all');

/*페이징 처리*/
SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY NOT_NO DESC) AS ROW_NUM, NOT_NO, NOT_TITLE, NOT_CONTENT, NOT_REGDATE, NOT_MODDATE FROM NOTICE)
WHERE ROW_NUM BETWEEN 11 AND 20;

SELECT * FROM (SELECT /*+ INDEX_DESC(NOTICE SYS_C0026505)*/ ROWNUM AS ROW_NUM, NOT_NO, NOT_TITLE, NOT_CONTENT, NOT_REGDATE, NOT_MODDATE, NOT_CATEGORY FROM NOTICE WHERE ROWNUM <= 10)
WHERE ROW_NUM >= 1
and NOT_TITLE like '%' || '기업' || '%';

SELECT * FROM (SELECT /*+ INDEX_DESC(NOTICE SYS_C0026505)*/ ROWNUM AS ROW_NUM, NOT_NO, NOT_TITLE, NOT_CONTENT, NOT_REGDATE, NOT_MODDATE, NOT_CATEGORY FROM NOTICE WHERE ROWNUM <= 10)
WHERE ROW_NUM >= 1
AND NOT_CATEGORY in ('company', 'all');

select * from notice
where NOT_CATEGORY in ('company', 'all');

SELECT * FROM (SELECT /*+ INDEX_DESC(NOTICE SYS_C0026505)*/ ROWNUM AS ROW_NUM, NOT_NO, NOT_TITLE, NOT_CONTENT, NOT_REGDATE, NOT_MODDATE FROM NOTICE WHERE ROWNUM <= 10)
WHERE ROW_NUM >= 1
and (NOT_TITLE like '%' || '기업' || '%' 
    OR CONTAINS(NOT_CONTENT, '기업', 1) > 0);
    

SELECT * FROM NOTICE
WHERE CONTAINS(NOT_CONTENT, '파일 OR 파일*', 1) > 0;    
    
CREATE INDEX idx_notice_content ON notice(not_content) INDEXTYPE IS CTXSYS.CONTEXT;    

SELECT * FROM (SELECT ROW_NUMBER() OVER(ORDER BY NOT_NO DESC) AS ROW_NUM, NOTICE.* FROM NOTICE)
WHERE ROW_NUM BETWEEN 1 AND 10;

SELECT * FROM (
    SELECT ROWNUM AS ROW_NUM, T.* 
    FROM (
        SELECT NOTICE.* 
        FROM NOTICE 
        ORDER BY NOT_NO DESC
    ) T
    WHERE ROWNUM <= 20
)
WHERE ROW_NUM >= 10;

SELECT COUNT(NOT_NO) FROM NOTICE;




/*수정 및 입력*/

select * from member;

select * from menu_master;
select * from menu_authority;
select * from resume;

ALTER TABLE language_certificate MODIFY (LANG_CER_DATE DATE); 

ALTER TABLE certificate ADD (CER_DATE DATE);

ALTER TABLE job_fair MODIFY (jobfair_content NCLOB); 

insert into menu_master 
values ('3000', null, '관리자', 'A', null, '3000', 0, 1, 'Y');

insert into menu_master 
values ('2100', '2000', '채용박람', 'U', '/seeker/resumeWrite', '1000', 1, 2, 'Y');

insert into menu_master 
values ('3000', '1000', '이력서 관리·수정', 'U', '/seeker/resumeList', '1000', 2, 2, 'Y');

insert into menu_master 
values ('4000', null, '', 'A', null, '3000', 0, 1, 'Y');

delete menu_master where menu_id >=1;
delete menu_authority where menu_id >=1;

update menu_master set menu_name = '개인서비스' where menu_order =0;

ALTER TABLE resume ADD CONSTRAINT FK_loc
FOREIGN KEY (resume_loc) REFERENCES code(group_code);

ALTER TABLE resume 
ADD FOREIGN KEY(resume_loc)
REFERENCES code(GROUP_CODE);

ALTER TABLE NOTICE MODIFY (NOT_CONTENT NCLOB);

SELECT COUNT(not_no) FROM NOTICE
        WHERE not_no > 0;

commit;


select * from code c, detail_code d
where c.group_code = d.group_code
and d.group_code = 100;

select d.detail_name from code c, detail_code d
where c.group_code = d.group_code
and c.group_name = '지역'
and d.parents_code is null;

ALTER TABLE member DROP COLUMN class;

ALTER TABLE job_posting DROP COLUMN posting_content;

ALTER TABLE member ADD (jobfair_loc_code VARCHAR2(20));

ALTER TABLE member ADD (jobfair_loc_code VARCHAR2(20));

ALTER TABLE certificate ADD (CER_DATE DATE);

alter database set time_zone = 'Asia/Seoul';


ALTER TABLE company DROP CONSTRAINT FK_COMPANY_COMPANY_ADDRESS_CODE_CODE_GROUP_CODE;

ALTER TABLE job_fair ADD CONSTRAINT FK_job_fair_jobfair_loc_code
FOREIGN KEY (jobfair_loc_code) REFERENCES detail_code(detail_code_num)
ON DELETE SET NULL;

select * from notice n, notice_file f
where n.not_no = f.not_no
and n.not_no = 1;

SELECT * FROM NOTICE_FILE
WHERE not_no = 1;
