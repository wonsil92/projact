package com.UTC.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.UTC.dao.RVCommentDao;
import com.UTC.dto.MemberDto;
import com.UTC.dto.RVCommentDto;
import com.UTC.helper.Helper;

@WebServlet("/RVCommentDelete.do")
public class RVCommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	Helper helper;
	
    public RVCommentDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		helper = Helper.getInstance(request, response);
		RVCommentDao rdao = new RVCommentDao();
		
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		
		int rvcomment_id = helper.getInt("rvcomment_id");
		if(rvcomment_id == 0) {
			System.out.println("댓글 번호가 없습니다.");
		}
		
		RVCommentDto rdto = new RVCommentDto();
		rdto.setRvcomment_id(rvcomment_id);
		
		//로그인 한 경우 세션에서 값 받아옴
		MemberDto logininfo = (MemberDto)helper.getSession("logininfo");
		if(logininfo != null) {
			rdto.setMember_id(logininfo.getMember_id());
		}
		
		dispatch("rvcomment_delete.jsp", request, response);
		}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);

		dispatch.forward(request, response);
	}
}
