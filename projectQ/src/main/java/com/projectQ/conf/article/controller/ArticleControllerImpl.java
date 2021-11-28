package com.projectQ.conf.article.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.projectQ.conf.article.service.ArticleService;
import com.projectQ.conf.article.vo.ArticleVO;
import com.projectQ.conf.common.base.baseController;
import com.projectQ.conf.member.vo.MemberVO;

@Controller("articleController")
@RequestMapping(value="/article")
public class ArticleControllerImpl extends baseController implements ArticleController{

	@Autowired
	ArticleService articleService;
	
	@Override
	@RequestMapping(value="/articleMain.do" , method= RequestMethod.GET)
	public ModelAndView articleMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		Map<String, List<ArticleVO>> articleMap = articleService.FindAllArticle();
		mav.addObject("articleMap",articleMap);
		
		return mav;
	}

	@Override
	@RequestMapping(value="articleDetail.do",method = RequestMethod.GET)
	public ModelAndView articleDetail(@RequestParam("article_id") int article_id, 
											HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		ArticleVO articleVO = articleService.boardDetailList(article_id);
		mav.addObject("article",articleVO);
		
		return mav;
	}

	@Override
	@RequestMapping(value="/addArticle.do",method= RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("articleVO") ArticleVO _articleVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		_articleVO.setMember_id(member_id);
		
		String message =null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			articleService.addArticle(_articleVO);
			message="<script>";
			message +="alert('게시판 등록이 완료외었습니다.');";
			message +="location.href='"+request.getContextPath()+"/article/articleMain.do';";
			message +="</script>";
		}catch(Exception e) {
			message ="<script>";
			message +="alert('작업 중 오류가 발생했습니다. 다시 시도해주세요.');";
			message +="location.href='"+request.getContextPath()+"/article/articleForm.do';";
			message +="</script>";
				e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value="/removeArticle.do" , method= RequestMethod.GET)
	public void DeleteArticle(@RequestParam("article_id") int article_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			articleService.removeArticle(article_id);
	}
	
	
}
