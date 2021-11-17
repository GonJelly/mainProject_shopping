package com.projectQ.conf.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.projectQ.conf.goods.vo.GoodsVO;
import com.projectQ.conf.order.vo.OrderVO;

public interface OrderController {
	
	public ModelAndView orderEachGoods(@ModelAttribute("orderVO") OrderVO _orderVO,HttpServletRequest request,HttpServletResponse response) throws Exception;
}
