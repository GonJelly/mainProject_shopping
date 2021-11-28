package com.projectQ.conf.goods.controller;

import java.util.ArrayList;
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

import com.projectQ.conf.common.base.baseController;
import com.projectQ.conf.goods.service.GoodsService;
import com.projectQ.conf.goods.vo.GoodsVO;

import net.sf.json.JSONObject;

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
		
		boolean already_existed = false;
		List<GoodsVO> quickGoodsList = (ArrayList<GoodsVO>)session.getAttribute("quickGoodsList");
		
		if( quickGoodsList != null) {
			if(quickGoodsList.size() < 4) {
				for(int i =0; i<quickGoodsList.size();i++) {
					GoodsVO _goodsBean = (GoodsVO) quickGoodsList.get(i);
					if(goods_id.equals(_goodsBean.getGoods_id())) {
						already_existed=true;
						break;
					}
				}
				if(already_existed==false) {
					quickGoodsList.add(goodsVO);
				}
			} else {
				for(int j=0; j < quickGoodsList.size();j++) {
					GoodsVO _goodsDump = quickGoodsList.get(j);
					if(goods_id.equals(_goodsDump.getGoods_id())) {
						already_existed=true;
						break;
					}
				}
				if(already_existed == false) {
					for(int k=quickGoodsList.size(); k > 0;k--) {
						quickGoodsList.add(k, quickGoodsList.get(k-1));
						
					}
					quickGoodsList.add(0, goodsVO);
				}
			}
		} else {
			quickGoodsList = new ArrayList<GoodsVO>();
			quickGoodsList.add(goodsVO);
			
		}
		if(quickGoodsList.size() > 5) {
			session.setAttribute("quickGoodsListNum", 4);
		}
		session.setAttribute("quickGoodsList", quickGoodsList);

	}

	@Override
	@RequestMapping(value="/keywordSearch.do" , method=RequestMethod.GET ,produces = "application/text; charset=UTF-8")
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		keyword = keyword.toUpperCase();
		List<String> keywordList = goodsService.keywordSearch(keyword);
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);
		
		String jsonInfo = jsonObject.toString();
		
		return jsonInfo;
	}

	@Override
	@RequestMapping(value="/searchGoods.do", method = RequestMethod.GET)
	public ModelAndView searchGoods(@RequestParam("searchWord") String searchWord, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List<GoodsVO> goodsList = goodsService.goodsSearch(searchWord);
		
		mav.addObject("goodsList", goodsList);
	
		return mav;
	}

	@Override
	@RequestMapping(value="/goodsList.do" , method=RequestMethod.GET)
	public ModelAndView goodsList(@RequestParam("goods_sort") String goods_sort, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List<GoodsVO> goodsList = goodsService.searchSortGoods(goods_sort);
		mav.addObject("goodsList",goodsList);
		
		return mav;
	}
	
	
}
