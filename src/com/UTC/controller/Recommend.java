package com.UTC.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.UTC.dao.RVdocumentDao;
import com.UTC.dto.MemberDto;
import com.UTC.dto.RVdocumentDto;
import com.UTC.helper.Helper;

@WebServlet("/Recommend.do")
public class Recommend extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public Recommend() {
        super();
    }
    
   // private final String DOMAIN = "localhost";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		Helper helper = Helper.getInstance(request, response);
		RVdocumentDao rdao = new RVdocumentDao();
		HttpSession session = request.getSession();
		
		int rv_id = helper.getInt("rv_id");
		System.out.println("rv_id = " + rv_id);
		String result = helper.getString("result");
		System.out.println("result >> " + result);
		//String division = "division";
		
		RVdocumentDto rdto = new RVdocumentDto();
		rdto.setRv_id(rv_id);
		
		if(result.equals("Y")) {
			rdto.setRv_reco_cnt(1);
		} else {
			System.out.println("올바르지 않음");
		}
		
		MemberDto logininfo = (MemberDto) session.getAttribute("dto");
		int member_id = logininfo.getMember_id();
//		if(member_id == 0) {
//			alert("로그인 후 이용하실 수 있습니다.", "SemiProjectServlet.do?command=RVselectOne&rv_id="+rv_id, request, response);
//		}
		
		request.setAttribute("member_id", member_id);
		request.setAttribute("rv_id", rv_id);
		
		String cookieKey = "rv_id" + "_" + rv_id + "_" + member_id + "_" + 1;
		System.out.println("cookieKey >> " + cookieKey);
		String cookieVar = helper.getCookie(cookieKey);
		System.out.println("cookieVar >> " + cookieVar);
		
		try {
			if(cookieVar == null) {
				rdao.updateRecommend(rdto);
				helper.setCookie(cookieKey, "Y", 365*60*60*2);
				alert("추천하셨습니다.", "SemiProjectServlet.do?command=RVselectOne&rv_id="+rv_id, request, response);
			} else {
				alert("이미 추천하셨습니다.", "SemiProjectServlet.do?command=RVselectOne&rv_id="+rv_id, request, response);
			}
		} catch (Exception e) {
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void alert(String msg, String url, HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			String resultHtml = "<script type='text/javascript'>" + "alert('" + msg + "');" + "location.href='" + url
					+ "';" + "</script>";

			out.print(resultHtml);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("alert메소드오류");
		}
	}


}
