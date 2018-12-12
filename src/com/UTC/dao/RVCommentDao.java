package com.UTC.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.UTC.dto.RVCommentDto;

public class RVCommentDao extends sqlMapConfig {
	private String namespace = "com.UTC.RVCommentDto.";
	SqlSession session = null;
	
	public void insertRVComment(RVCommentDto comment) throws Exception {	
		try {
		session = getSqlSessionFactory().openSession(true);
		int res = session.insert(namespace + "insertRVComment", comment);
			if(res == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			session.rollback();
			throw new Exception("저장된 댓글이 없습니다.");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
		}
	}
	
	
	public List<RVCommentDto> selectRVCommentList (RVCommentDto comment) {
		
		List<RVCommentDto> result = new ArrayList<RVCommentDto>();
		try {
			session = getSqlSessionFactory().openSession(true);
			
			result = session.selectList(namespace+"selectRVCommentList", comment);
			if(result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			session.rollback();
		} finally {
			session.commit();
		}
		
		return result;	
	}
	
	
	public RVCommentDto selectRVComment (RVCommentDto comment) throws Exception {
		RVCommentDto result = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			System.out.println("session start");
			result = session.selectOne(namespace + "selectRVComment", comment);
			System.out.println("session end");
			System.out.println("result >>"+result);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			session.rollback();
			throw new Exception("조회된 댓글이 없습니다.");
		} catch (Exception e) {
			session.rollback();
			throw new Exception("댓글 조회에 실패했습니다.");
		} finally {
			session.commit();
		}
		
		return result;
	}
	
	public int updateRVComment (RVCommentDto comment) throws Exception {
		int result = 0;
		try {
			session = getSqlSessionFactory().openSession(true);
			session.update(namespace + "updateRVComment", comment);
			
		} catch (NullPointerException e) {
			session.rollback();
			e.printStackTrace();
			throw new Exception("수정된 정보가 없습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
			throw new Exception("수정에 실패했습니다.");
		}finally {
			session.commit();
		}
		
		return result;
	}
	
	public int deleteRVComment(RVCommentDto comment) {
		int result = 0;
		try {
		session = getSqlSessionFactory().openSession(true);
		session.delete(namespace + "deleteRVComment", comment);
		
		} catch (NullPointerException e) {
			e.printStackTrace();
			session.rollback();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.commit();
		}
		
		return result;
	}
}
