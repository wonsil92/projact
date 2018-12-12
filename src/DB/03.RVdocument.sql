
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


INSERT INTO RVDOCUMENT
VALUES(RVSEQ.NEXTVAL,'11st','ㅇㅇㅇㅇ',0,0,0,1,'글내용입니다',SYSDATE);

COMMIT;

select * from rvdocument;