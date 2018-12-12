package com.UTC.dto;

import java.util.Date;

public class MakeBoardDto {

	private int make_id;
	private String make_title;
	private String make_content;
	private Date make_regdate;
	private int member_id;
	private String member_name;
	private String member_email;
	private String member_pw;
	private String member_role;
	
	private int r;//게시글 정렬 rownum 최신순 뽑기

	public MakeBoardDto(int make_id, String make_title, String make_content, Date make_regdate, int member_id,
			String member_name, String member_email, String member_pw, String member_role, int r) {
		super();
		this.make_id = make_id;
		this.make_title = make_title;
		this.make_content = make_content;
		this.make_regdate = make_regdate;
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_pw = member_pw;
		this.member_role = member_role;
		this.r = r;
	}

	public MakeBoardDto() {
		super();
	}

	public MakeBoardDto(int make_id, String make_title, String make_content) {
		super();
		this.make_id = make_id;
		this.make_title = make_title;
		this.make_content = make_content;
	}

	public MakeBoardDto(int make_id) {
		super();
		this.make_id = make_id;
	}

	public MakeBoardDto(String make_title, String make_content, int member_id) {
		super();
		this.make_title = make_title;
		this.make_content = make_content;
		this.member_id = member_id;
	}

	public int getMake_id() {
		return make_id;
	}

	public void setMake_id(int make_id) {
		this.make_id = make_id;
	}

	public String getMake_title() {
		return make_title;
	}

	public void setMake_title(String make_title) {
		this.make_title = make_title;
	}

	public String getMake_content() {
		return make_content;
	}

	public void setMake_content(String make_content) {
		this.make_content = make_content;
	}

	public Date getMake_regdate() {
		return make_regdate;
	}

	public void setMake_regdate(Date make_regdate) {
		this.make_regdate = make_regdate;
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
