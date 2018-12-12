package com.UTC.dto;


public class RVCommentDto {
//	COMMENT_ID NUMBER NOT NULL, --댓글번호
//	GROUPNO NUMBER NOT NULL, --그룹번호
//	GROUPSQ NUMBER NOT NULL, --시퀀스그룹번호
//	TITLETAB NUMBER NOT NULL, --답변
//	MEMBER_ID NUMBER NOT NULL, -- 회원번호
//	COMMENT_CONTENT VARCHAR2(2000) NOT NULL, --댓글내용
//	REGDATE DATE NOT NULL, --댓글쓴날짜
	
	private int rvcomment_id;
	private int rvgroupno;
	private int rvgroupsq;
	private int rvtitletab;
	private String member_name;
	private int member_id;
	private int rv_id;
	private String rvcomment_content;
	private String rvregdate;
	
	
	public RVCommentDto() {
		
	}
	
	public RVCommentDto(int rvcomment_id, int rvgroupno, int rvgroupsq, int rvtitletab, String member_name,
			int member_id, int rv_id, String rvcomment_content, String rvregdate) {
		super();
		this.rvcomment_id = rvcomment_id;
		this.rvgroupno = rvgroupno;
		this.rvgroupsq = rvgroupsq;
		this.rvtitletab = rvtitletab;
		this.member_name = member_name;
		this.member_id = member_id;
		this.rv_id = rv_id;
		this.rvcomment_content = rvcomment_content;
		this.rvregdate = rvregdate;
	}




	public int getRvcomment_id() {
		return rvcomment_id;
	}




	public void setRvcomment_id(int rvcomment_id) {
		this.rvcomment_id = rvcomment_id;
	}




	public int getRvgroupno() {
		return rvgroupno;
	}




	public void setRvgroupno(int rvgroupno) {
		this.rvgroupno = rvgroupno;
	}




	public int getRvgroupsq() {
		return rvgroupsq;
	}




	public void setRvgroupsq(int rvgroupsq) {
		this.rvgroupsq = rvgroupsq;
	}




	public int getRvtitletab() {
		return rvtitletab;
	}




	public void setRvtitletab(int rvtitletab) {
		this.rvtitletab = rvtitletab;
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




	public int getRv_id() {
		return rv_id;
	}




	public void setRv_id(int rv_id) {
		this.rv_id = rv_id;
	}




	public String getRvcomment_content() {
		return rvcomment_content;
	}




	public void setRvcomment_content(String rvcomment_content) {
		this.rvcomment_content = rvcomment_content;
	}




	public String getRvregdate() {
		return rvregdate;
	}

	public void setRvregdate(String rvregdate) {
		this.rvregdate = rvregdate;
	}




	
}
