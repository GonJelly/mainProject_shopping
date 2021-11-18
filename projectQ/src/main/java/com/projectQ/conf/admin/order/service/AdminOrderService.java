package com.projectQ.conf.admin.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.projectQ.conf.order.vo.OrderVO;

public interface AdminOrderService {
	public List<OrderVO> listNewOrder(Map condMap) throws Exception;
	public void modifyDeliveryState(Map deliveryMap) throws Exception;
	public Map orderDetail(int order_id) throws Exception;
}
