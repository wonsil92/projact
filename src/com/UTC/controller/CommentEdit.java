package com.UTC.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.UTC.dao.QACommentDao;
import com.UTC.dto.QACommentDto;
import com.UTC.helper.Helper;

/**
 * Servlet implementation class CommentEdit
 */
@WebServlet("/CommentEdit.do")
public class CommentEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	Helper helper;
	QACommentDao cdao;
	
    public CommentEdit() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//세션 객체 생성
		HttpSession session = request.getSession();
		helper = Helper.getInstance(request, response);
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		
		if(command.equals("updateQAComment")) {
		
		//수정할 글 번호 파라미터 받기
		int qacomment_id = helper.getInt("qacomment_id");
		System.out.println("qacomment_id >> " + qacomment_id);
		if(qacomment_id == 0) {
			session.invalidate();
			System.out.println("댓글 번호가 없습니다.");
		}
		
		QACommentDto cdto = new QACommentDto();
		QACommentDao cdao = new QACommentDao();
		cdto.setQacomment_id(qacomment_id);
		
		QACommentDto readComment = null;
		
		try {
			readComment = cdao.selectQAComment(cdto);
			System.out.println("readComment >> " + readComment);
		} catch (Exception e) {
			e.printStackTrace();
		
		}
		
		request.setAttribute("qacomment", readComment);
		request.setAttribute("qacomment_id", qacomment_id);
		
		dispatch("comment_edit.jsp", request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);

		dispatch.forward(request, response);
	}

}
