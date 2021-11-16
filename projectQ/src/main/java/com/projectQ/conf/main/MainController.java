package com.projectQ.conf.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.projectQ.conf.common.base.baseController;
import com.projectQ.conf.goods.service.GoodsService;
import com.projectQ.conf.goods.vo.GoodsVO;

@Controller
public class MainController extends baseController{
	
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping(value="/main/main.do")
	public ModelAndView main(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
		
		String viewName = (String) multipartRequest.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		HttpSession session = multipartRequest.getSession();
		session.setAttribute("isLogOn", true);
		
//		Map<String,List<GoodsVO>> goodsMaps = goodsService.goodsList();
		
		return mav;
	}
}
