package com.projectQ.conf.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.projectQ.conf.order.vo.OrderVO;

@Repository("orderDAO")
public class OrderDAOImpl implements OrderDAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void insertNewOrder(List<OrderVO> orderList) throws DataAccessException {
		
		int order_id = selectOrderID();
		for(int i = 0; i < orderList.size(); i++) {
			OrderVO orderVO = orderList.get(i);
			orderVO.setOrder_id(order_id);
			sqlSession.insert("mapper.order.insertNewOrder", orderVO);
		}
	}
	
	private int selectOrderID() throws DataAccessException{
		
		return sqlSession.selectOne("mapper.order.selectOrderID");
	}

	@Override
	public void removeOrderList(List<OrderVO> orderList) throws DataAccessException {
		
		for(int i =0; i < orderList.size();i++) {
			OrderVO orderVO = (OrderVO) orderList.get(i);
			sqlSession.delete("mapper.order.deleteOrderList",orderVO);
		}

		
	}

}
