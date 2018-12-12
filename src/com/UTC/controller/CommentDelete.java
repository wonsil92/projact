package com.UTC.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.UTC.dao.QACommentDao;
import com.UTC.dto.MemberDto;
import com.UTC.dto.QACommentDto;
import com.UTC.helper.Helper;

@WebServlet("/CommentDelete.do")
public class CommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	Helper helper;
	
    public CommentDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		helper = Helper.getInstance(request, response);
		QACommentDao cdao = new QACommentDao();
		
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		
		int qacomment_id = helper.getInt("qacomment_id");
		if(qacomment_id == 0) {
			System.out.println("댓글 번호가 없습니다.");
		}
		
		QACommentDto cdto = new QACommentDto();
		cdto.setQacomment_id(qacomment_id);
		
		//로그인 한 경우 세션에서 값 받아옴
		MemberDto logininfo = (MemberDto)helper.getSession("logininfo");
		if(logininfo != null) {
			cdto.setMember_id(logininfo.getMember_id());
		}
		
		dispatch("comment_delete.jsp", request, response);
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
