package com.projectQ.conf.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.projectQ.conf.admin.member.dao.AdminMemberDAO;

@Service("adminMemberService")
@Transactional(propagation=Propagation.REQUIRED)
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	AdminMemberDAO adminMemberDAO;
	
	@Override
	public ArrayList<MemberVO> listMember(HashMap condMap) throws Exception {
		return adminMemberDAO.listMember(condMap);
	}

	@Override
	public MemberVO memberDetail(String member_id) throws Exception {
		return adminMemberDAO.memberDetail(member_id);
	}

	@Override
	public void modifyMemberInfo(HashMap memberMap) throws Exception {
		String member_id=(String)memberMap.get("member_id");
		adminMemberDAO.modifyMemberInfo(memberMap);		
	}

}
