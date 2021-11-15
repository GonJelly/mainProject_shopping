package com.projectQ.conf.goods.controller;

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

import com.projectQ.conf.common.base.baseController;
import com.projectQ.conf.goods.service.GoodsService;
import com.projectQ.conf.goods.vo.GoodsVO;

@Controller("goodsController")
@RequestMapping(value="/goods")
public class GoodsControllerImpl extends baseController implements GoodsController {
	
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping(value="/goodsDetail.do", method= RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam("goods_id") String goods_id, HttpServletRequest request, HttpServletResponse response) throws Exception{
	
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		Map goodsMap = goodsService.goodsDetailList(goods_id);
		mav.addObject("goodsMap", goodsMap);
		
		HttpSession session = request.getSession();
		GoodsVO goodsVO = (GoodsVO) goodsMap.get("goodsVO");
		
		addGoodsInQuick(goods_id, goodsVO,session);
		
		return mav;
	}
	
	private void addGoodsInQuick(String goods_id, GoodsVO goodsVO, HttpSession session) {
		
	}

	@Override
	@RequestMapping(value="/keywordSearch.do" , method=RequestMethod.GET)
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		return null;
	}

	@Override
	@RequestMapping(value="/searchGoods.do", method = RequestMethod.POST)
	public ModelAndView searchGoods(@RequestParam("searchWord") String searchWord, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		return null;
	}
}
