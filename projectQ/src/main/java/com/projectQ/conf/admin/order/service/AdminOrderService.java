package com.projectQ.conf.admin.order.service;

import java.util.List;
import java.util.Map;

public interface AdminOrderService {
	public List<OrderVO> listNewOrder(Map condMap) throws Exception;
	publci void modifyDeliveryState(Map deliveryMap) throws Exception;
	public Map orderDetail(int order_id) throws Exception;
}
