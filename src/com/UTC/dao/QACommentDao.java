package com.UTC.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.UTC.dto.QACommentDto;

public class QACommentDao extends sqlMapConfig {
	private String namespace = "com.UTC.QACommentDto.";
	SqlSession session = null;
	
	public void insertQAComment(QACommentDto comment) throws Exception {	
		try {
		session = getSqlSessionFactory().openSession(true);
//		System.out.println("qa_id >>" + comment.getQa_id());
//		System.out.println("Qacomment >>" + comment.getQacomment_content());
//		System.out.println("member_name >>" + comment.getMember_name());
//		System.out.println("member_id >>" + comment.getMember_id());
		int res = session.insert(namespace + "insertQAComment", comment);
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
	
	
	public List<QACommentDto> selectQACommentList (QACommentDto comment) {
		
		List<QACommentDto> result = new ArrayList<QACommentDto>();
		System.out.println("Dao Start >>"+comment.getQa_id());
		try {
			session = getSqlSessionFactory().openSession(true);
			
			result = session.selectList(namespace+"selectQACommentList", comment);
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
	
	
	public QACommentDto selectQAComment (QACommentDto comment) throws Exception {
		QACommentDto result = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			System.out.println("session start");
			result = session.selectOne(namespace + "selectQAComment", comment);
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
	
	public int updateQAComment (QACommentDto comment) throws Exception {
		int result = 0;
		try {
			session = getSqlSessionFactory().openSession(true);
			session.update(namespace + "updateQAComment", comment);
			
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
	
	public int deleteQAComment(QACommentDto comment) {
		int result = 0;
		try {
		session = getSqlSessionFactory().openSession(true);
		session.delete(namespace + "deleteQAComment", comment);
		
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
