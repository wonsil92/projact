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

import com.UTC.dao.QACommentDao;
import com.UTC.dto.QACommentDto;
import com.UTC.dto.MemberDto;
import com.UTC.helper.Helper;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/CommentInsert.do")
public class CommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CommentInsert() {
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
				
		if(command.equals("insertQAComment")) {

		Helper helper = new Helper();
		
		//json형식으로 받는다.
		response.setContentType("application/json");
		
		helper = Helper.getInstance(request, response);
		
		int qa_id = helper.getInt("qa_id");
		//System.out.println(qa_id);
		String qacomment_content = helper.getString("qacomment_content");
		//로그인을 했으므로 세션에 있는 값으로 대체함
		MemberDto loginInfo = (MemberDto) session.getAttribute("dto");
		String member_name = loginInfo.getMember_name();
		int member_id = loginInfo.getMember_id();

		QACommentDto cdto = new QACommentDto();
		cdto.setQa_id(qa_id);
		cdto.setQacomment_content(qacomment_content);
		cdto.setMember_name(member_name);
		cdto.setMember_id(member_id);
		QACommentDao cdao = new QACommentDao();
//		try {
////			QACommentDao cdao = new QACommentDao();
//			cdao.insertQAComment(cdto);
//			System.out.println(cdto.getQacomment_content());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		//QACommentDto item = null;
		try {
			cdao.insertQAComment(cdto);

		} catch (Exception e) {
			
		} 
//		
////		// 줄바꿈이나 HTML특수문자에 대한 처리
//		item.setMember_name(helper.convertHtmlTag(item.getMember_name()));
//		item.setQacomment_content(helper.convertHtmlTag(item.getQacomment_content()));
	
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", cdto);
		
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
