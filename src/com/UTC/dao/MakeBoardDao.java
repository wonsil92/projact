package com.UTC.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.UTC.dto.MakeBoardDto;
import com.UTC.dto.QABoardDto;

public class MakeBoardDao extends sqlMapConfig {

	private String namespace = "com.UTC.MakeList.";

	// ======마이페이지에서 글 모아보기======
	public List<MakeBoardDto> selectUserMake(int member_id) {

		List<MakeBoardDto> res = new ArrayList<MakeBoardDto>();
		SqlSession session = null;

		System.out.println("??");

		// openSession(true) = autoCommit;
		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.selectList(namespace + "makelistUser", member_id);
			// res = session.selectList(namespace + "MakelistUser",member_id);

			System.out.println(">>>" + res.get(0).getMember_id());

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

	// 만들기
	public int makeWrite(MakeBoardDto dto) {

		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.insert(namespace + "makewrite", dto);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

//========글 읽기========
	public MakeBoardDto makeView(int make_id) {

		SqlSession session = null;
		MakeBoardDto res = null;

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne(namespace + "makedetail", make_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

//========삭제========
	public int makeDelete(int make_id) {
		SqlSession session = null;
		int res = 0;

		try {
			session = getSqlSessionFactory().openSession(true);
			res = session.delete(namespace + "makedelete", make_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}

}
