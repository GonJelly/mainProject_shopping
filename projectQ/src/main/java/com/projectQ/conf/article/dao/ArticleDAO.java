package com.projectQ.conf.article.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.projectQ.conf.article.vo.ArticleVO;

public interface ArticleDAO {
	
	public List<ArticleVO> selectsiderArticle() throws DataAccessException;
	public List<ArticleVO> selectAllArticle(String article_sort) throws DataAccessException;
	public ArticleVO selectArticleDetail(int article_id) throws DataAccessException;
	public void insertNewarticle(ArticleVO articleVO) throws DataAccessException;
	public void deleteArticle(int article_id) throws DataAccessException;
}
