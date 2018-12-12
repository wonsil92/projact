package com.UTC.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.UTC.dao.QACommentDao;
import com.UTC.dto.MemberDto;
import com.UTC.dto.QACommentDto;
import com.UTC.helper.Helper;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/CommentDeleteOk.do")
public class CommentDeleteOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	Helper helper;
	
    public CommentDeleteOk() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		helper = Helper.getInstance(request, response);
		QACommentDao cdao = new QACommentDao();
		
		int qacomment_id = helper.getInt("qacomment_id");
		System.out.println("qacomment_id >> " + qacomment_id);
		
		if(qacomment_id == 0) {
			System.out.println("댓글 번호가 없습니다.");
		}
		
		QACommentDto cdto = new QACommentDto();
		cdto.setQacomment_id(qacomment_id);
		
		MemberDto logininfo = (MemberDto)helper.getSession("logininfo");
		if(logininfo != null) {
			cdto.setMember_id(logininfo.getMember_id());
		}
		
		try {
		cdao.deleteQAComment(cdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("qacomment_id", qacomment_id);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
