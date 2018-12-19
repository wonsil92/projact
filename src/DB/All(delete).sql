
--7. QACOMMENT 테이블-----------------------------------------------------------------------------------------------


DROP SEQUENCE QACOMMENTSQ;
DROP SEQUENCE QAGROUPNOSQ;
DROP TABLE QACOMMENT;



--6. RVCOMMENT 테이블----------------------------------------------------------------------------------------------

DROP SEQUENCE RVCOMMENTSQ;
DROP SEQUENCE RVGROUPNOSQ;

DROP TABLE RVCOMMENT;




--MAKEBOARD 5--------------------------------------------------------------------------------------------

DROP SEQUENCE MAKESEQ;

DROP TABLE MAKEBOARD;



--NOTICE    4-----------------------------------------------------------------------------------------------------------
                           
DROP TABLE NOTICE;
DROP SEQUENCE NTSEQ;


--RVDOCUMENT   3-------------------------------------------------------------------------------------------------

DROP SEQUENCE RVSEQ;
DROP TABLE RVDOCUMENT;
                           --게시판 번호 시퀀스 (PRIMARY KEY)



--QABOARD   2--------------------------------------------------------------------------------------------------

DROP SEQUENCE QASEQ;
DROP TABLE QABOARD;



--MEMBER   1-------------------------------------------------------------------------------------

DROP SEQUENCE MEMBERSEQ;
DROP TABLE MEMBER;



