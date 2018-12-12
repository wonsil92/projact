package com.UTC.dto;

import java.util.Date;

public class QABoardDto{
	private int qa_id;
	private String qa_title;
	private String qa_content;
	private Date qa_regdate;
	private int qa_view_cnt;
	private int qa_reply_cnt;
	private int member_id;
	private String member_name;
	private String member_email;
	private String member_pw;
	private String member_role;
	
	private int r;//게시글 정렬 rownum 최신순 뽑기
	
	//기본생성자
	public QABoardDto() {
		
	}
	
	//전체생성자
	public QABoardDto(int qa_id, String qa_title, String qa_content, Date qa_regdate, int qa_view_cnt, int qa_reply_cnt,
			int member_id, String member_name, String member_email, String member_pw, String member_role, int r) {
		super();
		this.qa_id = qa_id;
		this.qa_title = qa_title;
		this.qa_content = qa_content;
		this.qa_regdate = qa_regdate;
		this.qa_view_cnt = qa_view_cnt;
		this.qa_reply_cnt = qa_reply_cnt;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_pw = member_pw;
		this.member_role = member_role;
		this.r = r;
	}
	
	//게시판 수정하기(자기글만 수정되게)
	public QABoardDto(int qa_id, String qa_title, String qa_content) {
		super();
		this.qa_id = qa_id;
		this.qa_title = qa_title;
		this.qa_content = qa_content;
	}
	
	//게시판 글쓰기
	public QABoardDto(String qa_title, String qa_content, int member_id) {
		super();
		this.qa_title = qa_title;
		this.qa_content = qa_content;
		this.member_id = member_id;
	}
	
	//게시글 보기
	public QABoardDto(int qa_id) {
		this.qa_id = qa_id;
	}

	public int getQa_id() {
		return qa_id;
	}

	public void setQa_id(int qa_id) {
		this.qa_id = qa_id;
	}

	public String getQa_title() {
		return qa_title;
	}

	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public Date getQa_regdate() {
		return qa_regdate;
	}

	public void setQa_regdate(Date qa_regdate) {
		this.qa_regdate = qa_regdate;
	}

	public int getQa_view_cnt() {
		return qa_view_cnt;
	}

	public void setQa_view_cnt(int qa_view_cnt) {
		this.qa_view_cnt = qa_view_cnt;
	}

	public int getQa_reply_cnt() {
		return qa_reply_cnt;
	}

	public void setQa_reply_cnt(int qa_reply_cnt) {
		this.qa_reply_cnt = qa_reply_cnt;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_role() {
		return member_role;
	}

	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}
	
	public int getR() {
		return r;
	}
	
	public void setR(int r) {
		this.r = r;
	}
}
