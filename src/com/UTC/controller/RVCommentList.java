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
import com.UTC.dao.RVCommentDao;

import com.UTC.dto.RVCommentDto;
import com.UTC.helper.Helper;
import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/RVCommentList.do")
public class RVCommentList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public RVCommentList() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		//세션 객체 생성
		HttpSession session = request.getSession();
		RVCommentDao rvcommentDao = new RVCommentDao();
		
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		
		if(command.equals("selectAllRVComment")) {
			
			Helper helper = new Helper();
			
			response.setContentType("application/json");
			helper = Helper.getInstance(request, response);
			
			//파라미터 받기
			int rv_id = helper.getInt("rv_id");
			System.out.println("rv_id = " + rv_id);
			
			if(rv_id == 0) {
				System.out.println("게시물 번호가 없습니다.");
			}
			
			//파라미터 묶기
			RVCommentDto rvcommentDto = new RVCommentDto();
			rvcommentDto.setRv_id(rv_id);
			
			List<RVCommentDto> item = new ArrayList<RVCommentDto>();
			
			try {
			item = rvcommentDao.selectRVCommentList(rvcommentDto);
			} catch (Exception e) {
			
			}
			
			for(int i = 0; i < item.size(); i++) {
				RVCommentDto temp = item.get(i);
				temp.setMember_name(helper.convertHtmlTag(temp.getMember_name()));
				temp.setRvcomment_content(helper.convertHtmlTag(temp.getRvcomment_content()));
				System.out.println("temp >> " + temp.getRvcomment_content());
			}
			
			Map<String, Object> data = new HashMap<String, Object>();
			data.put("rt", "OK");		//map
			data.put("item", item);		//entity
			
			ObjectMapper mapper = new ObjectMapper();
			mapper.writeValue(response.getWriter(), data);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
