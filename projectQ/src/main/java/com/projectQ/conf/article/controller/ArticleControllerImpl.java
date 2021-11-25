package com.projectQ.conf.article.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.projectQ.conf.article.service.ArticleService;
import com.projectQ.conf.article.vo.ArticleVO;

@Controller("articleController")
@RequestMapping(value="/article")
public class ArticleControllerImpl implements ArticleController{

	@Autowired
	ArticleService articleService;
	
	@Override
	@RequestMapping(value="/articleMain.do" , method= RequestMethod.GET)
	public ModelAndView articleMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		List<ArticleVO> articleAllList = articleService.FindAllArticle();
		mav.addObject("articleAllList",articleAllList);
		
		return mav;
	}

	@Override
	@RequestMapping(value="articleDetail.do",method = RequestMethod.GET)
	public ModelAndView articleDetail(@RequestParam("article_id") int article_id, 
											HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		
		
		return mav;
	}
	
	
}
