package com.UTC.dto;

import java.util.Date;

public class QACommentDto {
//	COMMENT_ID NUMBER NOT NULL, --댓글번호
//	GROUPNO NUMBER NOT NULL, --그룹번호
//	GROUPSQ NUMBER NOT NULL, --시퀀스그룹번호
//	TITLETAB NUMBER NOT NULL, --답변
//	MEMBER_ID NUMBER NOT NULL, -- 회원번호
//	COMMENT_CONTENT VARCHAR2(2000) NOT NULL, --댓글내용
//	REGDATE DATE NOT NULL, --댓글쓴날짜
	
	private int qacomment_id;
	private int qagroupno;
	private int qagroupsq;
	private int qatitletab;
	private String member_name;
	private int member_id;
	private int qa_id;
	private String qacomment_content;
	private String qaregdate;
	
	
	public QACommentDto() {
		
	}

	public QACommentDto(int qacomment_id, int qagroupno, int qagroupsq, int qatitletab, String member_name,
			int member_id, int qa_id, String qacomment_content, String qaregdate) {
		super();
		this.qacomment_id = qacomment_id;
		this.qagroupno = qagroupno;
		this.qagroupsq = qagroupsq;
		this.qatitletab = qatitletab;
		this.member_name = member_name;
		this.member_id = member_id;
		this.qa_id = qa_id;
		this.qacomment_content = qacomment_content;
		this.qaregdate = qaregdate;
	}

	public int getQacomment_id() {
		return qacomment_id;
	}

	public void setQacomment_id(int qacomment_id) {
		this.qacomment_id = qacomment_id;
	}

	public int getQagroupno() {
		return qagroupno;
	}

	public void setQagroupno(int qagroupno) {
		this.qagroupno = qagroupno;
	}

	public int getQagroupsq() {
		return qagroupsq;
	}

	public void setQagroupsq(int qagroupsq) {
		this.qagroupsq = qagroupsq;
	}

	public int getQatitletab() {
		return qatitletab;
	}

	public void setQatitletab(int qatitletab) {
		this.qatitletab = qatitletab;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public int getQa_id() {
		return qa_id;
	}

	public void setQa_id(int qa_id) {
		this.qa_id = qa_id;
	}

	public String getQacomment_content() {
		return qacomment_content;
	}

	public void setQacomment_content(String qacomment_content) {
		this.qacomment_content = qacomment_content;
	}

	public String getQaregdate() {
		return qaregdate;
	}

	public void setQaregdate(String qaregdate) {
		this.qaregdate = qaregdate;
	}

	

	
	
}
