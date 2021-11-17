package com.projectQ.conf.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.projectQ.conf.common.base.baseController;
import com.projectQ.conf.order.vo.OrderVO;

@Controller("orderController")
@RequestMapping(value="/order")
public class OrderControllerImpl extends baseController implements OrderController{
	
	@Autowired
	OrderService orderService;
	@Autowired
	OrderVO orderVO;
	
	@Override
	@RequestMapping(value="/orderEachGoods.do" , method=RequestMethod.POST)
	public ModelAndView orderEachGoods(@ModelAttribute("orderVO") OrderVO _orderVO,HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		
		Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
		String action = (String) session.getAttribute("action");
		
		if( isLogOn == false && isLogOn.equals("")) {
			
			session.setAttribute("orderInfo", _orderVO);
			session.setAttribute("action","/order/orderEachGoods.do" );
			
			return new ModelAndView("redirect:/member/loginForm.jsp");
		} else {
			if(action != null && action.equals("/order/orderEachGoods.do")) {
				orderVO = (OrderVO) session.getAttribute("orderInfo");
				session.removeAttribute("action");
			} else {
				orderVO = _orderVO;
			}
		}
		
//		int goods_id = goodsVO.getGoods_id();
		List<OrderVO> myOrderList = new ArrayList<OrderVO>();
		myOrderList.add(orderVO);
		
		session.setAttribute("myOrderList",myOrderList);
		session.setAttribute("orderer",memberInfo);
		
		return mav;
	}
	
	
	
	
}
