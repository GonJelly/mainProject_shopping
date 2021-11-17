package com.projectQ.conf.order.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.projectQ.conf.order.vo.OrderVO;

public interface OrderDAO {
	
	public void insertNewOrder(List<OrderVO> orderList) throws DataAccessException;

}
