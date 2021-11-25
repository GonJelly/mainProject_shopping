package com.projectQ.conf.article.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.projectQ.conf.article.dao.ArticleDAO;
import com.projectQ.conf.article.vo.ArticleVO;

@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	ArticleDAO articleDAO;
	
	@Override
	public List<ArticleVO> siderArticle() throws DataAccessException {
		List<ArticleVO> articleList =  articleDAO.selectsiderArticle();
		return articleList;
	}

	@Override
	public List<ArticleVO> FindAllArticle() throws DataAccessException {
		
		List<ArticleVO> articleAllList = articleDAO.selectAllArticle();
		
		return articleAllList;
	}

}
