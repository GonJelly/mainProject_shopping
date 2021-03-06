package com.projectQ.conf.mypage.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.projectQ.conf.member.vo.MemberVO;
import com.projectQ.conf.order.vo.OrderVO;

@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<OrderVO> selectMyOrderGoodsList(String member_id) throws DataAccessException {
		List<OrderVO> orderGoodsList= (ArrayList) sqlSession.selectList("mapper.mypage.selectMyOrderGoodsList", member_id);
		return orderGoodsList;
	}

	@Override
	public List selectMyOrderInfo(String order_id) throws DataAccessException {
		List myOrderList=(List)sqlSession.selectList("mapper.mypage.selectMyOrderInfo", order_id);
		return myOrderList;
	}

	@Override
	public List<OrderVO> selectMyOrderHistoryList(Map dateMap) throws DataAccessException {
		List<OrderVO> myOrderHistList=(List)sqlSession.selectList("mapper.mypage.selectMyOrderHistoryList", dateMap);
		return myOrderHistList;
	}

	@Override
	public void updateMyInfo(Map memberMap) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyInfo", memberMap);
	}

	@Override
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException {
		MemberVO memberVO=(MemberVO)sqlSession.selectOne("mapper.mypage.selectMyDetailInfo", member_id);
		return memberVO;
	}

	@Override
	public void updateMyOrderCancel(String order_id) throws DataAccessException {
		sqlSession.update("mapper.mypage.updateMyOrderCancel", order_id);
		
	}

}
