--그룹번호 : 게시글에 답변을 달았을 때 번호를 묶어서 관리하는 번호
--타이틀탭 : 답변 글을 한칸씩 띄어서 출력
--답변을 쓰면 부모글 밑에 들어감
--글번호, 그룹번호,제목, 작성자, 날짜
--qa게시판
DROP TABLE QABOARD;
DROP SEQUENCE QASEQ;

CREATE SEQUENCE QASEQ;
CREATE TABLE QABOARD(
	QA_ID NUMBER PRIMARY KEY,
	QA_TITLE VARCHAR2(1000) NOT NULL,
	QA_CONTENT VARCHAR2(4000) NOT NULL,
	QA_REGDATE DATE NOT NULL,
	QA_VIEW_CNT NUMBER,
	QA_REPLY_CNT NUMBER,
	MEMBER_ID NUMBER CONSTRAINT QABOARD_FK_MEMID REFERENCES MEMBER(MEMBER_ID)
);

SELECT * FROM QABOARD;

INSERT INTO QABOARD VALUES
(QASEQ.NEXTVAL,'첫번째 글','1번글입니다',SYSDATE,0,0,1);










