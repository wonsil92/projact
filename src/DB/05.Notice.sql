DROP TABLE NOTICE;
DROP SEQUENCE NTSEQ;

--게시판 번호 시퀀스 (PRIMARY KEY)
CREATE SEQUENCE NTSEQ;

CREATE TABLE NOTICE(
	NT_ID NUMBER PRIMARY KEY, --공지사항 게시판번호
	NT_TITLE VARCHAR2(1000) NOT NULL, --제목
	NT_CONTENT VARCHAR2(2000) NOT NULL, --내용
	NT_VIEW_CNT NUMBER DEFAULT 0, --조회수
	MEMBER_ID NUMBER NOT NULL, --회원번호
	NT_REGDATE DATE NOT NULL, --작성일
	CONSTRAINT NTBOARD_FK_MEMBER_ID  FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
);


INSERT INTO NOTICE
VALUES(NTSEQ.NEXTVAL,'첫번째 공지사항 제목','1번 글 입니다.',0,1,SYSDATE);

SELECT * FROM NOTICE
ORDER BY NT_ID DESC;
