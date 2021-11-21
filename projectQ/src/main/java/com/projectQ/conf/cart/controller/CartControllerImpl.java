package com.projectQ.conf.cart.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.projectQ.conf.cart.service.CartService;
import com.projectQ.conf.cart.vo.CartVO;
import com.projectQ.conf.common.base.baseController;
import com.projectQ.conf.member.vo.MemberVO;

@Controller("cartController")
@RequestMapping(value="/cart")
public class CartControllerImpl extends baseController implements CartController{
	@Autowired
	CartService cartService;
	@Autowired
	CartVO cartVO;
	@Autowired
	MemberVO memberVO;
	
	@RequestMapping(value="/myCartList.do", method = RequestMethod.GET)
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		cartVO.setMember_id(member_id);
		//장바구니 페이지에 표시할 상품정보를 조회
		Map<String,List> cartMap = cartService.myCartList(cartVO);
		//장바구니목록을 세션에 저장
		session.setAttribute("cartMap", cartMap);
		return mav;
	}
	//전송된 상품번호를 받음
	@RequestMapping(value="/addGoodsInCart.do", method = RequestMethod.POST,produces="application/text; charset=utf-8")
	public @ResponseBody String addGoodsInCart(@RequestParam("goods_id") int goods_id,
												@RequestParam("order_goods_qty") int order_goods_qty,
												HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session= request.getSession();
		
		if(session.getAttribute("memberInfo") == null || session.getAttribute("memberInfo").equals("")) {
			return "alertLogin";
		}
		
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();

		cartVO.setMember_id(member_id);
		cartVO.setGoods_id(goods_id);
		cartVO.setCart_goods_qty(order_goods_qty);
		//상품번호가 장바구니 테이블에 있는지 조회
		boolean isAreadyExisted=cartService.findCartGoods(cartVO);
		System.out.println("isAreadyExisted"+isAreadyExisted);
		if(isAreadyExisted==true) {
			return "already_existed";
		}else {
			cartService.addGoodsInCart(cartVO);
			return "add_success";
		}
	}
	@RequestMapping(value="/modifyCartQty.do",method = RequestMethod.POST)
	public @ResponseBody String modifyCartQty(@RequestParam("goods_id") int goods_id,
			@RequestParam("cart_goods_qty") int cart_goods_qty, HttpServletRequest request, HttpServletResponse response)throws Exception{
		HttpSession session = request.getSession();
		memberVO=(MemberVO)session.getAttribute("memberInfo");
		String member_id=memberVO.getMember_id();
		cartVO.setGoods_id(goods_id);
		cartVO.setMember_id(member_id);
		cartVO.setCart_goods_qty(cart_goods_qty);
		boolean result=cartService.modifyCartQty(cartVO);
		
		if(result==true) {
			return "modify_success";
		}else {
			return "modify_failed";
		}
	}
	@RequestMapping(value="removeCartGoods.do",method = RequestMethod.POST)
	public ModelAndView removeCartGoods(@RequestParam("cart_id") int cart_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		cartService.removeCartGoods(cart_id);
		mav.setViewName("redirect:/cart/myCartList.do");
		return mav;
	}

}