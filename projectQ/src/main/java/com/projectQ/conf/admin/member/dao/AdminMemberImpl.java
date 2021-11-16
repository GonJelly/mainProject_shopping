package com.projectQ.conf.admin.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("adminMemberDao")
public class AdminMemberImpl implements AdminMemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<MemberVO> listMember(HashMap condMap) throws DataAccessException {
		ArrayList<MemberVO> memberList=(ArrayList)sqlSession.selectList("mapper.admin.member.listMember", condMap);
		return memberList;
	}

	@Override
	public MemberVO memberDetail(String member_id) throws DataAccessException {
		MemberVO memberBean=(MemberVO)sqlSession.selectOne("mapper.admin.member.memberDetail", member_id);
		return memberBean;
	}

	@Override
	public void modifyMemberInfo(HashMap memberMap) throws DataAccessException {
		sqlSession.update("mapper.admin.member.modifyMemberInfo", memberMap);
		
	}

}
