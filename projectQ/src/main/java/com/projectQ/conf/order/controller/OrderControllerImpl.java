package com.projectQ.conf.order.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.projectQ.conf.common.base.baseController;
import com.projectQ.conf.goods.vo.GoodsVO;
import com.projectQ.conf.member.vo.MemberVO;
import com.projectQ.conf.order.service.OrderService;
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
		
		if( isLogOn == null || isLogOn == false) {
			
			session.setAttribute("orderInfo", _orderVO);
			session.setAttribute("action","/order/orderEachGoods.do" );
			
			return new ModelAndView("redirect:/member/loginForm.do");
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
//		orderService.addmyOrderList(orderVO);
		myOrderList.add(orderVO);
		
		session.setAttribute("myOrderList",myOrderList);
		session.setAttribute("orderer",memberInfo);
		
		return mav;
	}

	@Override
	@RequestMapping(value="/orderAllCartGoods.do" , method= RequestMethod.POST)
	public ModelAndView orderAllCartGoods(String[] cart_goods_qty, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		Map cartMap = (Map) session.getAttribute("cartMap");
		
		List<OrderVO> myOrderList = new ArrayList<OrderVO>();
		List<GoodsVO> myGoodsList = (List<GoodsVO>) cartMap.get("myGoodsList");
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		
		for(int i=0; i< cart_goods_qty.length; i++) {
			String[] cart_goods = cart_goods_qty[i].split(":");
			for(int j=0; j < myGoodsList.size() ; j++) {
				GoodsVO goodsVO = myGoodsList.get(j);
				int goods_id = goodsVO.getGoods_id();
				if(goods_id == Integer.parseInt(cart_goods[0])) {
					OrderVO _orderVO = new OrderVO();
					String goods_title = goodsVO.getGoods_title();
					int goods_sales_price = goodsVO.getGoods_sales_price();
					String goods_fileName = goodsVO.getGoods_fileName();
					
					_orderVO.setGoods_id(goods_id);
					_orderVO.setGoods_title(goods_title);
					_orderVO.setGoods_sales_price(goods_sales_price);
					_orderVO.setGoods_fileName(goods_fileName);
					_orderVO.setOrder_goods_qty(Integer.parseInt(cart_goods[1]));
					
					myOrderList.add(_orderVO);
				}
			}
		}
		session.setAttribute("myOrderList", myOrderList);
		session.setAttribute("orderer", memberVO);
		
		return mav;
	}

	@Override
	@RequestMapping(value="/payToOrderGoods.do" , method = RequestMethod.POST)
	public ModelAndView payToOrderGoods(@RequestParam Map<String, String> _receiverMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO) session.getAttribute("orderer");
		String member_id = memberVO.getMember_id();
		String orderer_name = memberVO.getMember_name();
		String orderer_hp = memberVO.getHp1() + memberVO.getHp2() + memberVO.getHp3();
		
		List<OrderVO> myOrderList = (List) session.getAttribute("myOrderList");
		
		for(int i =0; i < myOrderList.size();i++) {
			OrderVO orderVO=(OrderVO) myOrderList.get(i);
			orderVO.setMember_id(member_id);
			orderVO.setOrderer_name(orderer_name);
			orderVO.setOrderer_hp(orderer_hp);
			
			orderVO.setReceiver_hp1(_receiverMap.get("receiver_hp1"));
			orderVO.setReceiver_hp2(_receiverMap.get("receiver_hp2"));
			orderVO.setReceiver_hp3(_receiverMap.get("receiver_hp3"));
			orderVO.setReceiver_tel1(_receiverMap.get("receiver_tel1"));
			orderVO.setReceiver_tel2(_receiverMap.get("receiver_tel2"));
			orderVO.setReceiver_tel3(_receiverMap.get("receiver_tel3"));
			
			orderVO.setDelivery_address(_receiverMap.get("delivery_address"));
			orderVO.setDelivery_message(_receiverMap.get("delivery_message"));
			orderVO.setDelivery_method(_receiverMap.get("delivery_method"));
			orderVO.setGift_wrapping(_receiverMap.get("gift_wrapping"));
			orderVO.setPay_method(_receiverMap.get("pay_method"));
			orderVO.setCard_com_name(_receiverMap.get("card_com_name"));
			orderVO.setCard_pay_month(_receiverMap.get("card_pay_month"));
			orderVO.setPay_orderer_hp_num(_receiverMap.get("pay_orderer_hp_num"));
			orderVO.setOrderer_hp(orderer_hp);
			
			myOrderList.set(i,orderVO);
		}
		
		orderService.addNewOrder(myOrderList);
		session.setAttribute("myOrderList", myOrderList);
		session.setAttribute("myOrderInfo", _receiverMap);
		return mav;
	}
	
	
	
	
	
	
	
}
