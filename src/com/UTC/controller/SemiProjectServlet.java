package com.UTC.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.UTC.dao.MakeBoardDao;
import com.UTC.dao.MemberDao;
import com.UTC.dao.NoticeDao;
import com.UTC.dao.QABoardDao;
import com.UTC.dao.RVdocumentDao;
import com.UTC.dto.MakeBoardDto;
import com.UTC.dto.MemberDto;
import com.UTC.dto.NoticeDto;
import com.UTC.dto.QABoardDto;
import com.UTC.dto.RVdocumentDto;

@WebServlet("/SemiProjectServlet.do")
public class SemiProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SemiProjectServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 세션 객체 생성(세션스코프 사용)
		HttpSession session = request.getSession();

		String command = request.getParameter("command");
		System.out.println("[" + command + "]");

		// Dao객체 생성
		MemberDao Memberdao = new MemberDao();
		QABoardDao QADao = new QABoardDao();
		RVdocumentDao reviewdao = new RVdocumentDao();
		NoticeDao noticedao = new NoticeDao();
		MakeBoardDao MakeDao = new MakeBoardDao();

		// ==========회원가입===========
		if (command.equals("insertuser")) {
			// 회원가입 정보 전달받고
			String member_name = request.getParameter("member_name");
			String member_email = request.getParameter("member_email");
			String member_pw = request.getParameter("member_pw");
			String member_role = request.getParameter("member_role");

			// 생성자에 넣어준다
			MemberDto dto = new MemberDto(member_name, member_email, member_pw, member_role);
			/*
			 * 회원가입은 INSERT = 결과값 정수 res에 쿼리문의 결과값을 저장하고
			 */

			int res = Memberdao.insertUser(dto);

			// res > 0 이면 회원가입성공
			if (res > 0) {
				alert("회원가입성공", "index.jsp", request, response);
			} else {
				alert("회원가입실패", "index.jsp", request, response);
			}

			// ==========로그인===========
		} else if (command.equals("login")) {
			// 로그인 정보 받아오고
			String email = request.getParameter("email");
			String pw = request.getParameter("pw");

			/*
			 * 쿼리문 결과값을 dto에 넣어주고 (SELECT결과값을 담아야하니까 객체에 값을 넣어줌)
			 */
			MemberDto dto = Memberdao.login(email, pw);

			if (dto != null) {
				/*
				 * 로그인 정보가 있으면 로그인 정보를 세션 객체에 담아주고 세션의 유지시간을 지정해준다.
				 */
				session.setAttribute("dto", dto);
				session.setMaxInactiveInterval(60 * 60);

				// 로그인한 사용자의 등급에 따라 각각의 페이지로 이
				if (dto.getMember_role().equals("ADMIN")) {
					dispatch("admin_main.jsp", request, response);
				} else if (dto.getMember_role().equals("USER")) {
					// response.sendRedirect("user_main.jsp");
					dispatch("user_main.jsp", request, response);
				}
			} else {
				alert("로그인실패!", "index.jsp", request, response);
			}

			// ==========로그아웃===========
		} else if (command.equals("logout")) {
			// 로그아웃 버튼 클릭시 로그인정보 삭제(세션에 있는 정보 만료)
			session.invalidate();
			alert("로그아웃 되었습니다.", "index.jsp", request, response);
		}
		// 회원정보수정(submit 눌렀을 때)
		else if (command.equals("updateuser")) {
			int member_id = ((MemberDto) (session.getAttribute("dto"))).getMember_id();
			String member_name = request.getParameter("member_name");
			String member_pw = request.getParameter("member_pw");
			String member_email = request.getParameter("member_email");
			System.out.println("1111 : " + member_id + member_name + member_pw + member_email);

			MemberDto dto = new MemberDto();
			dto.setMember_id(member_id);
			dto.setMember_name(member_name);
			dto.setMember_pw(member_pw);
			dto.setMember_email(member_email);
			System.out.println("2222: " + member_id + member_name + member_pw + member_email);
			int res = Memberdao.updateUser(dto);
			System.out.println("업데이트 성공여부 : " + res);
			if (res > 0) {
				// ********//
				session.setAttribute("dto", dto);
				session.setMaxInactiveInterval(60 * 60);
				alert("수정 성공", "SemiProjectServlet.do?command=my_page", request, response);
			} else {
				alert("수정 실패", "SemiProjectServlet.do?command=my_page", request, response);
			}
		}

		// 회원탈퇴
		else if (command.equals("deleteuser")) {
			System.out.println("delete 넘어왔는지 확인");

			int member_id = ((MemberDto) session.getAttribute("dto")).getMember_id();

			int res = Memberdao.deleteUser(member_id);

			if (res > 0) {
				session.invalidate();
				alert("탈퇴하였습니다.", "SemiProjectServlet.do?command=index", request, response);
			} else {
				alert("탈퇴 실패", "SemiProjectServlet.do?command=my_page", request, response);
			}

		}

		// 관리자 회원 정보 조회
		else if (command.equals("selectAll")) {

			List<MemberDto> list = Memberdao.selectAll();
			request.setAttribute("list", list);

			dispatch("adminContent.jsp", request, response);
		}

		// ==================페이지이동할부분=================
		// make페이지로 이동
		else if (command.equals("make_up_self")) {
			System.out.println("make로 이동");
			response.sendRedirect("make_up_self.jsp");
		}

		// 유저 마이페이지로 이동
		else if (command.equals("my_page")) {
			System.out.println("마이페이지로 이동");
			response.sendRedirect("my_page.jsp");
		}

		// 메인으로 이동
		else if (command.equals("index")) {
			System.out.println("메인으로 이동");
			response.sendRedirect("index.jsp");

			// =========Q&A게시판 리스트===========
		} else if (command.equals("qalist")) {
			int r = 1;
			//rownum null값 처리
			if(request.getParameter("r") != null) {
				r = Integer.parseInt(request.getParameter("r"));
			}
			
			//페이지 번호 찍어보기
			System.out.println(r);
		
			// 게시글들의 내용을 담기위해 list에 값을 담아주고
			List<QABoardDto> QAList = QADao.selectAll(r);
			QABoardDto countdto = QADao.qaCount();
			
			session.getAttribute("dto");
			
			/*
			 * 게시글들의 내용을 request객체에 담고 qa_list로 게시판 정보를 가지고 이동
			 */
			request.setAttribute("QAList", QAList);
			request.setAttribute("countdto", countdto); //게시글 개수
			request.setAttribute("r", r); 
			
			dispatch("qa_list.jsp", request, response);
		}

		// 로그인 걸러주는 마이페이지
		else if (command.equals("mypage")) {
			if (session.getAttribute("dto") == null) {
				alert("먼저 로그인 해주세요.", "index.jsp", request, response);
			} else {
				dispatch("my_page.jsp", request, response);
			}
		}

		else if (command.equals("QAupdateViewCount")) {
			int qa_id = Integer.parseInt(request.getParameter("qa_id"));
			int dto = QADao.QAupdateViewCount(qa_id);
			request.setAttribute("qaViewDto", dto);

			if (dto > 0) {
				dispatch("SemiProjectServlet.do?command=qadetail&qa_id=" + qa_id, request, response);
			} else {
				alert("조회수 증가 실패!", "qa_write.jsp", request, response);
			}
		}

		else if (command.equals("qadetail")) {
			// 특정 게시글을 가져오기 위해 게시글 번호를 가져오고
			int qa_id = Integer.parseInt(request.getParameter("qa_id"));

			/*
			 * 게시글의 정보를 객체에 담고 request객체에 정보를 담고 게시글의 정보를 가지고 qa_view 페이지로 이동
			 */
			QABoardDto qaViewDto = QADao.qaView(qa_id);
			request.setAttribute("qaViewDto", qaViewDto);

			dispatch("qa_view.jsp", request, response);

			// ========QA게시판 글쓰기==========
		} else if (command.equals("qawrite")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int member_id = 0; // 회원번호를 받을 변수 선언

			// 로그인 값 가져오기
			MemberDto logindto = (MemberDto) session.getAttribute("dto");
			member_id = logindto.getMember_id();

			QABoardDto dto = new QABoardDto(title, content, member_id);

			int res = QADao.qaWrite(dto);

			if (res > 0) {
				alert("글 쓰기 성공!", "SemiProjectServlet.do?command=qalist", request, response);
			} else {
				alert("제목,글 내용을 전부 입력하세요!", "qa_write.jsp", request, response);
			}
		}

		// ============게시글 수정폼으로 이동==============
		else if (command.equals("qaupdateform")) {
			int qa_id = Integer.parseInt(request.getParameter("qa_id"));

			QABoardDto dto = QADao.qaView(qa_id);

			request.setAttribute("dto", dto);
			dispatch("qa_update.jsp", request, response);
		}
		// ===========게시글 수정하기(자기게시글만)=========
		else if (command.equals("qaupdate")) {
			int qa_id = Integer.parseInt(request.getParameter("qa_id"));
			String qa_title = request.getParameter("title");
			String qa_content = request.getParameter("content");

			QABoardDto dto = new QABoardDto(qa_id, qa_title, qa_content);

			int res = QADao.qaUpdate(dto);

			if (res > 0) {
				// response.sendRedirect("SemiProjectServlet.do?command=qadetail&qa_id="+qa_id);
				alert("게시글이 수정되었습니다!", "SemiProjectServlet.do?command=qadetail&qa_id=" + qa_id, request, response);
			} else {
				dispatch("SemiProjectServlet.do?command=qaupdateform&qa_id=" + qa_id, request, response);
			}

			// 게시글 삭제
		} else if (command.equals("qadelete")) {
			int qa_id = Integer.parseInt(request.getParameter("qa_id"));

			int res = QADao.qaDelete(qa_id);

			if (res > 0) {
				// response.sendRedirect("SemiProjectServlet.do?command=qalist");
				alert("게시글이 삭제되었습니다", "SemiProjectServlet.do?command=qalist", request, response);
			} else {
				dispatch("SemiProjectServlet.do?command=qadetail&qa_id=" + qa_id, request, response);
			}
		}
		// ==========마이페이지 내 글만 보기
		else if (command.equals("listOfuser")) {
			// 세션 안에 있는 회원번호를 불러오자
			MemberDto logindto = (MemberDto) session.getAttribute("dto");
			int member_id = logindto.getMember_id();
			System.out.println("회원번호: " + member_id);

			// 그 회원번호에 해당하는 글 목록을 QAlistUser라고 담자
			List<QABoardDto> QAlistUser = QADao.selectUserQa(member_id);
			request.setAttribute("QAlistUser", QAlistUser);

			// rv글목록
			List<RVdocumentDto> RVlistUser = reviewdao.selectUserRv(member_id);
			request.setAttribute("RVlistUser", RVlistUser);

			// 현재 마이페이지에서 보이는 최근작업물목록(여기에 쿠키들어가면됩니다)
			List<MakeBoardDto> MakelistUser = MakeDao.selectUserMake(member_id);
			request.setAttribute("MakelistUser", MakelistUser);

			dispatch("mine.jsp", request, response);
		}

		// =========마페 qa삭제... 디스패치가 이상하게 돼서 걍 새로 붙임=======
		else if (command.equals("myqadelete")) {
			int qa_id = Integer.parseInt(request.getParameter("qa_id"));

			int res = QADao.qaDelete(qa_id);

			if (res > 0) {
				alert("게시글이 삭제되었습니다", "SemiProjectServlet.do?command=my_page", request, response);
			} else {
				alert("삭제 실패", "SemiProjectServlet.do?command=my_page", request, response);
			}
		}

		// ==============페이지만들기========================
		else if (command.equals("makewrite")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int member_id = 0; // 회원번호를 받을 변수 선언

			System.out.println(title);
			System.out.println(content);

			// 로그인 값 가져오기
			MemberDto logindto = (MemberDto) session.getAttribute("dto");
			member_id = logindto.getMember_id();

			MakeBoardDto dto = new MakeBoardDto(title, content, member_id);

			int res = MakeDao.makeWrite(dto);

			// 실행결과확인
			System.out.println(res);
			if (res > 0) {
				alert("저장 성공!", "SemiProjectServlet.do?command=make_up_self", request, response);
			} else {
				alert("저장 실패!", "make_up_self.jsp", request, response);
			}
		}

		// =================페이지만든거 보기===================
		else if (command.equals("makedetail")) {
			int make_id = Integer.parseInt(request.getParameter("make_id"));

			/*
			 * 게시글의 정보를 객체에 담고 request객체에 정보를 담고 게시글의 정보를 가지고 makeself 페이지로 이동
			 */
			MakeBoardDto makeViewDto = MakeDao.makeView(make_id);
			request.setAttribute("makeViewDto", makeViewDto);

			dispatch("make_up_self.jsp", request, response);

		}

		// =====내만페 이미지보이는게시글
		else if (command.equals("iMadeUser")) {
			MemberDto logindto = (MemberDto) session.getAttribute("dto");
			int member_id = logindto.getMember_id();
			System.out.println("where 뒤에 들어갈 회원번호: " + member_id);
			List<MakeBoardDto> MakelistUser = MakeDao.selectUserMake(member_id);
			request.setAttribute("MakelistUser", MakelistUser);
			// 내만페로 보내기
			dispatch("my_locker.jsp", request, response);

		}

		// =====페이지삭제=========
		else if (command.equals("makedelete")) {
			int make_id = Integer.parseInt(request.getParameter("make_id"));

			int res = MakeDao.makeDelete(make_id);

			if (res > 0) {
				// response.sendRedirect("SemiProjectServlet.do?command=qalist");
				// response.sendRedirect(request.getContextPath());
				alert("삭제되었습니다", "SemiProjectServlet.do?command=my_page", request, response);
				// 여기서 내만페로 돌아가야 하는데 방법을 모르겠네요...ㅜㅜㅜ 해당 메뉴 클릭된 상태로 돌아가야합니다
			} else {
				dispatch("SemiProjectServlet.do?command=my_page", request, response);
			}
		}

		// =============이용후기===========
		// 게시글 전체출력
		else if (command.equals("list")) {
			int r = 1;
			//rownum null값 처리
			if(request.getParameter("r") != null) {
				r = Integer.parseInt(request.getParameter("r"));
			}
			
			System.out.println(r);
			
			// 게시글들의 내용을 담기위해 list에 값을 담아주고
			List<RVdocumentDto> list = reviewdao.selectAll(r);
			RVdocumentDto rvcountdto = reviewdao.rvCount();

			session.getAttribute("dto");
			
			// 게시글들의 내용을 request객체에 담고 review_list로 게시판 정보를 가지고 이동
			request.setAttribute("list", list);
			request.setAttribute("rvcountdto", rvcountdto);
			request.setAttribute("r", r);
			
			dispatch("review_list.jsp", request, response); // forward 하나하나쓰기귀찮아서 메소드로만듦
		}

		// 이용후기 게시판글작성
		else if (command.equals("reviewinsertform")) {
			response.sendRedirect("review_write.jsp");

		} else if (command.equals("reviewinsert")) {

			String rv_title = request.getParameter("title");
			String file_id = request.getParameter("contentfile");
			int member_id = 0;
			String rv_content = request.getParameter("content");

			// member_id값 가져오기
			MemberDto logindto = (MemberDto) session.getAttribute("dto");
			member_id = logindto.getMember_id();

			RVdocumentDto dto = new RVdocumentDto(rv_title, file_id, member_id, rv_content);
			int res = reviewdao.reviewinsert(dto);

			System.out.println(res);
			if (res > 0) {
				alert("글 쓰기 성공!", "SemiProjectServlet.do?command=list", request, response);
			} else {
				alert("파일을 첨부해주세요!", "review_write.jsp", request, response);
			}
		}
		// 이용후기 선택 글 보기
				else if (command.equals("RVselectOne")) {
					int rv_id = Integer.parseInt(request.getParameter("rv_id"));
					RVdocumentDto dto = reviewdao.RVselectOne(rv_id);
					System.out.println("rv_id >> " + rv_id);
					
					//이전글 저장될 객체
					RVdocumentDto prevDocument = null;
					//다음글 저장될 객체
					RVdocumentDto nextDocument = null;
					try {
						prevDocument = reviewdao.selectPrev(dto);
						nextDocument = reviewdao.selectNext(dto);
					} catch (Exception e) {
						System.out.println("이전글 또는 다음글 조회에 실패했습니다.");
					} 

					request.setAttribute("RVviewDto", dto);
					request.setAttribute("prevDocument", prevDocument);
					//System.out.println("prevDocument >> " + prevDocument.getRv_title());
					request.setAttribute("nextDocument", nextDocument);
					//System.out.println("nextDocument >> " + nextDocument.getRv_title());

					dispatch("review_view.jsp", request, response);
					
				}
		// 이용후기 조회수증가
		else if (command.equals("RVupdateViewCount")) {
			int rv_id = Integer.parseInt(request.getParameter("rv_id"));
			int dto = reviewdao.RVupdateViewCount(rv_id);
			request.setAttribute("RVviewDto", dto);

			if (dto > 0) {
				dispatch("SemiProjectServlet.do?command=RVselectOne&rv_id=" + rv_id, request, response);
			} else {
				alert("조회수 증가 실패!", "review_write.jsp", request, response);
			}
		}
		// 이용후기 선택 글 보기
		else if (command.equals("RVselectOne")) {
			int rv_id = Integer.parseInt(request.getParameter("rv_id"));
			RVdocumentDto dto = reviewdao.RVselectOne(rv_id);
			request.setAttribute("RVviewDto", dto);

			dispatch("review_view.jsp", request, response);

		}

		// 이용후기 글수정
		else if (command.equals("rvupdateform")) {
			int rv_id = Integer.parseInt(request.getParameter("rv_id"));

			RVdocumentDto dto = reviewdao.RVselectOne(rv_id);

			request.setAttribute("dto", dto);
			dispatch("review_update.jsp", request, response);
		} else if (command.equals("rvupdate")) {
			int rv_id = Integer.parseInt(request.getParameter("rv_id"));
			String rv_title = request.getParameter("title");
			String rv_content = request.getParameter("content");

			RVdocumentDto dto = new RVdocumentDto(rv_id, rv_title, rv_content);

			int res = reviewdao.RVupdate(dto);

			if (res > 0) {
				// response.sendRedirect("SemiProjectServlet.do?command=qadetail&qa_id="+qa_id);
				alert("게시글이 수정되었습니다!", "SemiProjectServlet.do?command=RVselectOne&rv_id=" + rv_id, request, response);
			} else {
				dispatch("SemiProjectServlet.do?command=rvupdateform&rv_id=" + rv_id, request, response);
			}
		}

		// 이용후기 글삭제
		else if (command.equals("rvdelete")) {
			int rv_id = Integer.parseInt(request.getParameter("rv_id"));

			int res = reviewdao.RVdelete(rv_id);

			if (res > 0) {
				// response.sendRedirect("SemiProjectServlet.do?command=qalist");
				alert("게시글이 삭제되었습니다", "SemiProjectServlet.do?command=list", request, response);
			} else {
				dispatch("SemiProjectServlet.do?command=RVselectOne&rv_id=" + rv_id, request, response);
			}
		}

		// =============공지사항===========
		// 공지사항 게시글 전체출력
		else if (command.equals("ntlist")) {
			// 게시글들의 내용을 담기위해 list에 값을 담아주고
			List<NoticeDto> ntlist = noticedao.selectAll();

			session.getAttribute("dto");

			request.setAttribute("ntlist", ntlist);
			// 게시글들의 내용을 request객체에 담고 review_list로 게시판 정보를 가지고 이동
			dispatch("notice_list.jsp", request, response); // forward 하나하나쓰기귀찮아서 메소드로만듦
		}

		// 공지사항 게시판글작성
		else if (command.equals("noticeinsertform")) {
			response.sendRedirect("notice_write.jsp");

		} else if (command.equals("noticeinsert")) {

			String nt_title = request.getParameter("title");
			String nt_content = request.getParameter("content");
			int member_id = 0;

			System.out.println(nt_title);
			System.out.println(nt_content);

			// member_id값 가져오기
			MemberDto logindto = (MemberDto) session.getAttribute("dto");
			member_id = logindto.getMember_id();

			NoticeDto dto = new NoticeDto(nt_title, nt_content, member_id);
			int res = noticedao.noticeinsert(dto);

			System.out.println(res);
			if (res > 0) {
				alert("글 쓰기 성공!", "SemiProjectServlet.do?command=ntlist", request, response);
			} else {
				alert("글 쓰기 실패!", "notice_write.jsp", request, response);
			}
		}
		// 공지사항 조회수증가
		else if (command.equals("NTupdateViewCount")) {
			int nt_id = Integer.parseInt(request.getParameter("nt_id"));
			int dto = noticedao.NTupdateViewCount(nt_id);
			request.setAttribute("NTviewDto", dto);

			if (dto > 0) {
//	             alert("조회수 증가!", "SemiProjectServlet.do?command=NTselectOne&nt_id="+nt_id, request, response);
				dispatch("SemiProjectServlet.do?command=NTselectOne&nt_id=" + nt_id, request, response);
			} else {
				alert("조회수 증가 실패!", "notice_write.jsp", request, response);
			}
		}
		// 공지사항 선택 글 보기
		else if (command.equals("NTselectOne")) {
			int nt_id = Integer.parseInt(request.getParameter("nt_id"));
			NoticeDto dto = noticedao.NTselectOne(nt_id);
			request.setAttribute("NTviewDto", dto);

			dispatch("notice_view.jsp", request, response);
		}

		// 공지사항 글수정
		else if (command.equals("ntupdateform")) {
			int nt_id = Integer.parseInt(request.getParameter("nt_id"));

			NoticeDto dto = noticedao.NTselectOne(nt_id);

			request.setAttribute("dto", dto);
			dispatch("notice_update.jsp", request, response);
		} else if (command.equals("ntupdate")) {
			int nt_id = Integer.parseInt(request.getParameter("nt_id"));
			String nt_title = request.getParameter("title");
			String nt_content = request.getParameter("content");

			NoticeDto dto = new NoticeDto(nt_id, nt_title, nt_content);

			int res = noticedao.NTupdate(dto);

			if (res > 0) {
				// response.sendRedirect("SemiProjectServlet.do?command=qadetail&qa_id="+qa_id);
				alert("게시글이 수정되었습니다!", "SemiProjectServlet.do?command=NTselectOne&nt_id=" + nt_id, request, response);
			} else {
				dispatch("SemiProjectServlet.do?command=ntupdateform&nt_id=" + nt_id, request, response);
			}
		}

		// 공지사항 글삭제
		else if (command.equals("ntdelete")) {
			int nt_id = Integer.parseInt(request.getParameter("nt_id"));

			int res = noticedao.NTdelete(nt_id);

			if (res > 0) {
				// response.sendRedirect("SemiProjectServlet.do?command=qalist");
				alert("게시글이 삭제되었습니다", "SemiProjectServlet.do?command=ntlist", request, response);
			} else {
				dispatch("SemiProjectServlet.do?command=NTselectOne&nt_id=" + nt_id, request, response);
			}

			// 관리자 회원 탈퇴 -------------------관리자 영역 시작--- 회원 정보 조회
		} else if (command.equals("admin_deleteuser")) {

			int member_id = Integer.parseInt(request.getParameter("member_id"));
			int res = Memberdao.deleteUser(member_id);
			if (res > 0) {
				alert("회원이 탈퇴 되었습니다.", "SemiProjectServlet.do?command=admin_userlist", request, response);
				System.out.println(member_id + " 탈퇴");
			} else {
				alert("회원 탈퇴 실패.", "SemiProjectServlet.do?command=admin_userlist", request, response);
				System.out.println(member_id + " 탈퇴 실패");
			}
			// 관리자 권한으로 다중 회원 탈퇴
		} else if (command.equals("admin_multi_deleteuser")) {

			String[] member_id = request.getParameterValues("chk");

			if (member_id == null || member_id.length == 0) {
				alert("적어도 하나는 선택되어야 합니다.", "SemiProjectServlet.do?command=admin_userlist", request, response);
			} else {
				int res = Memberdao.admin_multi_deleteuser(member_id);
				if (res == member_id.length) {
					alert("탈퇴 성공.", "SemiProjectServlet.do?command=admin_userlist", request, response);
					System.out.println("사요나라!");
				} else {
					alert("탈퇴 실패.", "SemiProjectServlet.do?command=admin_userlist", request, response);
					System.out.println("탈퇴 실패!!");
				}
			}
			// 관리자 회원 정보 조회
		} else if (command.equals("admin_userlist")) {

			List<MemberDto> list = Memberdao.admin_userlist();
			request.setAttribute("list", list);

			dispatch("adminContent.jsp", request, response);
			// 관리자 QA 관리 목록 //////////////////////////////////
		} else if (command.equals("admin_qalist")) {
			List<QABoardDto> QAList = QADao.admin_qalist();

			session.getAttribute("dto");

			request.setAttribute("QAList", QAList);
			dispatch("admin_qa_list.jsp", request, response);

		}
		// 관리자 QA조회수증가
		else if (command.equals("ADQAupdateViewCount")) {
			int qa_id = Integer.parseInt(request.getParameter("qa_id"));
			int dto = QADao.QAupdateViewCount(qa_id);
			request.setAttribute("QAviewDto", dto);

			if (dto > 0) {
				dispatch("SemiProjectServlet.do?command=admin_qaview&qa_id=" + qa_id, request, response);
			} else {
				alert("조회수 증가 실패!", "admin_qa_write.jsp", request, response);
			}

			// 관리자 QA 게시글 보기
		} else if (command.equals("admin_qaview")) {
			// 특정 게시글을 가져오기 위해 게시글 번호를 가져오고
			int qa_id = Integer.parseInt(request.getParameter("qa_id"));
			/*
			 * 게시글의 정보를 객체에 담고 request객체에 정보를 담고 게시글의 정보를 가지고 qa_view 페이지로 이동
			 */
			QABoardDto qaViewDto = QADao.admin_qaview(qa_id);
			request.setAttribute("qaViewDto", qaViewDto);

			dispatch("admin_qa_view.jsp", request, response);

			// 관리자 QA게시판 글쓰기
		} else if (command.equals("admin_qawriteform")) {
			response.sendRedirect("admin_qa_write.jsp");

		} else if (command.equals("admin_qawrite")) {
			String qa_title = request.getParameter("title");
			String qa_content = request.getParameter("content");
			int member_id = 0; // 회원번호를 받을 변수 선언

			// 로그인 값 가져오기
			MemberDto logindto = (MemberDto) session.getAttribute("dto");
			member_id = logindto.getMember_id();

			QABoardDto dto = new QABoardDto(qa_title, qa_content, member_id);

			int res = QADao.admin_qawrite(dto);

			if (res > 0) {
				alert("글 쓰기 성공!", "SemiProjectServlet.do?command=admin_qalist", request, response);
			} else {
				alert("글 쓰기 실패!", "admin_qa_write.jsp", request, response);
			}
		}
		// 관리자 QA 글수정
		else if (command.equals("admin_qaupdateform")) {
			int qa_id = Integer.parseInt(request.getParameter("qa_id"));

			QABoardDto dto = QADao.admin_qaview(qa_id);

			request.setAttribute("dto", dto);
			dispatch("admin_qa_update.jsp", request, response);

		} else if (command.equals("admin_qaupdate")) {
			int qa_id = Integer.parseInt(request.getParameter("qa_id"));
			String qa_title = request.getParameter("title");
			String qa_content = request.getParameter("content");

			QABoardDto dto = new QABoardDto(qa_id, qa_title, qa_content);

			int res = QADao.QAupdate(dto);

			if (res > 0) {
				// response.sendRedirect("SemiProjectServlet.do?command=qadetail&qa_id="+qa_id);
				alert("게시글이 수정되었습니다!", "SemiProjectServlet.do?command=admin_qaview&qa_id=" + qa_id, request, response);
			} else {
				dispatch("SemiProjectServlet.do?command=admin_qaupdateform&qa_id=" + qa_id, request, response);
			}

			// 관리자 QA 게시글 삭제
		} else if (command.equals("admin_qadelete")) {
			int qa_id = Integer.parseInt(request.getParameter("qa_id"));

			int res = QADao.admin_qadelete(qa_id);

			if (res > 0) {
				// response.sendRedirect("SemiProjectServlet.do?command=qalist");
				alert("게시글이 삭제되었습니다", "SemiProjectServlet.do?command=admin_qalist", request, response);
			} else {
				dispatch("SemiProjectServlet.do?command=admin_qaview&qa_id=" + qa_id, request, response);
			}

			// 관리자 다중 QA게시글 삭제
		} else if (command.equals("admin_multi_qadelete")) {

			String[] qa_id = request.getParameterValues("chk");

			if (qa_id == null || qa_id.length == 0) {
				alert("적어도 하나는 선택되어야 합니다.", "SemiProjectServlet.do?command=admin_qalist", request, response);
			} else {
				int res = QADao.admin_multi_qadelete(qa_id);
				if (res == qa_id.length) {
					alert("삭제 성공.", "SemiProjectServlet.do?command=admin_qalist", request, response);
					System.out.println("사요나라!");
				} else {
					alert("삭제 실패.", "SemiProjectServlet.do?command=admin_qalist", request, response);
					System.out.println("삭제 실패!!");
				}
			}

		}

		//// 관리자 이용 후기 부분!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

		// 관리자 이용후기 게시판 목록 조회
		else if (command.equals("admin_rvlist")) {
			// 게시글들의 내용을 담기위해 list에 값을 담아주고
			List<RVdocumentDto> list = reviewdao.selectAll();

			session.getAttribute("dto");

			request.setAttribute("list", list);
			// 게시글들의 내용을 request객체에 담고 review_list로 게시판 정보를 가지고 이동
			dispatch("admin_review_list.jsp", request, response); // forward 하나하나쓰기귀찮아서 메소드로만듦
		}
		// 관리자 이용후기 게시판글작성
		else if (command.equals("admin_rvwriteform")) {
			response.sendRedirect("admin_review_write.jsp");

		} else if (command.equals("admin_rvwrite")) {

			String rv_title = request.getParameter("title");
			String file_id = request.getParameter("contentfile");
			int member_id = 0;
			String rv_content = request.getParameter("content");

			// member_id값 가져오기
			MemberDto logindto = (MemberDto) session.getAttribute("dto");
			member_id = logindto.getMember_id();

			RVdocumentDto dto = new RVdocumentDto(rv_title, file_id, member_id, rv_content);
			System.out.println(dto);
			int res = reviewdao.admin_rvwrite(dto);

			System.out.println(res);
			if (res > 0) {
				alert("글 쓰기 성공!", "SemiProjectServlet.do?command=admin_rvlist", request, response);
			} else {
				alert("글 쓰기 실패!", "admin_review_write.jsp", request, response);
			}
		}

		// 관리자 이용후기 글수정
		else if (command.equals("admin_rvupdateform")) {
			int rv_id = Integer.parseInt(request.getParameter("rv_id"));

			RVdocumentDto dto = reviewdao.RVselectOne(rv_id);

			request.setAttribute("dto", dto);
			dispatch("admin_review_update.jsp", request, response);

		} else if (command.equals("admin_rvupdate")) {
			int rv_id = Integer.parseInt(request.getParameter("rv_id"));
			String rv_title = request.getParameter("title");
			String rv_content = request.getParameter("content");

			RVdocumentDto dto = new RVdocumentDto(rv_id, rv_title, rv_content);

			int res = reviewdao.RVupdate(dto);

			if (res > 0) {
				// response.sendRedirect("SemiProjectServlet.do?command=qadetail&qa_id="+qa_id);
				alert("게시글이 수정되었습니다!", "SemiProjectServlet.do?command=admin_rvview&rv_id=" + rv_id, request, response);
			} else {
				dispatch("SemiProjectServlet.do?command=admin_rvupdateform&rv_id=" + rv_id, request, response);
			}

		}
		// 관리자 이용후기 글삭제
		else if (command.equals("admin_rvdelete")) {
			int rv_id = Integer.parseInt(request.getParameter("rv_id"));

			int res = reviewdao.admin_rvdelete(rv_id);

			if (res > 0) {
				alert("게시글이 삭제되었습니다", "SemiProjectServlet.do?command=admin_rvlist", request, response);
			} else {
				dispatch("SemiProjectServlet.do?command=admin_rvview&rv_id=" + rv_id, request, response);
			}
			// 관리자 이용후기 다중 게시글 삭제
		} else if (command.equals("admin_multi_rvdelete")) {

			String[] rv_id = request.getParameterValues("chk");

			if (rv_id == null || rv_id.length == 0) {
				alert("적어도 하나는 선택되어야 합니다.", "SemiProjectServlet.do?command=admin_rvlist", request, response);
			} else {
				int res = reviewdao.admin_multi_rvdelete(rv_id);
				if (res == rv_id.length) {
					alert("삭제 성공.", "SemiProjectServlet.do?command=admin_rvlist", request, response);
					System.out.println("사요나라!");
				} else {
					alert("삭제 실패.", "SemiProjectServlet.do?command=admin_rvlist", request, response);
					System.out.println("삭제 실패!!");
				}
			}
		}
		// 관리자 이용후기 조회수 증가
		else if (command.equals("ADupdateViewCount")) {
			int rv_id = Integer.parseInt(request.getParameter("rv_id"));
			int dto = reviewdao.RVupdateViewCount(rv_id);
			request.setAttribute("RVviewDto", dto);

			if (dto > 0) {
				dispatch("SemiProjectServlet.do?command=admin_rvview&rv_id=" + rv_id, request, response);
			} else {
				alert("조회수 증가 실패!", "admin_review_write.jsp", request, response);
			}
		}
		// 관지라 이용후기 선택 글 보기
		else if (command.equals("admin_rvview")) {
			int rv_id = Integer.parseInt(request.getParameter("rv_id"));
			RVdocumentDto Dto = reviewdao.admin_rvview(rv_id);
			request.setAttribute("RVviewDto", Dto);

			dispatch("admin_review_view.jsp", request, response);

			// 이메일 인증
		}

		// =============관리자관리자관리자관리자공지사항===========
		// 관리자공 지사항 게시글 전체출력
		else if (command.equals("admin_ntlist")) {
			// 게시글들의 내용을 담기위해 list에 값을 담아주고
			List<NoticeDto> ntlist = noticedao.selectAll();

			session.getAttribute("dto");

			request.setAttribute("ntlist", ntlist);
			// 게시글들의 내용을 request객체에 담고 review_list로 게시판 정보를 가지고 이동
			dispatch("admin_notice_list.jsp", request, response); // forward 하나하나쓰기귀찮아서 메소드로만듦
		}

	
		//관지라 공지사항 조회수증가
		else if (command.equals("admim_NTupdateViewCount")) {
			int nt_id = Integer.parseInt(request.getParameter("nt_id"));
			int dto = noticedao.NTupdateViewCount(nt_id);
			request.setAttribute("NTviewDto", dto);

			if (dto > 0) {
//	             alert("조회수 증가!", "SemiProjectServlet.do?command=NTselectOne&nt_id="+nt_id, request, response);
				dispatch("SemiProjectServlet.do?command=admin_NTselectOne&nt_id=" + nt_id, request, response);
			} else {
				alert("조회수 증가 실패!", "admin_notice_write.jsp", request, response);
			}
		}
		//관리자 공지사항 선택 글 보기
		else if (command.equals("admin_NTselectOne")) {
			int nt_id = Integer.parseInt(request.getParameter("nt_id"));
			NoticeDto dto = noticedao.NTselectOne(nt_id);
			request.setAttribute("NTviewDto", dto);

			dispatch("admin_notice_view.jsp", request, response);
		}
		
		//관리자 공지사항 게시판글작성
		else if (command.equals("admin_noticeinsertform")) {
			response.sendRedirect("admin_notice_write.jsp");

		} else if (command.equals("admin_noticeinsert")) {

			String nt_title = request.getParameter("title");
			String nt_content = request.getParameter("content");
			int member_id = 0;

			System.out.println(nt_title);
			System.out.println(nt_content);

			// member_id값 가져오기
			MemberDto logindto = (MemberDto) session.getAttribute("dto");
			member_id = logindto.getMember_id();

			NoticeDto dto = new NoticeDto(nt_title, nt_content, member_id);
			int res = noticedao.noticeinsert(dto);

			System.out.println(res);
			if (res > 0) {
				alert("글 쓰기 성공!", "SemiProjectServlet.do?command=admin_ntlist", request, response);
			} else {
				alert("글 쓰기 실패!", "admin_notice_write.jsp", request, response);
			}
		}

		//관리자 공지사항 글수정
		else if (command.equals("admin_ntupdateform")) {
			int nt_id = Integer.parseInt(request.getParameter("nt_id"));

			NoticeDto dto = noticedao.NTselectOne(nt_id);

			request.setAttribute("dto", dto);
			dispatch("admin_notice_update.jsp", request, response);
		} else if (command.equals("admin_ntupdate")) {
			int nt_id = Integer.parseInt(request.getParameter("nt_id"));
			String nt_title = request.getParameter("title");
			String nt_content = request.getParameter("content");

			NoticeDto dto = new NoticeDto(nt_id, nt_title, nt_content);

			int res = noticedao.NTupdate(dto);

			if (res > 0) {
				// response.sendRedirect("SemiProjectServlet.do?command=qadetail&qa_id="+qa_id);
				alert("게시글이 수정되었습니다!", "SemiProjectServlet.do?command=admin_NTselectOne&nt_id=" + nt_id, request, response);
			} else {
				dispatch("SemiProjectServlet.do?command=admin_ntupdateform&nt_id=" + nt_id, request, response);
			}
		}

		//관리자 공지사항 글삭제
		else if (command.equals("admin_ntdelete")) {
			int nt_id = Integer.parseInt(request.getParameter("nt_id"));

			int res = noticedao.NTdelete(nt_id);

			if (res > 0) {
				// response.sendRedirect("SemiProjectServlet.do?command=qalist");
				alert("게시글이 삭제되었습니다", "SemiProjectServlet.do?command=admin_ntlist", request, response);
			} else {
				dispatch("SemiProjectServlet.do?command=admin_NTselectOne&nt_id=" + nt_id, request, response);
			}

		} else if (command.equals("emailcheck")) {
			// 사용자 이메일과 인증번호를 받아오고
			String member_email = request.getParameter("member_email");
			String authNum = "";

			System.out.println(member_email);

			authNum = RandomNum();

			sendEmail(member_email.toString(), authNum);

			request.setAttribute("authNum", authNum);
			dispatch("email_check.jsp", request, response);
		}
	}

	// sendEmail메소드
	private void sendEmail(String member_email, String authNum) {
		String host = "smtp.gmail.com"; // smtp서버
		String subject = "이메일 인증 번호입니다!";
		String fromName = "UTC 관리자";
		String from = "uiyhp123@gmail.com"; // 메일 보내는 사람
		String to = member_email; // 메일 받는 사람

		String content = "인증번호[" + authNum + "]";

		try {
			Properties p = new Properties();
			// G-Mail SMTP 사용시
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.transport.protocol", "smtp");
			p.put("mail.smtp.host", host);
			p.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.user", from);
			p.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(p, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("uiyhp123@gmail.com", "ehdals5213!");

				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));

			InternetAddress[] address1 = { new InternetAddress(to) };
			msg.setRecipients(Message.RecipientType.TO, address1); // 받는 사람 설정1
			msg.setSubject(subject); // 제목설정
			msg.setSentDate(new java.util.Date());// 보내는 날짜 설정
			msg.setContent(content, "text/html; charset=euc-kr");

			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 인증번호 난수를 생성하는 메소드
	// 인증번호 생성 메소드
	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);

		dispatch.forward(request, response);
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
