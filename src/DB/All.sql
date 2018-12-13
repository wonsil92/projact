DROP TABLE RVCOMMENT;
														--MEMBER	1
DROP TABLE MEMBER;
DROP SEQUENCE MEMBERSEQ;

CREATE SEQUENCE MEMBERSEQ;

CREATE TABLE MEMBER(
	MEMBER_ID NUMBER NOT NULL,
	MEMBER_NAME VARCHAR2(20) NOT NULL,
	MEMBER_EMAIL VARCHAR2(40) NOT NULL,
	MEMBER_PW VARCHAR2(30) NOT NULL,
	MEMBER_ROLE VARCHAR2(20) NOT NULL,
	CONSTRAINT MEMBER_PK_ID PRIMARY KEY(MEMBER_ID),
	CONSTRAINT MEMBER_UQ_EMAIL UNIQUE(MEMBER_EMAIL)
);

INSERT INTO MEMBER
VALUES(MEMBERSEQ.NEXTVAL,'관리자','A@A','123','ADMIN');

INSERT INTO MEMBER
VALUES(MEMBERSEQ.NEXTVAL,'홍길동','B@B','123','USER');

SELECT * FROM MEMBER ORDER BY MEMBER_ID DESC;



																--QABOARD	2
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

--RVDOCUMENT	3

DROP TABLE RVDOCUMENT;
DROP SEQUENCE RVSEQ;

									--게시판 번호 시퀀스 (PRIMARY KEY)

CREATE SEQUENCE RVSEQ;


CREATE TABLE RVDOCUMENT(
	RV_ID NUMBER PRIMARY KEY, --게시판번호
	RV_TITLE VARCHAR2(1000) NOT NULL, --제목
	FILE_ID VARCHAR2(4000) NOT NULL, --파일
	RV_VIEW_CNT NUMBER DEFAULT 0, --조회수
	RV_RECO_CNT NUMBER DEFAULT 0, --추천수
	RV_REPLY_CNT NUMBER DEFAULT 0,--댓글수
	MEMBER_ID NUMBER NOT NULL, --회원번호
	RV_CONTENT VARCHAR2(4000) NOT NULL, --글내용
	RV_REGDATE DATE NOT NULL, --작성일
	CONSTRAINT RVBOARD_FK_MEMBER_ID  FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
);

