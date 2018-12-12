package com.UTC.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.UTC.dao.QACommentDao;
import com.UTC.dto.QACommentDto;
import com.UTC.helper.Helper;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/CommentList.do")
public class CommentList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public CommentList() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		//세션 객체 생성
		HttpSession session = request.getSession();
		QACommentDao qacommentDao = new QACommentDao();
		
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		
		if(command.equals("selectAllQAComment")) {
			
			Helper helper = new Helper();
			
			response.setContentType("application/json");
			helper = Helper.getInstance(request, response);
			
			//파라미터 받기
			int qa_id = helper.getInt("qa_id");
			System.out.println("qa_id = " + qa_id);
			
			if(qa_id == 0) {
				System.out.println("게시물 번호가 없습니다.");
			}
			
			//파라미터 묶기
			QACommentDto commentDto = new QACommentDto();
			commentDto.setQa_id(qa_id);
			
			List<QACommentDto> item = new ArrayList<QACommentDto>();
			
			try {
			item = qacommentDao.selectQACommentList(commentDto);
			} catch (Exception e) {
			
			}
			
			for(int i = 0; i < item.size(); i++) {
				QACommentDto temp = item.get(i);
				temp.setMember_name(helper.convertHtmlTag(temp.getMember_name()));
				temp.setQacomment_content(helper.convertHtmlTag(temp.getQacomment_content()));
				System.out.println("temp >> " + temp.getQacomment_content());
			}
			
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("rt", "OK");		//map
			data.put("item", item);		//entity
			
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(response.getWriter(), data);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
