package com.UTC.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.UTC.dao.RVCommentDao;
import com.UTC.dto.RVCommentDto;
import com.UTC.helper.Helper;

/**
 * Servlet implementation class CommentEdit
 */
@WebServlet("/RVCommentEdit.do")
public class RVCommentEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	Helper helper;
	RVCommentDao rdao;
	
    public RVCommentEdit() {
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
		int rvcomment_id = helper.getInt("rvcomment_id");
		System.out.println("rvcomment_id >> " + rvcomment_id);
		if(rvcomment_id == 0) {
			session.invalidate();
			System.out.println("댓글 번호가 없습니다.");
		}
		
		RVCommentDto rdto = new RVCommentDto();
		RVCommentDao rdao = new RVCommentDao();
		rdto.setRvcomment_id(rvcomment_id);
		
		RVCommentDto readComment = null;
		
		try {
			readComment = rdao.selectRVComment(rdto);
			System.out.println("readComment >> " + readComment);
		} catch (Exception e) {
			e.printStackTrace();
		
		}
		
		request.setAttribute("rvcomment", readComment);
		request.setAttribute("rvcomment_id", rvcomment_id);
		
		dispatch("rvcomment_edit.jsp", request, response);
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
