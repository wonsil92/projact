package com.UTC.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.UTC.dao.QACommentDao;
import com.UTC.dto.MemberDto;
import com.UTC.dto.QACommentDto;
import com.UTC.helper.Helper;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/CommentEditOk.do")
public class CommentEditOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Helper helper;
	
    public CommentEditOk() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=UTF-8");
		
		helper = Helper.getInstance(request, response);
		
		//세션에서 값 가져오기
		MemberDto logininfo = (MemberDto)session.getAttribute("dto");
		int member_id = logininfo.getMember_id();
		String qacomment_content = helper.getString("qacomment_content");
		int qacomment_id = helper.getInt("qacomment_id"); 
		String member_name = helper.getString("member_name");
		
		if(qacomment_id == 0) {
			System.out.println("댓글 번호가 없습니다.");
		}
		
		QACommentDto cdto = new QACommentDto();
		cdto.setQacomment_id(qacomment_id);
		cdto.setMember_id(member_id);
		cdto.setMember_name(member_name);
		cdto.setQacomment_content(qacomment_content);
		System.out.println("qacomment_content >> " + qacomment_content);
		System.out.println("qacomment_id >> " + qacomment_id);
		System.out.println("member_id >> " + member_id);
		
		QACommentDto item = null;
		
		QACommentDao cdao = new QACommentDao();
		
		try {
			cdao.updateQAComment(cdto);
			item = cdao.selectQAComment(cdto);
			System.out.println("item id "+item.getQacomment_id());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		item.setMember_name(helper.convertHtmlTag(item.getMember_name()));
		item.setQacomment_content(helper.convertHtmlTag(item.getQacomment_content()));
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", item);

		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
