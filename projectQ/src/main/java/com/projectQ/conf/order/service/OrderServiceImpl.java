package com.projectQ.conf.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.projectQ.conf.order.dao.OrderDAO;
import com.projectQ.conf.order.vo.OrderVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderDAO orderDAO;
	
	@Override
	public void addNewOrder(List<OrderVO> myOrderList) throws DataAccessException {
		orderDAO.insertNewOrder(myOrderList);
		orderDAO.removeOrderList(myOrderList);
	}

}
