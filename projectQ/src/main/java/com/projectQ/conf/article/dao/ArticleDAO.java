package com.projectQ.conf.article.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.projectQ.conf.article.vo.ArticleVO;

public interface ArticleDAO {
	
	public List<ArticleVO> selectsiderArticle() throws DataAccessException;
	public List<ArticleVO> selectAllArticle() throws DataAccessException;
}
