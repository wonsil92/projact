package com.UTC.helper;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Helper {
	
	public static Helper current;
	public static Helper getInstance(HttpServletRequest request, HttpServletResponse response) {
		
		if(current == null) {
			current = new Helper();
		}
		current.init(request, response);
		return current;
	}
	
	private static final String DOMAIN = "localhost";
	private HttpServletRequest request;
	private HttpServletResponse response;
	private HttpSession session;
	
	public void init(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.session = request.getSession();
		this.session.setMaxInactiveInterval(60*60*24);
		
		try {
			this.request.setCharacterEncoding("utf-8");
			this.response.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//key에는 게시판id, 회원id
	public void setCookie (String key, String value, int timeout) {
		try {
			value = URLEncoder.encode(value, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Cookie cookie = new Cookie(key, value);
		cookie.setPath("/");
		cookie.setDomain(DOMAIN);
		
		if(timeout > -1) {
			cookie.setMaxAge(timeout);
		}
		this.response.addCookie(cookie);
		
	}
	
	public String getCookie(String key, String defaultValue) {
		String result = defaultValue;
		
		Cookie[] cookies = this.request.getCookies();
		
		if(cookies != null) {
			for(int i = 0; i < cookies.length; i++) {
				String cookieName = cookies[i].getName();
				if(cookieName.equals(key)) {
					result = cookies[i].getValue();
				try {
					result = URLDecoder.decode(result, "utf-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				break;
			}			//end if
		}				//end for
	}					//end if
	
	return result;
	}	
	
	public String getCookie(String key){
		return this.getCookie(key,null);
	}
	
	
	public void setSession(String key, Object value) {
		this.session.setAttribute(key, value);
	}
	
	public Object getSession(String key, Object defaultValue) {
		Object value = this.session.getAttribute(key);
		
		if(value == null) {
			value = defaultValue;
		}
		return value;
	}
	
	public Object getSession(String key){
		return this.getSession(key,null);
	}
	
	/*
	 * 결과 메시지를 JSON으로 출력한다.
	 */
	public void printJsonRt(String rt) {
		Map<String, String> data = new HashMap<String, String>();
		data.put("rt", rt);
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			mapper.writeValue(response.getWriter(), data);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*
	 * 문자열에 포함된 HTML태그와 줄바꿈 문자를 HTML 특수문자 형태로 변환
	 */
	
	public String convertHtmlTag(String content) {
		// 변경 결과를 저장할 객체
		StringBuilder builder = new StringBuilder();
		
		// 문자열에 포함된 한 글자
		char chrBuff;

		// 글자 수 만큼 반복한다.
		for (int i = 0; i < content.length(); i++) {
			// 한 글자를 추출
			chrBuff = (char) content.charAt(i);

			// 특수문자 형태에 부합할 경우 변환하여 builder에 추가
			// 그렇지 않을 경우 원본 그대로 builder에 추가
			switch (chrBuff) {
			case '<':
				builder.append("&lt;");
				break;
			case '>':
				builder.append("&gt;");
				break;
			case '&':
				builder.append("&amp;");
				break;
			case '\n':
				builder.append("&lt;br/&gt;");
				break;
			default:
				builder.append(chrBuff);
			}
		}
		
		// 조립된 결과를 문자열로 변환해서 리턴한다.
		return builder.toString();
	}
	
	
	public String getString(String fieldName, String defaultValue){
		String result = defaultValue;
		
		String param = this.request.getParameter(fieldName);
		
		if(param !=null){
			param=param.trim();
			if(!param.equals("")){
				result=param;
			}
		}
		return result;
	}
	
	public int getInt(String fieldName, int defaultValue){
		int result= defaultValue;
		String param =this.getString(fieldName, null);
	
	
	try{
		result = Integer.parseInt(param);
	}catch(NumberFormatException e){
		e.printStackTrace();
	}
	return result;
	}
	
	
	public String getString(String fieldName){
		return this.getString(fieldName,null);
	}
	
	public int getInt(String fieldName){
	return this.getInt(fieldName,0);
	}
}

