package com.projectQ.conf.article.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.projectQ.conf.article.vo.ArticleVO;

public interface ArticleService {

	public List<ArticleVO> siderArticle() throws DataAccessException;
	public Map<String, List<ArticleVO>> FindAllArticle() throws DataAccessException;
	public ArticleVO boardDetailList(int article_id) throws DataAccessException;
	public void addArticle(ArticleVO articleVO) throws DataAccessException;	
	public void removeArticle(int article_id) throws DataAccessException;
}
