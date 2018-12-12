package com.UTC.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.UTC.dao.RVCommentDao;
import com.UTC.dto.MemberDto;
import com.UTC.dto.RVCommentDto;
import com.UTC.helper.Helper;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/RVCommentDeleteOk.do")
public class RVCommentDeleteOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	Helper helper;
	
    public RVCommentDeleteOk() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		
		helper = Helper.getInstance(request, response);
		RVCommentDao rdao = new RVCommentDao();
		
		int rvcomment_id = helper.getInt("rvcomment_id");
		System.out.println("rvcomment_id >> " + rvcomment_id);
		
		if(rvcomment_id == 0) {
			System.out.println("댓글 번호가 없습니다.");
		}
		
		RVCommentDto rdto = new RVCommentDto();
		rdto.setRvcomment_id(rvcomment_id);
		
		MemberDto logininfo = (MemberDto)helper.getSession("logininfo");
		if(logininfo != null) {
			rdto.setMember_id(logininfo.getMember_id());
		}
		
		try {
		rdao.deleteRVComment(rdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rvcomment_id", rvcomment_id);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
