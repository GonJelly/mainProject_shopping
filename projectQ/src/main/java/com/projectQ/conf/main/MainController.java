package com.projectQ.conf.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.projectQ.conf.article.service.ArticleService;
import com.projectQ.conf.article.vo.ArticleVO;
import com.projectQ.conf.common.base.baseController;
import com.projectQ.conf.goods.service.GoodsService;
import com.projectQ.conf.goods.vo.GoodsVO;

@Controller
public class MainController extends baseController{
	
	@Autowired
	GoodsService goodsService;
	
	@Autowired
	ArticleService articleService;
	
	@RequestMapping(value={"/","/main/main.do"} , method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		session.setAttribute("side_menu", "user");
		List<ArticleVO> articleList = articleService.siderArticle();
		session.setAttribute("articleList", articleList);
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);

		
		Map<String,List<GoodsVO>> goodsMap = goodsService.goodsList();
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}
}