--1
INSERT INTO RVDOCUMENT
VALUES(RVSEQ.NEXTVAL,'1st', '<!DOCTYPE html><html><head><title></title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"><script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script><script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713"></script></head><body><strong style="color:; font-size:25px;">Daum Map API </strong><button name="" type="submit" class="btn btn-primary">click</button><br><br><div id="map" style="width:500px;height:400px;"></div><script>var container = document.getElementById("map");var options = {center: new daum.maps.LatLng(33.450701, 126.570667),level: 3};var map = new daum.maps.Map(container, options);</script></body><html>',0,0,0,1,'글내용입니다',SYSDATE);
--2
INSERT INTO RVDOCUMENT
VALUES(RVSEQ.NEXTVAL,'2st','<!DOCTYPE html><html><head><title></title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"><script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script></head><body><strong style="color:red; font-size:20px;">자리 배치표</strong><br><br><table class="table table-striped"><thead><th>thead1</th><th>thead2</th><th>thead3</th><th>thead4</th><thead><tbody><tr><tr><td>tbody1</td><td>tbody2</td><td>tbody3</td><td>tbody4</td></tr><tr><td>tbody1</td><td>tbody2</td><td>tbody3</td><td>tbody4</td></tr><tr><td>tbody1</td><td>tbody2</td><td>tbody3</td><td>tbody4</td></tr></tr></tbody></table></body><html>',0,0,0,1,'글내용입니다',SYSDATE);
--3
INSERT INTO RVDOCUMENT
VALUES(RVSEQ.NEXTVAL,'3st','<!DOCTYPE html><html><head><title></title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"><script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script></head><body><strong style="color:blue; font-size:20px;">Download Progress : </strong><progress max="100" value="20" class=""></progress></body><html>',0,0,0,1,'글내용입니다',SYSDATE);
--4
INSERT INTO RVDOCUMENT
VALUES(RVSEQ.NEXTVAL,'4st','<!DOCTYPE html><html><head><title></title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"><script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713"></script><script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script></head><body><big style="color :skyblue">Maroon5 - What Lovers do</big><audio controls><source src="song/Maroon5.mp3" type="audio/mp3"></audio></body><html>',0,0,0,1,'글내용입니다',SYSDATE);
--5
INSERT INTO RVDOCUMENT
VALUES(RVSEQ.NEXTVAL,'5st','<!DOCTYPE html><html><head><title></title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"><script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script></head><body><strong style="color:; font-size:25px;">Login</strong><br><br><input type="text" name="" placeholder="" class="form-control" /><strong style="color:; font-size:25px;">Password</strong><br><br><input type="text" name="" placeholder="" class="form-control" /></body><html>',0,0,0,1,'글내용입니다',SYSDATE);
--6
INSERT INTO RVDOCUMENT
VALUES(RVSEQ.NEXTVAL,'6st','<!DOCTYPE html><html><head><title></title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"><script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script></head><body><h2 style="color : ;">Select One!</h2><hr  style="height : 1px; background : silver;"><select class="form-control" name=""><option value="Value1">Option1</option><option value="Value2">Option2</option><option value="Value3">Option3</option></select></body><html>',0,0,0,1,'글내용입니다',SYSDATE);
--7
INSERT INTO RVDOCUMENT
VALUES(RVSEQ.NEXTVAL,'7st','<!DOCTYPE html><html><head><title></title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"><script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script></head><body><h2 style="color : ;">Select One!</h2><hr  style="height : 1px; background : silver;"><select class="form-control" name=""><option value="Value1">Option1</option><option value="Value2">Option2</option><option value="Value3">Option3</option></select><hr  style="height : 2px; background : gold;"><textarea rows="5" name="" placeholder="textarea" class="form-control" /></textarea></body></html>',0,0,0,1,'글내용입니다',SYSDATE);
--8
INSERT INTO RVDOCUMENT
VALUES(RVSEQ.NEXTVAL,'8st','<!DOCTYPE html><html><head><title></title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"><script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script></head><body><h6 style="color : ;">birthday</h6><input type="date" name="" class="form-control"/><br><br><h6 style="color : ;">(fe)male</h6><div class="form-check"><input type="radio" name="" value="male">male <input type="radio" name="" value="female">female</div></body><html>',0,0,0,1,'글내용입니다',SYSDATE);
--9
INSERT INTO RVDOCUMENT
VALUES(RVSEQ.NEXTVAL,'9st','<!DOCTYPE html><html><head><title></title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"><script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script></head><body><big style="color :">email</big><input type="email" name="" value="shine2303@naver.com" class="form-control" required/></body><html>',0,0,0,1,'글내용입니다',SYSDATE);
--10
INSERT INTO RVDOCUMENT
VALUES(RVSEQ.NEXTVAL,'10st','<!DOCTYPE html><html><head><title></title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"><script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713"></script><script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script></head><body><div id="map" style="width:500px;height:400px;"></div><script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a972ca802724bd143ea303f6a433713"></script><script>var container = document.getElementById("map");var options = {center: new daum.maps.LatLng(33.450701, 126.570667),level: 3};var map = new daum.maps.Map(container, options);</script><div class="form-check"><input type="checkbox" name="" value="Value">Option<input type="checkbox" name="" value="Value">Option<input type="checkbox" name="" value="Value">Option</div></body><html>',0,0,0,1,'글내용입니다',SYSDATE);

COMMIT;

select * from rvdocument;




									--NOTICE    5
									
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


								--MAKEBOARD    6
DROP TABLE MAKEBOARD;
DROP SEQUENCE MAKESEQ;

CREATE SEQUENCE MAKESEQ;
CREATE TABLE MAKEBOARD(
	MAKE_ID NUMBER PRIMARY KEY,
	MAKE_TITLE VARCHAR2(1000) NOT NULL,
	MAKE_CONTENT VARCHAR2(4000) NOT NULL,
	MAKE_REGDATE DATE NOT NULL,
	MEMBER_ID NUMBER CONSTRAINT MAKEBOARD_FK_MEMID REFERENCES MEMBER(MEMBER_ID)
);

