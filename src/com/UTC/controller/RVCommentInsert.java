package com.UTC.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.UTC.dao.RVCommentDao;
import com.UTC.dto.RVCommentDto;
import com.UTC.dto.MemberDto;
import com.UTC.helper.Helper;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/RVCommentInsert.do")
public class RVCommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RVCommentInsert() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//response.setContentType("text/html; charset=UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		//세션 객체 생성(세션스코프 사용)
		HttpSession session = request.getSession();

		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
				
		if(command.equals("insertRVComment")) {

		Helper helper = new Helper();
		
		//json형식으로 받는다.
		response.setContentType("application/json");
		System.out.println("rv test1");
		helper = Helper.getInstance(request, response);
		
		int rv_id = helper.getInt("rv_id");
//		System.out.println("rv test1");
		String rvcomment_content = helper.getString("rvcomment_content");
		System.out.println("rv test2");
		//로그인을 했으므로 세션에 있는 값으로 대체함
		MemberDto loginInfo = (MemberDto) session.getAttribute("dto");
		String member_name = loginInfo.getMember_name();
		int member_id = loginInfo.getMember_id();
		System.out.println("rv test3");

		RVCommentDto rdto = new RVCommentDto();
		rdto.setRv_id(rv_id);
		rdto.setRvcomment_content(rvcomment_content);
		rdto.setMember_name(member_name);
		rdto.setMember_id(member_id);
		RVCommentDao rdao = new RVCommentDao();
		System.out.println("rv test4");
//		try {
////			QACommentDao cdao = new QACommentDao();
//			cdao.insertQAComment(cdto);
//			System.out.println(cdto.getQacomment_content());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		//QACommentDto item = null;
		
		try {
			System.out.println("rv test5");
			rdao.insertRVComment(rdto);

		} catch (Exception e) {
			
		} 
//		
////		// 줄바꿈이나 HTML특수문자에 대한 처리
//		item.setMember_name(helper.convertHtmlTag(item.getMember_name()));
//		item.setQacomment_content(helper.convertHtmlTag(item.getQacomment_content()));
	
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", rdto);
		
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		} 
	}
	
	
	private void alert(String msg,String url,HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter out= response.getWriter();
			String resultHtml="<script type='text/javascript'>"
								+ "alert('"+msg+"');"
								+ "location.href='"+url+"';"
							+ "</script>";
			
			out.print(resultHtml);
			
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("alert메소드오류");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
