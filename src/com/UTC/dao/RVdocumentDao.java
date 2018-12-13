package com.UTC.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.UTC.dto.QABoardDto;
import com.UTC.dto.RVdocumentDto;

public class RVdocumentDao extends sqlMapConfig {

	private String namespace = "com.UTC.RVdocument.";


	//게시글 전체출력
			public List<RVdocumentDto> selectAll(int r) {

				List<RVdocumentDto> res = new ArrayList<RVdocumentDto>();
				SqlSession session = null;

				// openSession(true) = autoCommit;
				try {
					session = getSqlSessionFactory().openSession(true);
					res = session.selectList(namespace + "rvlistAll",r);
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					session.close();
				}
				return res;
			}
			
			//이용후기 게시판 게시글 개수
			public RVdocumentDto rvCount() {
				SqlSession session = null;
				RVdocumentDto res = null;
				
				try {
				session = getSqlSessionFactory().openSession(true);
				res = session.selectOne(namespace+"rvcount");
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					session.close();
				}
				return res;
				
			}
			
	
	//관리자 게시글 전체출력
	public List<RVdocumentDto> selectAll() {

		List<RVdocumentDto> res = new ArrayList<RVdocumentDto>();
		SqlSession session = null;

		// openSession(true) = autoCommit;
		session = getSqlSessionFactory().openSession(true);
		res = session.selectList(namespace + "rvlistAll");

		session.close();

		return res;

	}
	

	//글작성
	public int reviewinsert(RVdocumentDto dto) {
		
		SqlSession session = null;
		int res = 0;

		try {// openSession(true) = autoCommit;
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(namespace + "rvwrite", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	
	//글보기
	public RVdocumentDto RVselectOne(int rv_id) {

		RVdocumentDto res = null;
		SqlSession session = null;

		try {// openSession(true) = autoCommit;
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(namespace + "rvdetail", rv_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	//리뷰 조회수 증가
	public int RVupdateViewCount(int rv_id) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace+"RVupdateViewCount", rv_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}

	
	//글수정
	public int RVupdate(RVdocumentDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace+"rvupdate", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	//글삭제
	public int RVdelete(int rv_id) {
		SqlSession session = null;
		int res=0;
		
		try {
		session = getSqlSessionFactory().openSession(true);
		res = session.delete(namespace+"rvdelete",rv_id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	//게시글내용 10개뽑기
	public List<RVdocumentDto> selectTen() {

		List<RVdocumentDto> res = new ArrayList<RVdocumentDto>();
		SqlSession session = null;
		session = getSqlSessionFactory().openSession(true);
		res = session.selectList(namespace + "rvlistTen");

		session.close();

		return res;

	}	
	
////////////그아아아아아아아앗 이용후기 관리자
	   
	   
//게시글전체출력
public List<RVdocumentDto> admin_rvlist() {

 List<RVdocumentDto> res = new ArrayList<RVdocumentDto>();
 SqlSession session = null;

 // openSession(true) = autoCommit;
 session = getSqlSessionFactory().openSession(true);
 res = session.selectList(namespace + "admin_rvlist");

 session.close();

 return res;

}


//글작성
public int admin_rvwrite(RVdocumentDto dto) {
 
 SqlSession session = null;
 int res = 0;

 try {// openSession(true) = autoCommit;
    session = getSqlSessionFactory().openSession(true);
    res = session.insert(namespace + "admin_rvwrite", dto);
 } catch (Exception e) {
    e.printStackTrace();
 } finally {
    session.close();
 }
 return res;
}
//추천 수 증가
	public int updateRecommend (RVdocumentDto document) throws Exception {
		SqlSession session = null;
		int result = 0;
		try {
			session = getSqlSessionFactory().openSession(true);
			result = session.update(namespace + "updateRecommend", document);
			if(result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
		} catch (Exception e) {
			throw new Exception("추천수 갱신에 실패했습니다.");
		} 
		return result;
	}
	
	
	//이전글 조회
	public RVdocumentDto selectPrev(RVdocumentDto document) throws Exception {
		SqlSession session = null;
		RVdocumentDto result = null;
		System.out.println("dao test1");
			
		try {
			System.out.println("dao test2");
			session = getSqlSessionFactory().openSession(true);
			result = session.selectOne(namespace + "selectPrev", document);
			System.out.println("result >> " + result);
			System.out.println("dao test3");
		} catch (NullPointerException e) {
			throw new Exception("이전글이 없습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("이전글 조회에 실패했습니다.");
		}
		return result;
	}
					
		//다음글 조회
		public RVdocumentDto selectNext(RVdocumentDto document) throws Exception {
			SqlSession session = null;
			RVdocumentDto result = null;
			System.out.println("dao test4");
			
			try {
				System.out.println("dao test5");
				session = getSqlSessionFactory().openSession(true);
				result = session.selectOne(namespace + "selectNext", document);
				System.out.println("result >> " + result);
				System.out.println("dao test");
			} catch (NullPointerException e) {
				throw new Exception("다음글이 없습니다.");
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception("다음글 조회에 실패했습니다.");
			}
						
			return result;
		}

//글보기
public RVdocumentDto admin_rvview(int rv_id) {

 RVdocumentDto res = null;
 SqlSession session = null;

 try {// openSession(true) = autoCommit;
    session = getSqlSessionFactory().openSession(true);
    res = session.selectOne(namespace + "admin_rvview", rv_id);
 } catch (Exception e) {
    e.printStackTrace();
 } finally {
    session.close();
 }
 return res;
}

//글삭제
public int admin_rvdelete(int rv_id) {
 SqlSession session = null;
 int res=0;
 
 try {
 session = getSqlSessionFactory().openSession(true);
 res = session.delete(namespace+"admin_rvdelete",rv_id);
 }catch(Exception e) {
    e.printStackTrace();
 }finally {
    session.close();
 }
 return res;
}

public int admin_multi_rvdelete(String[] rv_id) { // 문의 게시글 다중 삭제
 
 int count = 0;
 Map<String, String[]> map = new HashMap<String, String[]>();
 map.put("rv_id", rv_id);
 
 SqlSession session = null;
 
 try {
    session = getSqlSessionFactory().openSession(false);
    count = session.delete(namespace+"admin_multi_rvdelete", map);
    
    if(count == rv_id.length) {
       session.commit();
    }
 } catch (Exception e) {
    e.printStackTrace();
 } finally {
    session.close();
 }
 
 return count;
}

//======마이페이지에서 글 모아보기======
	public List<RVdocumentDto> selectUserRv(int member_id) {

		List<RVdocumentDto> res = new ArrayList<RVdocumentDto>();
		SqlSession session = null;

		System.out.println("??");

		// openSession(true) = autoCommit;
		try {
		session = getSqlSessionFactory().openSession(true);
		res = session.selectList(namespace+"rvlistUser", member_id);
		//res = session.selectList(namespace + "qalistUser",member_id);

		System.out.println(">>>"+res.get(0).getMember_id());

		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}

}