package com.projectQ.conf.order.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.projectQ.conf.order.vo.OrderVO;

public interface OrderService {
	
	public void addNewOrder(List<OrderVO> myOrderList) throws DataAccessException;
	public void addmyOrderList(OrderVO orderVO) throws DataAccessException;
	
}
