package com.projectQ.conf.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface AdminMemberService {
	public ArrayList<MemberVO> listMember(HashMap condMap) throws Exception;
	public MemberVO memberDetail(String member_id) throws Exception;
	public void modifyMemberInfo(HashMap memberMap) throws Exception;
}
