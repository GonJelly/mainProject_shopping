package com.projectQ.conf.article.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.projectQ.conf.article.vo.ArticleVO;

@Repository("articleDAO")
public class ArticleDAOImpl implements ArticleDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ArticleVO> selectsiderArticle() throws DataAccessException {
		List<ArticleVO> siderArticleList = (ArrayList)sqlSession.selectList("mapper.article.selectSider");
		return siderArticleList;
	}

	@Override
	public List<ArticleVO> selectAllArticle() throws DataAccessException {
		List<ArticleVO> AllArticleList = (ArrayList)sqlSession.selectList("mapper.article.selectAllarticle");
		return AllArticleList;
	}

}
