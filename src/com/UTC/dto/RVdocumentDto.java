package com.UTC.dto;

import java.util.Date;

public class RVdocumentDto {
	
	

	private int rv_id;
	private String rv_title;
	private String file_id;
	private int rv_view_cnt;
	private int rv_reco_cnt;
	private int rv_reply_cnt;
	private int member_id;
	private String rv_content;
	private int comment_id;
	private Date rv_regdate;
	private String member_name;
	private String member_email;
	private String member_pw;
	private String member_role;
	
	private int r;//게시글 정렬 rownum 최신순 뽑기



	public int getR() {
		return r;
	}






	public void setR(int r) {
		this.r = r;
	}



	
	
	

	public RVdocumentDto() {
		super();
	}
	
	
	
	


	public RVdocumentDto(String rv_title,String rv_content, int member_id) {
		super();
		this.rv_title = rv_title;
		this.member_id = member_id;
		this.rv_content = rv_content;
	}






	public RVdocumentDto(int rv_id, String rv_title, String rv_content) {
		super();
		this.rv_id = rv_id;
		this.rv_title = rv_title;
		this.rv_content = rv_content;
	}



	public RVdocumentDto(String rv_title, String file_id, int member_id, String rv_content) {
		super();
		this.rv_title = rv_title;
		this.file_id = file_id;
		this.member_id = member_id;
		this.rv_content = rv_content;
	}



	public RVdocumentDto(int rv_id, String rv_title, String file_id, int rv_view_cnt, int rv_reco_cnt, int rv_reply_cnt,
			int member_id, String rv_content, int comment_id, Date rv_regdate, String member_name, String member_email,
			String member_pw, String member_role, int r) {
		super();
		this.rv_id = rv_id;
		this.rv_title = rv_title;
		this.file_id = file_id;
		this.rv_view_cnt = rv_view_cnt;
		this.rv_reco_cnt = rv_reco_cnt;
		this.rv_reply_cnt = rv_reply_cnt;
		this.member_id = member_id;
		this.rv_content = rv_content;
		this.comment_id = comment_id;
		this.rv_regdate = rv_regdate;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_pw = member_pw;
		this.member_role = member_role;
		this.r = r;
	
	}




	public int getRv_id() {
		return rv_id;
	}




	public void setRv_id(int rv_id) {
		this.rv_id = rv_id;
	}




	public String getRv_title() {
		return rv_title;
	}




	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}




	public String getFile_id() {
		return file_id;
	}




	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}




	public int getRv_view_cnt() {
		return rv_view_cnt;
	}




	public void setRv_view_cnt(int rv_view_cnt) {
		this.rv_view_cnt = rv_view_cnt;
	}




	public int getRv_reco_cnt() {
		return rv_reco_cnt;
	}




	public void setRv_reco_cnt(int rv_reco_cnt) {
		this.rv_reco_cnt = rv_reco_cnt;
	}




	public int getRv_reply_cnt() {
		return rv_reply_cnt;
	}




	public void setRv_reply_cnt(int rv_reply_cnt) {
		this.rv_reply_cnt = rv_reply_cnt;
	}




	public int getMember_id() {
		return member_id;
	}




	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}




	public String getRv_content() {
		return rv_content;
	}




	public void setRv_content(String rv_content) {
		this.rv_content = rv_content;
	}




	public int getComment_id() {
		return comment_id;
	}




	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}




	public Date getRv_regdate() {
		return rv_regdate;
	}




	public void setRv_regdate(Date rv_regdate) {
		this.rv_regdate = rv_regdate;
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



}
