package com.UTC.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.UTC.dto.QABoardDto;
import com.UTC.dto.RVdocumentDto;


public class QABoardDao extends sqlMapConfig {
	//mapper파일에서 설정해준 경로로 mapper파일의 쿼리문 결과값을 받는다.
	private String namespace = "com.UTC.QAList.";
	/*
	 * 게시글 전체 출력
	 * 특정 게시글 출력
	 * 글쓰기
	 * 댓글 답글
	 */
	
	//게시글 전체 출력
	public List<QABoardDto> selectAll(int r) {

		List<QABoardDto> res = new ArrayList<QABoardDto>();
		SqlSession session = null;

		// openSession(true) = autoCommit;
		try {
		session = getSqlSessionFactory().openSession(true);
		res = session.selectList(namespace + "qalistAll",r);
		
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	//QA게시글 개수
		public QABoardDto qaCount() {
			SqlSession session = null;
			QABoardDto res = null;
			
			try {
				session = getSqlSessionFactory().openSession(true);
				res = session.selectOne(namespace+"qacount");
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				session.close();
			}
			return res;
		}
	//========글쓰기========
	public int qaWrite(QABoardDto dto) {
			
			SqlSession session = null;
			int res = 0;
			
			try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(namespace+"qawrite", dto);
			
			}catch(Exception e){
				e.printStackTrace();			
			}finally {
				session.close();
			}
			return res;
		}
	//========글 읽기========
	public QABoardDto qaView(int qa_id) {
		
		SqlSession session = null;
		QABoardDto res = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(namespace+"qadetail",qa_id);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	//=======글수정========
	public int qaUpdate(QABoardDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace+"qaupdate", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	//========글삭제========
	public int qaDelete(int qa_id) {
		SqlSession session = null;
		int res=0;
		
		try {
		session = getSqlSessionFactory().openSession(true);
		res = session.delete(namespace+"qadelete",qa_id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	//======마이페이지에서 글 모아보기======
	public List<QABoardDto> selectUserQa(int member_id) {

		List<QABoardDto> res = new ArrayList<QABoardDto>();
		SqlSession session = null;

		System.out.println("??");
		
		// openSession(true) = autoCommit;
		try {
		session = getSqlSessionFactory().openSession(true);
		res = session.selectList(namespace+"qalistUser", member_id);
		//res = session.selectList(namespace + "qalistUser",member_id);
		
		System.out.println(">>>"+res.get(0).getMember_id());
		
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}

	/*qa게시판 제목클릭시 조회수증가*/
	public int QAupdateViewCount(int qa_id) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace+"QAupdateViewCount",qa_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}

	
	

	   // --------------------관리자 페이지 ------------------------------------
	   
	   
	   //게시글 전체 출력
	      public List<QABoardDto> admin_qalist() {

	         List<QABoardDto> res = new ArrayList<QABoardDto>();
	         SqlSession session = null;

	         // openSession(true) = autoCommit;
	         try {
	         session = getSqlSessionFactory().openSession(true);
	         res = session.selectList(namespace + "admin_qalist");
	         
	         }catch(Exception e){
	            e.printStackTrace();
	         }finally {
	            session.close();
	         }
	         return res;
	      }
	      //========글쓰기========
	      public int admin_qawrite(QABoardDto dto) {
	            
	            SqlSession session = null;
	            int res = 0;
	            
	            try {
	            session = getSqlSessionFactory().openSession(true);
	            res = session.insert(namespace+"admin_qawrite", dto);
	            
	            }catch(Exception e){
	               e.printStackTrace();         
	            }finally {
	               session.close();
	            }
	            return res;
	         }
	      //========글 읽기========
	      public QABoardDto admin_qaview(int qa_id) {
	         
	         SqlSession session = null;
	         QABoardDto res = null;
	         
	         try {
	            session = getSqlSessionFactory().openSession(true);
	            res = session.selectOne(namespace+"admin_qaview",qa_id);
	         }catch(Exception e){
	            e.printStackTrace();
	         }finally {
	            session.close();
	         }
	         return res;
	      }
	      
	  	//=========글수정=========
	  	public int QAupdate(QABoardDto dto) {
	  		SqlSession session = null;
	  		int res = 0;
	  		
	  		try {
	  			session = getSqlSessionFactory().openSession(true);
	  			res = session.update(namespace+"qaupdate", dto);
	  			
	  		} catch (Exception e) {
	  			e.printStackTrace();
	  		}finally {
	  			session.close();
	  		}
	  		return res;
	  	}
	      
	      //========글삭제========
	      public int admin_qadelete(int qa_id) {
	         SqlSession session = null;
	         int res=0;
	         
	         try {
	         session = getSqlSessionFactory().openSession(true);
	         res = session.delete(namespace+"admin_qadelete",qa_id);
	         }catch(Exception e) {
	            e.printStackTrace();
	         }finally {
	            session.close();
	         }
	         return res;
	      }
	      
	      public int admin_multi_qadelete(String[] qa_id) { // 문의 게시글 다중 삭제
	         
	         int count = 0;
	         Map<String, String[]> map = new HashMap<String, String[]>();
	         map.put("qa_id", qa_id);
	         
	         SqlSession session = null;
	         
	         try {
	            session = getSqlSessionFactory().openSession(false);
	            count = session.delete(namespace+"admin_multi_qadelete", map);
	            
	            if(count == qa_id.length) {
	               session.commit();
	            }
	         } catch (Exception e) {
	            e.printStackTrace();
	         } finally {
	            session.close();
	         }
	         
	         return count;
	      }
	
}