INSERT INTO MAKEBOARD VALUES
(MAKESEQ.NEXTVAL,'첫번째 글','1번글입니다',SYSDATE,2);

INSERT INTO MAKEBOARD VALUES
(MAKESEQ.NEXTVAL,'첫번째 글','1번글입니다',SYSDATE,1);

COMMIT;


--

--7. RVCOMMENT 테이블
DROP TABLE RVCOMMENT;

DROP SEQUENCE RVMMENTSQ;
DROP SEQUENCE RVGROUPNOSQ;

CREATE SEQUENCE RVCOMMENTSQ;
CREATE SEQUENCE RVGROUPNOSQ;


CREATE TABLE RVCOMMENT(
	RVCOMMENT_ID NUMBER NOT NULL, --댓글번호
	RVGROUPNO NUMBER NOT NULL, --그룹번호
	RVGROUPSQ NUMBER NOT NULL, --시퀀스그룹번호
	RVTITLETAB NUMBER NOT NULL, --답변
	MEMBER_ID NUMBER NOT NULL, -- 회원번호
    MEMBER_NAME VARCHAR2(30) NOT NULL,
	RV_ID NUMBER NOT NULL, --QA번호
	RVCOMMENT_CONTENT VARCHAR2(2000) NOT NULL, --댓글내용
	RVREGDATE VARCHAR2(40) NOT NULL, --댓글쓴날짜
	CONSTRAINT RVCOMMENT_PK_ID PRIMARY KEY(RVCOMMENT_ID),
	CONSTRAINT RVCOMMENT_FK_MEMBER_ID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID),
	CONSTRAINT RVCOMMENT_FK_RV_ID FOREIGN KEY(RV_ID) REFERENCES RVDOCUMENT(RV_ID)
);

SELECT * FROM RVCOMMENT;
COMMIT;



--7. QACOMMENT 테이블
--그룹번호 : 게시글에 답변을 달았을 때 번호를 묶어서 관리하는 번호
--타이틀탭 : 답변 글을 한칸씩 띄어서 출력
--답변을 쓰면 부모글 밑에 들어감
--글번호, 그룹번호,제목, 작성자, 날짜
--qa게시판
drop table qacomment;

CREATE SEQUENCE QACOMMENTSQ;
CREATE SEQUENCE QAGROUPNOSQ;

CREATE TABLE QACOMMENT(
	QACOMMENT_ID NUMBER NOT NULL, --댓글번호
	QAGROUPNO NUMBER NOT NULL, --그룹번호
	QAGROUPSQ NUMBER NOT NULL, --시퀀스그룹번호
	QATITLETAB NUMBER NOT NULL, --답변
	MEMBER_ID NUMBER NOT NULL, -- 회원번호
    MEMBER_NAME VARCHAR2(30) NOT NULL,
	QA_ID NUMBER NOT NULL, --QA번호
	QACOMMENT_CONTENT VARCHAR2(2000) NOT NULL, --댓글내용
	QAREGDATE VARCHAR2(40) NOT NULL, --댓글쓴날짜
	CONSTRAINT COMMENT_PK_ID PRIMARY KEY(QACOMMENT_ID),
	CONSTRAINT COMMENT_FK_MEMBER_ID FOREIGN KEY(MEMBER_ID) REFERENCES MEMBER(MEMBER_ID),
	CONSTRAINT COMMENT_FK_QA_ID FOREIGN KEY(QA_ID) REFERENCES QABOARD(QA_ID)
);


SELECT * FROM QACOMMENT;
COMMIT;

--8. FILEUPLOAD 테이블

DROP TABLE FILEUPLOAD;
DROP SEQUENCE FILE_ID;

CREATE SEQUENCE FILE_ID;

CREATE TABLE FILEUPLOAD(
	FILE_ID NUMBER NOT NULL,
	FILE_NAME VARCHAR2(100) NOT NULL,
	FILE_DATA VARCHAR2(1000) NOT NULL,
	CONSTRAINT FILE_PK_ID PRIMARY KEY(FILE_ID)
);

SELECT * FROM FILEUPLOAD;

INSERT INTO FILEUPLOAD
VALUES(FILE_ID.NEXTVAL,'1번파일.',SYSDATE);
commit;
