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

import com.UTC.dao.RVCommentDao;
import com.UTC.dto.MemberDto;
import com.UTC.dto.RVCommentDto;
import com.UTC.helper.Helper;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/RVCommentEditOk.do")
public class RVCommentEditOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Helper helper;
	
    public RVCommentEditOk() {
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
		String rvcomment_content = helper.getString("rvcomment_content");
		int rvcomment_id = helper.getInt("rvcomment_id"); 
		String member_name = helper.getString("member_name");
		
		if(rvcomment_id == 0) {
			System.out.println("댓글 번호가 없습니다.");
		}
		
		RVCommentDto rdto = new RVCommentDto();
		rdto.setRvcomment_id(rvcomment_id);
		rdto.setMember_id(member_id);
		rdto.setMember_name(member_name);
		rdto.setRvcomment_content(rvcomment_content);
		System.out.println("rvcomment_content >> " + rvcomment_content);
		System.out.println("rvcomment_id >> " + rvcomment_id);
		System.out.println("member_id >> " + member_id);
		
		RVCommentDto item = null;
		
		RVCommentDao rdao = new RVCommentDao();
		
		try {
			rdao.updateRVComment(rdto);
			item = rdao.selectRVComment(rdto);
			System.out.println("item id "+item.getRvcomment_id());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		item.setMember_name(helper.convertHtmlTag(item.getMember_name()));
		item.setRvcomment_content(helper.convertHtmlTag(item.getRvcomment_content()));
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
