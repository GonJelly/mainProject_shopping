package com.projectQ.conf.article.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface ArticleController {
	
	public ModelAndView articleMain(HttpServletRequest reqeust,HttpServletResponse response) throws Exception;
	public ModelAndView articleDetail(@RequestParam("article_id") int article_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
