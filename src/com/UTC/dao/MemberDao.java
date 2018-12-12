package com.UTC.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.UTC.dto.MemberDto;

public class MemberDao extends sqlMapConfig {

	private String namespace = "com.UTC.Member.";
	
	
	//회원가입
	public int insertUser(MemberDto dto) {
		
		SqlSession session = null;
		int res = 0;

		try {// openSession(true) = autoCommit;
			session = getSqlSessionFactory().openSession(true);
			res = session.delete(namespace + "insertUser", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	//로그인
	public MemberDto login(String email, String pw) {
		SqlSession session = null;
		MemberDto res = new MemberDto(email,pw);
		
		try {// openSession(true) = autoCommit;
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(namespace + "login", res );
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	public MemberDto memberlist(int member_id) {
		SqlSession session = null;
		MemberDto res = new MemberDto(member_id);
		
		try {// openSession(true) = autoCommit;
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(namespace + "memberlist", member_id );
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	//관리자
	public List<MemberDto> selectAll(){
		
		List<MemberDto> res = new ArrayList<MemberDto>();
		SqlSession session = null;
		
		try {
		session = getSqlSessionFactory().openSession(true);
		res = session.selectList(namespace+"selectAll");
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return res;
	}
	
	
	
	//유저한명찝어올것
			public MemberDto selectUser(int member_id) {

				SqlSession session = null;
				MemberDto res = null;

				try {
					session = getSqlSessionFactory().openSession(true);
					res = session.selectOne(namespace + "selectUser", member_id);

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					session.close();
				}
				return res;
			}
			
			//정보수정
			public int updateUser(MemberDto dto) {
				int res = 0;
				SqlSession session = null;
				try {
					session = getSqlSessionFactory().openSession(true);
					res = session.update(namespace+"updateUser", dto);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					session.close();
				}
				return res;
				
			}
			
			//회원탈퇴
			public int deleteUser(int member_id) {
				int res=0;
				SqlSession session = null;
				
				try {
					session = getSqlSessionFactory().openSession(true);
					res= session.delete(namespace+"deleteUser", member_id);
				} catch (Exception e) {
					e.printStackTrace();
					session.close();
				}
				return res;
			}
	
	
			//-----------------------------관리자 영역 시작----------------------------
	         
	         // 회원 정보 조회
	         
	         // 관리자 회원 다중 탈퇴
	         
	         public int admin_multi_deleteuser(String[] member_id) {
	            
	            int count = 0;
	            Map<String, String[]> map = new HashMap<String, String[]>();
	            map.put("member_id", member_id);
	            
	            SqlSession session = null;
	            
	            try {
	               session = getSqlSessionFactory().openSession(false);
	               count = session.delete(namespace+"admin_multi_deleteuser", map);
	               
	               if(count == member_id.length) {
	                  session.commit();
	               }
	            } catch (Exception e) {
	               e.printStackTrace();
	            } finally {
	               session.close();
	            }
	            
	            return count;
	         }
	         
	         
	         // 관리자 회원 탈퇴
	         public int admin_deleteuser(int member_id) {
	            
	            return 0;
	         }
	         
	         
	          
	         
	         //관리자 회원정보조회
	         public List<MemberDto> admin_userlist(){
	            
	            List<MemberDto> res = new ArrayList<MemberDto>();
	            SqlSession session = null;
	            
	            try {
	            session = getSqlSessionFactory().openSession(true);
	            res = session.selectList(namespace+"admin_userlist");
	            
	            }catch(Exception e) {
	               e.printStackTrace();
	            }finally{
	               session.close();
	            }
	            
	            return res;

	
	
	
	
	
	         }

}