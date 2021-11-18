package com.projectQ.conf.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.projectQ.conf.member.vo.MemberVO;
import com.projectQ.conf.mypage.dao.MyPageDAO;
import com.projectQ.conf.order.vo.OrderVO;

@Service("myPageService")
@Transactional(propagation = Propagation.REQUIRED)
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	MyPageDAO myPageDAO;
	
	@Override
	public List<OrderVO> listMyOrderGoods(String member_id) throws Exception {
		return myPageDAO.selectMyOrderGoodsList(member_id);
	}

	@Override
	public List findMyOrderInfo(String order_id) throws Exception {
		return myPageDAO.selectMyOrderInfo(order_id);
	}

	@Override
	public List<OrderVO> listMyOrderHistory(Map dateMap) throws Exception {
		return myPageDAO.selectMyOrderHistoryList(dateMap);
	}

	@Override
	public MemberVO modifyMyInfo(Map memberMap) throws Exception {
		String member_id=(String)memberMap.get("member_id");
		return myPageDAO.selectMyDetailInfo(member_id);
	}

	@Override
	public void cancelOrder(String order_id) throws Exception {
		myPageDAO.updateMyOrderCancel(order_id);
	}

	@Override
	public MemberVO myDetailInfo(String member_id) throws Exception {
		return myPageDAO.selectMyDetailInfo(member_id);
	}

}
