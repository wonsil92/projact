package com.UTC.dto;

public class MemberDto {
/*
 * 
NOM NUMBER NOT NULL,
NAME VARCHAR2(40) NOT NULL,
PW VARCHAR2(40) NOT NULL,
EMAIL VARCHAR2(100) NOT NULL,
ROLE VARCHAR2(50) NOT NULL

 */
	private int member_id;
	private String member_name;
	private String member_email;
	private String member_pw;
	private String member_role;
	
	public MemberDto() {
		
	}
	

	public MemberDto(int member_id) {
		super();
		this.member_id = member_id;
	}



	public MemberDto(int member_id, String member_name, String member_email, String member_pw, String member_role) {
		super();
		this.member_id = member_id;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_pw = member_pw;
		this.member_role = member_role;
	}
	
	//로그인
	public MemberDto(String member_email, String member_pw) {
		this.member_email = member_email;
		this.member_pw = member_pw;
	}
	
	//회원가입
	public MemberDto(String member_name, String member_email, String member_pw, String member_role) {
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_pw = member_pw;
		this.member_role = member_role;
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
}
