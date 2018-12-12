package com.UTC.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.UTC.dto.NoticeDto;

public class NoticeDao extends sqlMapConfig{
	private String namespace = "com.UTC.Notice.";


	//게시글전체출력
	public List<NoticeDto> selectAll() {

		List<NoticeDto> res = new ArrayList<NoticeDto>();
		SqlSession session = null;

		// openSession(true) = autoCommit;
		session = getSqlSessionFactory().openSession(true);
		res = session.selectList(namespace + "ntlistAll");

		session.close();

		return res;

	}
	

	//글작성
	public int noticeinsert(NoticeDto dto) {
		
		SqlSession session = null;
		int res = 0;

		try {// openSession(true) = autoCommit;
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(namespace + "ntwrite", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	
	//글보기
	public NoticeDto NTselectOne(int nt_id) {

		NoticeDto res = null;
		SqlSession session = null;

		try {// openSession(true) = autoCommit;
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(namespace + "ntdetail", nt_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}
	
	public int NTupdateViewCount(int nt_id) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace+"NTupdateViewCount", nt_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}

	
	//글수정
	public int NTupdate(NoticeDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.update(namespace+"ntupdate", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	//글삭제
	public int NTdelete(int nt_id) {
		SqlSession session = null;
		int res=0;
		
		try {
		session = getSqlSessionFactory().openSession(true);
		res = session.delete(namespace+"ntdelete",nt_id);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
}
