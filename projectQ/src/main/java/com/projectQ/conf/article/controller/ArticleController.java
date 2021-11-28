package com.projectQ.conf.article.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.projectQ.conf.article.vo.ArticleVO;

public interface ArticleController {
	
	public ModelAndView articleMain(HttpServletRequest reqeust,HttpServletResponse response) throws Exception;
	public ModelAndView articleDetail(@RequestParam("article_id") int article_id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addMember(@ModelAttribute("articleVO") ArticleVO _articleVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public void DeleteArticle(@RequestParam("article_id") int article_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
