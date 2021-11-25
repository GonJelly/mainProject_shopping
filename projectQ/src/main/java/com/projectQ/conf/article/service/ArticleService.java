package com.projectQ.conf.article.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.projectQ.conf.article.vo.ArticleVO;

public interface ArticleService {

	public List<ArticleVO> siderArticle() throws DataAccessException;
	public List<ArticleVO> FindAllArticle() throws DataAccessException;
	
}
