package com.UTC.dto;

import java.util.Date;

public class NoticeDto {
	
	private int nt_id;
	private String nt_title;
	private String nt_content;
	private int nt_view_cnt;
	private int member_id;
	private Date nt_regdate;
	private String member_name;
	private String member_email;
	private String member_pw;
	private String member_role;
	
	
	
	
	
	
	public NoticeDto(int nt_id, String nt_title, String nt_content) {
		super();
		this.nt_id = nt_id;
		this.nt_title = nt_title;
		this.nt_content = nt_content;
	}


	public NoticeDto(String nt_title, String nt_content, int member_id) {
		super();
		this.nt_title = nt_title;
		this.nt_content = nt_content;
		this.member_id = member_id;
	}


	public NoticeDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public NoticeDto(int nt_id, String nt_title, String nt_content, int nt_view_cnt, int member_id, Date nt_regdate,
			String member_name, String member_email, String member_pw, String member_role) {
		super();
		this.nt_id = nt_id;
		this.nt_title = nt_title;
		this.nt_content = nt_content;
		this.nt_view_cnt = nt_view_cnt;
		this.member_id = member_id;
		this.nt_regdate = nt_regdate;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_pw = member_pw;
		this.member_role = member_role;
	}



	public int getNt_id() {
		return nt_id;
	}



	public void setNt_id(int nt_id) {
		this.nt_id = nt_id;
	}



	public String getNt_title() {
		return nt_title;
	}



	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}



	public String getNt_content() {
		return nt_content;
	}



	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}



	public int getNt_view_cnt() {
		return nt_view_cnt;
	}



	public void setNt_view_cnt(int nt_view_cnt) {
		this.nt_view_cnt = nt_view_cnt;
	}



	public int getMember_id() {
		return member_id;
	}



	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}



	public Date getNt_regdate() {
		return nt_regdate;
	}



	public void setNt_regdate(Date nt_regdate) {
		this.nt_regdate = nt_regdate;
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
